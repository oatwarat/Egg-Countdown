//
//  ViewController.swift
//  Egg Countdown
//
//  Created by Warat Poovorakit on 11/3/2567 BE.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes: [String: Int] = ["Soft": 300, "Medium": 420, "Hard": 540]
    var remainingTime: Int = 0
    var totalTime: Int = 0
    var timer: Timer?
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        titleLabel.text = "Progressing..."
        progressBar.progress = 0
        let hardnessEggs = sender.currentTitle!
        guard let time = eggTimes[hardnessEggs] else {
            return
        }
        startTimer(with: time)
    }
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    func startTimer(with time: Int) {
        remainingTime = time
        totalTime = time
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimerLabel), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimerLabel() {
        if remainingTime > 0 {
            remainingTime -= 1
            let progress = 1.0 - Double(remainingTime) / Double(totalTime)
            progressBar.progress = Float(progress)
        } else {
            timer?.invalidate()
            titleLabel.text = "Done!!"
        }
    }
    
}
