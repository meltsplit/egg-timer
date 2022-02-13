import UIKit

import AVFoundation

class ViewController: UIViewController {
    
    let eggTimes: Dictionary<String,Int> = ["Soft":3, "Medium": 4, "Hard": 7]
    var player: AVAudioPlayer!
    
    var secondPassed = 0
    var totalTime = 0
    var timer = Timer()
    
    @IBOutlet weak var progressedBar: UIProgressView!
    @IBOutlet weak var doneLabel: UILabel!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        progressedBar.progress = 0.0
        secondPassed = 0
        doneLabel.text = sender.currentTitle!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self,selector: #selector(updateTimer),userInfo: nil,repeats: true)
        
        
    }
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound" , withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    @objc func updateTimer() {
        if secondPassed < totalTime{
            secondPassed += 1
            progressedBar.progress = Float(secondPassed) / Float(totalTime)
            
        }
        else{
            timer.invalidate()
            doneLabel.text = "Done"
            playSound()
        }
        
        
    }
    
}



