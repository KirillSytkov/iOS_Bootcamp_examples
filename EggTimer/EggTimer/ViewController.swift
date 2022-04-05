
import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var mainTitle: UILabel!

    var player: AVAudioPlayer?
    var timer = Timer()
    var eggTime = ["Soft": 3, "Medium": 4, "Hard": 7]
    var totalTime = 0
    var secondsPassed = 0
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()
        
        
    }
    @IBAction func eggPressed(_ sender: UIButton) {
        guard let hardness = sender.currentTitle else { return }
        timer.invalidate()
        progressBar.progress = 0
        secondsPassed = 0
        mainTitle.text = hardness
        totalTime = eggTime[hardness]!
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
        } else {
            timer.invalidate()
            playSound()
            mainTitle.text = "Done"
        }
        
    }
    
}
