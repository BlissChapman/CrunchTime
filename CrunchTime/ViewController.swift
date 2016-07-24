//
//  ViewController.swift
//  CrunchTime
//
//  Created by Bliss Chapman on 7/23/16.
//  Copyright © 2016 Bliss Chapman. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak private var timerDisplayLabel: UILabel!
    @IBOutlet weak private var startButton: UIButton!

    //MARK: Model

    private var stopwatch = Stopwatch()


    //MARK: View Controller Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction private func startTapped(_ sender: AnyObject) {
        if !stopwatch.isRunning {
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                if self.stopwatch.isRunning {
                    let minutes = String(format: "%02d", Int(self.stopwatch.elapsedTime / 60))
                    let seconds = String(format: "%02d", Int(self.stopwatch.elapsedTime.truncatingRemainder(dividingBy: 60)))
                    let tenthsOfSecond = String(format: "%02d", Int((self.stopwatch.elapsedTime * 10).truncatingRemainder(dividingBy: 10)))
                    self.timerDisplayLabel.text = "\(minutes):\(seconds):\(tenthsOfSecond)"
                } else {
                    timer.invalidate()
                }
            }
            stopwatch.start()
            startButton.setTitle("Stop", for: .normal)
        } else {
            startButton.setTitle("Start", for: .normal)
            stopwatch.stop()
        }
    }
}

