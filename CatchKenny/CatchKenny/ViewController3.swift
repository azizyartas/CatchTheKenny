import UIKit

class ViewController: UIViewController {

    var timer = Timer()
    var count = 10
    var score = 0
    var highScore = 0
    var timerCatch = Timer()
    var kennyArray = [UIImageView]()
    var interval = 0.0
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    
    @IBOutlet weak var kenny1: UIImageView!
    @IBOutlet weak var kenny2: UIImageView!
    @IBOutlet weak var kenny3: UIImageView!
    @IBOutlet weak var kenny4: UIImageView!
    @IBOutlet weak var kenny5: UIImageView!
    @IBOutlet weak var kenny6: UIImageView!
    @IBOutlet weak var kenny7: UIImageView!
    @IBOutlet weak var kenny8: UIImageView!
    @IBOutlet weak var kenny9: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TIMER
        timerLabel.text = "Time: \(count)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
        
        //SCORE
        scoreLabel.text = "Score: \(score)"
        let gesture1 = UITapGestureRecognizer(target: self, action: #selector(tapKenny)) //Kenny 1
        kenny1.isUserInteractionEnabled = true
        kenny1.addGestureRecognizer(gesture1)
        
        let gesture2 = UITapGestureRecognizer(target: self, action: #selector(tapKenny)) //Kenny 2
        kenny2.isUserInteractionEnabled = true
        kenny2.addGestureRecognizer(gesture2)
        
        let gesture3 = UITapGestureRecognizer(target: self, action: #selector(tapKenny)) //Kenny 3
        kenny3.isUserInteractionEnabled = true
        kenny3.addGestureRecognizer(gesture3)
        
        let gesture4 = UITapGestureRecognizer(target: self, action: #selector(tapKenny)) //Kenny 4
        kenny4.isUserInteractionEnabled = true
        kenny4.addGestureRecognizer(gesture4)
        
        let gesture5 = UITapGestureRecognizer(target: self, action: #selector(tapKenny)) //Kenny 5
        kenny5.isUserInteractionEnabled = true
        kenny5.addGestureRecognizer(gesture5)
        
        let gesture6 = UITapGestureRecognizer(target: self, action: #selector(tapKenny)) //Kenny 6
        kenny6.isUserInteractionEnabled = true
        kenny6.addGestureRecognizer(gesture6)
        
        let gesture7 = UITapGestureRecognizer(target: self, action: #selector(tapKenny)) //Kenny 7
        kenny7.isUserInteractionEnabled = true
        kenny7.addGestureRecognizer(gesture7)
        
        let gesture8 = UITapGestureRecognizer(target: self, action: #selector(tapKenny)) //Kenny 8
        kenny8.isUserInteractionEnabled = true
        kenny8.addGestureRecognizer(gesture8)
        
        let gesture9 = UITapGestureRecognizer(target: self, action: #selector(tapKenny)) //Kenny 9
        kenny9.isUserInteractionEnabled = true
        kenny9.addGestureRecognizer(gesture9)
        
        //HIGH SCORE
        let storedScore = UserDefaults.standard.object(forKey: "highscore")
        
        if let newScore = storedScore as? Int {
            highScore = newScore
            highScoreLabel.text = "High Score: \(highScore)"
        }
        
        //CATCH
        kennyArray = [kenny1, kenny2, kenny3, kenny4, kenny5, kenny6, kenny7, kenny8, kenny9]
        
        for x in kennyArray {
            x.isHidden = true
        }
        
        timerCatch = Timer.scheduledTimer(timeInterval: TimeInterval(interval), target: self, selector: #selector(catchKenny1), userInfo: nil, repeats: true)
        
    }
    
    @objc func timerFunc() {
        count -= 1
        timerLabel.text = "Time: \(count)"
        
        if count <= 0 {
            timer.invalidate()
            timerCatch.invalidate()
            
            let alert1 = UIAlertController(title: "Time's Over!", message: "Would you like to play again?", preferredStyle: .alert)
            let noButton = UIAlertAction(title: "No", style: .default) { UIAlertAction in
                
                self.kenny1.isUserInteractionEnabled = false
                self.kenny2.isUserInteractionEnabled = false
                self.kenny3.isUserInteractionEnabled = false
                self.kenny4.isUserInteractionEnabled = false
                self.kenny5.isUserInteractionEnabled = false
                self.kenny6.isUserInteractionEnabled = false
                self.kenny7.isUserInteractionEnabled = false
                self.kenny8.isUserInteractionEnabled = false
                self.kenny9.isUserInteractionEnabled = false
            }
            
            let replayButton = UIAlertAction(title: "Replay", style: .cancel) { UIAlertAction in
                
                self.count = 10
                self.score = 0
                self.scoreLabel.text = "Score: \(self.score)"
                self.timerLabel.text = "Time: \(self.count)"
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timerFunc), userInfo: nil, repeats: true)
                self.timerCatch = Timer.scheduledTimer(timeInterval: TimeInterval(self.interval), target: self, selector: #selector(self.catchKenny1), userInfo: nil, repeats: true)
                
            }
            
            alert1.addAction(noButton)
            alert1.addAction(replayButton)
            present(alert1, animated: true)
            
            if (score > highScore) {
                highScore = score
                highScoreLabel.text = "High Score: \(highScore)"
                UserDefaults.standard.set(highScore, forKey: "highscore")
            }
        }
    }
    
    @objc func tapKenny() {
        score += 1
        scoreLabel.text = "Score: \(score)"
    }
    
    @objc func catchKenny1() {
        
        for x in kennyArray {
            x.isHidden = true
        }
        
        let randomInt = Int.random(in: 0..<9)
        kennyArray[randomInt].isHidden = false
    }
}

