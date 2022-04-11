
import UIKit

class CalculatorViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    
    //MARK: - vars/lets
    var tip = 0.1
    var peopleCount = 1
    var amount:Double = 0.0
    var result: Double = 0
    //MARK: - lyfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    //MARK: - IBActions
    @IBAction func tipChange(_ sender: UIButton) {
        tenPctButton.isSelected = false
        zeroPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
         let buttonTitle = sender.currentTitle!
         
         let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
         
         let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
         
         tip = buttonTitleAsANumber / 100
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        self.splitNumberLabel.text = String(format: "%.0f", sender.value)
        self.peopleCount = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if billTextField.text != "" {
            self.amount = Double(billTextField.text!)!
            result = (amount * (1 + tip)) / Double(peopleCount)
        }
        
        guard let controller = storyboard?.instantiateViewController(withIdentifier: "ResultsViewController") as? ResultsViewController else { return }
        controller.modalPresentationStyle = .popover
        controller.result = String(format: "%.2f", result)
        controller.people = peopleCount
        controller.billPercent = tip
        present(controller, animated: true, completion: nil)
    }
    
    
    //MARK: - flow func
    
    

}

