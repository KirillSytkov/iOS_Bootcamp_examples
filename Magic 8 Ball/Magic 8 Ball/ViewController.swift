
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ballImageVIew: UIImageView!
    
    let ballArray = [#imageLiteral(resourceName: "ball1"), #imageLiteral(resourceName: "ball2"), #imageLiteral(resourceName: "ball3.png"), #imageLiteral(resourceName: "ball4.png"), #imageLiteral(resourceName: "ball5.png")]


    @IBAction func rollButtonPressed(_ sender: UIButton) {
        ballImageVIew.image = ballArray.randomElement()
    }
    
}

