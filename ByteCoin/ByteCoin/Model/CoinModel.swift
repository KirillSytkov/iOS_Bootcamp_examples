
import Foundation

struct CoinModel {
    let rate: Double
    
    var coinString: String {
        return String(format: "%.3f", rate)
    }
}
