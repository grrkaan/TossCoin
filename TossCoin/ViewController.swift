//
//  ViewController.swift
//  TossCoin
//
//  Created by Kaan Sercan Görür on 18.09.2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var appTitle: UILabel!
    @IBOutlet weak var coinImage: UIImageView!
    @IBOutlet weak var flipButton: UIButton!
    @IBOutlet weak var coinLabel: UILabel!
    
    var flipFlag = false
    var timer : Timer!
    
    let rollSound = URL(fileURLWithPath: Bundle.main.path(forResource: "flip", ofType: "mp3")!)
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        flipButton.layer.cornerRadius = 15
        flipButton.layer.borderWidth = 1
        flipButton.layer.borderColor = UIColor.black.cgColor
        flipButton.titleLabel?.font = UIFont.init(name: "Papyrus", size: 18)
        coinLabel.font = UIFont.init(name: "Papyrus", size: 18)
    }
    
    
    @IBAction func flipButtonAction(_ sender: Any) {
        
        if(flipFlag){
            flipFlag = false
            flipButton.setTitle("Flip", for: .normal)
            timer.invalidate()
        }else {
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: rollSound)
                audioPlayer.play()
            } catch {
                // couldn't load file :(
            }
            
            
            flipFlag = true
            flipButton.setTitle("Stop", for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(changeCoinImage), userInfo: nil, repeats: true)
        }
    }
    
    @objc
    func changeCoinImage() {
        
        let randomNumber = Int.random(in: 0 ... 1)
        let randomString = randomNumber == 1 ? "Head" : "Tail"
        coinImage.image = UIImage(named: randomString)
        coinLabel.text = randomString
        
    }
    
    
    
}

