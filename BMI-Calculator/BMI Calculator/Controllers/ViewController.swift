
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weghtLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func heightSliderPressed(_ sender: UISlider) {
        self.heightLabel.text = String(format: "%.2fm", sender.value)
    }
    
    @IBAction func weightSliderPressed(_ sender: UISlider) {
        self.weghtLabel.text = String(format: "%.0fKg", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = self.heightSlider.value
        let weight = self.weightSlider.value
        calculatorBrain.calculateBMI( height: height, weight: weight)
        
        guard let controller = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
        controller.result = calculatorBrain.getBMIvalue()
        controller.modalPresentationStyle = .fullScreen
        controller.advice = calculatorBrain.getAdvice()
        controller.color = calculatorBrain.getColor()
        present(controller, animated: true, completion: nil)
    }
}

