
import UIKit

class ResultsViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    //MARK: - vars/lets
    var result: String = ""
    var people = 1
    var billPercent:Double = 0
    
    //MARK: - lyfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    //MARK: - IBActions
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    //MARK: - flow func
    func updateUI() {
        let percent = billPercent * 100
        self.settingsLabel.text = "Split between \(people) people, with \(percent)% tip."
        self.totalLabel.text = result
    }
    
}
