
import Foundation

protocol CoinManagerDelegate {
    func didUpdateCoin(price: String, currency: String)
    func didFailWithError(error: Error)
}

struct CoinManager {
    var delegate: CoinManagerDelegate?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "C63BBEBE-FCF0-45FE-B9CB-493143D569C5"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(for currency: String) {
        guard let url = URL(string: "\(baseURL)/\(currency)?apikey=\(apiKey)") else { return }
        let session = URLSession(configuration: .default)

        let task = session.dataTask(with: url) { data, response, error in
            if error != nil {
                self.delegate?.didFailWithError(error: error!)
                return
            }
            if let data = data {
                if let price = self.parseJSON(data) {
                    let priceString = String(format: "%.2f", price)
                    self.delegate?.didUpdateCoin(price: priceString, currency: currency)
                }
            }
            
        }
        task.resume()
    }
    
    func parseJSON(_ coinData: Data) -> Double? {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(CoinData.self, from: coinData)
            let rate = decodeData.rate
            return rate
        } catch {
            self.delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}
