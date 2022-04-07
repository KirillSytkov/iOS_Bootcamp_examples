
import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel?
    @IBOutlet weak var adviceLabel: UILabel?
    
    
    var result: String?
    var advice: String?
    var color: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.resultLabel?.text = result
        self.adviceLabel?.text = advice
        self.view.backgroundColor = color
    }

    @IBAction func buttonPresed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
