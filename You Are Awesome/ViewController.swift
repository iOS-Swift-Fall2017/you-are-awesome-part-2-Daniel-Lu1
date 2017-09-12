//
//  ViewController.swift
//  You Are Awesome
//
//  Created by Daniel Lu on 9/5/17.
//  Copyright © 2017 Daniel Lu. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    // MARK: - Functions
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer) {
        if let sound = NSDataAsset(name: "sound\(soundNumber)") {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("ERROR: data in sound could not be played")
            }
        } else {
            print("ERROR: sound file didn't load")
        }
    }
    
    func randomNum(previousNum: Int, upperBound: Int) -> Int {
        var newIndex = -1
        repeat {
            newIndex = Int(arc4random_uniform(UInt32(upperBound)))
        } while newIndex == previousNum
        return newIndex
    }
    //MARK: - Properties
    @IBOutlet weak var soundSwitch: UISwitch!
    @IBOutlet weak var awesomeImage: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    
    var awesomePlayer = AVAudioPlayer()
    var index = -1
    var imageNumber = -1
    var soundNumber = -1
    let numberofImages = 5
    let numberofSounds = 3
    
    // MARK: - Actions
    @IBAction func soundSwitchPressed(_ sender: UISwitch) {
        if !soundSwitch.isOn && soundNumber != -1 {
            //stop all sound immediately if there is sound playing and switch is pressed
            awesomePlayer.stop()
        }
    }
    
    @IBAction func messageButton(_ sender: Any) {
        let messages = ["You Are Fantastic!",
                        "You Are Great!",
                        "You Are Amazing!",
                        "You Are Da Best!",
                        "I Am Loving It!",
                        "Thank You So Much!"]
        
        //show message
        index = randomNum(previousNum: index, upperBound: messages.count)
        messageLabel.text = messages[index]
        
        //show image
        awesomeImage.isHidden = false
        imageNumber = randomNum(previousNum: imageNumber, upperBound: numberofImages)
        awesomeImage.image = UIImage(named: "erlich\(imageNumber)")
        
        //play audio
        if soundSwitch.isOn {
            soundNumber = randomNum(previousNum: soundNumber, upperBound: numberofSounds)
            let soundName = "sound\(soundNumber)"
            playSound(soundName: soundName, audioPlayer: &awesomePlayer)
        }

    }
}

