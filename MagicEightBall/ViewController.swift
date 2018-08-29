//
//  ViewController.swift
//  MagicEightBall
//
//  Created by Fleischauer, Joseph on 7/27/17.
//  Copyright © 2017 Fleischauer, Joseph. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var fortuneLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    
       //when buttonTapped do below
    @IBAction func buttonTapped(_ sender: UIButton) {
        getARandomResponse()
    }
    
    func getARandomResponse() {
        let randomNumber = Int(arc4random_uniform(5))
        //grab number 0, 1, 2, 3, 4 and link it to response
        
        var response = ""
        switch randomNumber {
        case 0:
            response = "fortune foggy"
        case 1:
            response = "go for it"
        case 2:
            response = "take a nap and think it over"
        case 3:
            response = "yes!"
        case 4:
            response = "NO!!!"
        default:
            print(randomNumber)
        }
//display response
        fortuneLabel.text = response
        let utterance = AVSpeechUtterance(string: response)
                let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
        let timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(disappearLabel), userInfo: nil, repeats: false)
    }

//when device shakes do below
//    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
//        if event?.subtype == UIEventSubtype.motionShake {
//            self.getARandomResponse()
//            print(getARandomResponse())
//        }
//        else {
//            print("Error")
//        }
//    }

    func disappearLabel() {
        fortuneLabel.text = ""
    }
   
    
}













