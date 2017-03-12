//
//  ViewController.swift
//  MathRush
//
//  Created by Ifeoluwa King on 06/08/2016.
//  Copyright © 2016 Ifeoluwa King. All rights reserved.
//

import UIKit
import AVFoundation

var fullScore:Int!
var noOfQstns:Int!
class ViewController: UIViewController, AVAudioPlayerDelegate {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var numberLabel1: CustomLabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var numberLabel2: CustomLabel!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var optionOne: CustomButton!
    @IBOutlet weak var optionTwo: CustomButton!
    @IBOutlet weak var optionThree: CustomButton!
    
    
    var soundPlayer: AVAudioPlayer?
    
    let url = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("swish", ofType: "mp3")!)
    
    var gameState = 0
    var score = 0
    var counter = 30
    var timer = NSTimer()
    var ans:String?
    var qstns:Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playBtn.layer.cornerRadius = 10
        scoreLabel.text = "0 Points"
        timeLabel.text = "30 secs"
    }
    


    
    @IBAction func gameStart(sender: AnyObject) {
        gameState = 1
        scoreLabel.hidden = false
        timeLabel.hidden = false
        self.numberLabel1.hidden = false
        self.numberLabel2.hidden = false
        self.operatorLabel.hidden = false
        self.optionOne.hidden = false
        self.optionTwo.hidden = false
        self.optionThree.hidden = false
        playBtn.hidden = true
        
        do {
            try soundPlayer = AVAudioPlayer(contentsOfURL: url)
            soundPlayer?.delegate = self
            soundPlayer?.prepareToPlay()
            
        } catch let error as NSError {
            
            print("audioPlayer error \(error.localizedDescription)")
            
        }
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.timing), userInfo: nil, repeats: true)
        
        
        ans = prepareGame(soundPlayer!)
    }
    
    @IBAction func btnPressed(sender:UIButton) {
        if gameState == 1 {
            
            qstns = qstns + 1
            UIView.animateWithDuration(1.5, delay: 0, options: [], animations: {
                sender.layer.backgroundColor = UIColor.init(red: 95/255, green: 186/255, blue: 125/255, alpha: 1.0).CGColor
                
            }) { (Bool) in
                sender.layer.backgroundColor = UIColor.init(red: 62/255, green: 176/255, blue: 226/255, alpha: 1.0).CGColor
                
            }
            
            
            
            if sender.currentTitle == ans {
                score = score+1
                scoreLabel.text = "\(score) Points"
                
            }else{
                score = score - 2
                scoreLabel.text = "\(score) Points"
            }
            fullScore = score
            noOfQstns = qstns
            animateGame(numberLabel1, l2: numberLabel2, l3: operatorLabel)

            
        }
        
    }
    
    func prepareGame(sound:AVAudioPlayer)-> String {
        let game = Game()
        
        let theOperator = game.getSymbol()
        sound.play()
        sound.volume = 0.1
        
       // scoreLabel.text = "0 Points"
        //timeLabel.text = "30 secs"
        
        game.setGame(numberLabel1, l2: numberLabel2)
        operatorLabel.text = theOperator
        game.setPossibleAns(optionOne, b2: optionTwo, b3: optionThree)
        
        
        return String(game.ans)
        
    }
    
    func timing() {
        if(counter != 0){
            counter = counter - 1
            timeLabel.text = "\(counter) secs"
            
        }else {
            
            gameState = 0
            score = 0
            counter = 30
            scoreLabel.hidden = true
            self.numberLabel1.hidden = true
            self.numberLabel2.hidden = true
            self.operatorLabel.hidden = true
            self.optionOne.hidden = true
            self.optionTwo.hidden = true
            self.optionThree.hidden = true
            timeLabel.text = ""
            scoreLabel.text = "0 Points"
            
            
            playBtn.hidden = false
            
            self.performSegueWithIdentifier("score", sender: nil)
            timer.invalidate()
            
            
            
        }
    }
    
    func animateGame(l1:UILabel,l2:UILabel,l3:UILabel) {

        UIView.animateWithDuration(1.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 4, options:[], animations: {
            l1.center.x += 200
            l2.center.x -= 200
            }, completion: nil)
        self.ans = self.prepareGame(self.soundPlayer!)

    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.7, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [.CurveEaseIn, .Repeat,.Autoreverse], animations: {
            self.numberLabel1.transform = CGAffineTransformMakeScale(1.2, 1.2)
            self.numberLabel2.transform = CGAffineTransformMakeScale(1.2, 1.2)
            
            }, completion: nil)
    }


}

