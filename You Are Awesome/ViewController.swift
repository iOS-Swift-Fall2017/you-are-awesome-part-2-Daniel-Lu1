//
//  ViewController.swift
//  You Are Awesome
//
//  Created by Daniel Lu on 9/5/17.
//  Copyright © 2017 Daniel Lu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var messageLabel: UILabel!
    var index = 0
    
    @IBAction func messageButton(_ sender: Any) {
        let messages = ["You Are Fantastic!",
                        "You Are Great!",
                        "You Are Amazing!",
                        "You Are Da Best!",
                        "I Am Loving It!",
                        "Thank You So Much!"]
        
        var newIndex = -1
        
        repeat {
            newIndex = Int(arc4random_uniform(UInt32(messages.count)))
        } while index == newIndex
        
        index = newIndex
        messageLabel.text = messages[index]
        
        // var randomIndex = Int(arc4random_uniform(UInt32(messages.count)))
        // messageLabel.text = messages[randomIndex]
        /* messageLabel.text = messages[index]
        index += 1
        
        
        if index == messages.count {
            index = 0
        }*/
        
        // let message1 = "You Are Fantastic!"
        // let message2 = "You Are Great!"
        // let message3 = "You Are Amazing!"
        //
        // if messageLabel.text == message1 {
        //   messageLabel.text = message2
        // } else if messageLabel.text == message2{
        //   messageLabel.text = message3
        // else {
        //   messageLabel.text = message1
        // }
    }
    

}

