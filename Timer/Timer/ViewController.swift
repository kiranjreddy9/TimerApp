//
//  ViewController.swift
//  Timer
//
//  Created by Kiran on 11/26/16.
//  Copyright © 2016 Kiran. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var celltableview: UITableView!
    @IBOutlet weak var TimerLabel: UILabel!
    @IBOutlet weak var PlayButton: UIButton!
    @IBOutlet weak var PauseButton: UIButton!
    
    var nos = [String]()
    var firstarray = [String]()
    var secondarray = [String]()
    
    
    
    
    var timer = NSTimer()
    var counter = 0.0
    var isRunning = false
    var serialno = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TimerLabel.text = "\(counter)"
        PlayButton.enabled  = true
        PauseButton.enabled = false
        self.celltableview.reloadData()
        self.celltableview.separatorStyle = .None
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
        nos = []
        firstarray = []
        secondarray = []
        serialno = 0
        self.celltableview.separatorStyle = .None
        self.celltableview.reloadData()
        isRunning = false
    }
    
    func updatetimer() {
        counter += 0.1
        TimerLabel.text = String(format: "%.1f", counter)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nos.count
    }
    
    @IBAction func Lapaction(sender: AnyObject) {
        
        if isRunning {
            serialno += 1
            if serialno >= 1 {
             self.celltableview.separatorStyle = .SingleLine
            }
            nos.append("\(serialno)")
            if(firstarray.count == 0) {
                firstarray.append("\(counter)")
            }
            else {
                let ans: Double = counter - Double(firstarray[firstarray.count - 1])!
                firstarray.append(String(format: "%.1f", ans))
            }
            secondarray.append(String(format: "%.1f",counter))
        }
        
        self.celltableview.reloadData()
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reusecell", forIndexPath: indexPath) as! TableViewCell
        cell.timerno.text = nos[nos.count - 1 - indexPath.row]
        cell.firsttimer.text = firstarray[firstarray.count - 1 - indexPath.row]
        cell.secondtimer.text = secondarray[secondarray.count - 1 - indexPath.row]

        return cell
    }
    
    
    
}

