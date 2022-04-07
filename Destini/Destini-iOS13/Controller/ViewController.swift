
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var story = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        story.getAnswer((sender.titleLabel?.text)!)
        updateUI()
    }
    
    func updateUI() {
        self.storyLabel.text = story.getNewStory()
        self.choice1Button.setTitle(story.getFirstChoice(), for: .normal)
        self.choice2Button.setTitle(story.getSecondChoice(), for: .normal)
    }
}

