//
//  ViewController.swift
//  Timer
//
//  Created by Kiran on 11/26/16.
//  Copyright © 2016 Kiran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TimerLabel: UILabel!
    @IBOutlet weak var PlayButton: UIButton!
    @IBOutlet weak var PauseButton: UIButton!
    
    var timer = NSTimer()
    var counter = 0.0
    var isRunning = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TimerLabel.text = "\(counter)"
        PlayButton.enabled  = true
        PauseButton.enabled = false
    }
    

    @IBAction func PlayButtonAction(sender: AnyObject) {
        
        if !isRunning {
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(ViewController.updatetimer), userInfo: nil, repeats: true)
            
            PlayButton.enabled = false
            PauseButton.enabled = true
            isRunning = true
        }
    }
    
    @IBAction func PauseButtonAction(sender: AnyObject) {
        timer.invalidate()
        PauseButton.enabled = false
        PlayButton.enabled = true
        isRunning = false
    }
    
    @IBAction func ResetAction(sender: AnyObject) {
        timer.invalidate()
        PlayButton.enabled = true
        PauseButton.enabled = false
        counter = 0.0
        TimerLabel.text = "\(counter)"
    }
    
    func updatetimer() {
        counter += 0.1
        TimerLabel.text = String(format: "%.1f", counter)
    }
}

