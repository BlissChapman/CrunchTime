//
//  SimpleStopwatch.swift
//  CrunchTime
//
//  Created by Dee Chapman on 11/8/15.
//  Copyright © 2015 Bliss Chapman. All rights reserved.
//

import Foundation


class SimpleStopwatch {
    
    //MARK: Data
    private var startTime: NSDate?
    
    var elapsedTime: NSTimeInterval {
        guard let startTime = self.startTime else {
            return 0
        }
    
        return -startTime.timeIntervalSinceNow
    }
    
    var elapsedTimeAsString: String {
        return String(format: "%02d:%02d.%d",
            Int(elapsedTime / 60), Int(elapsedTime % 60), Int(elapsedTime * 10 % 10))
    }
    
    var isRunning: Bool {
        return startTime != nil
    }
    
    //MARK: Behavior
    func start() {
        startTime = NSDate()
    }
    
    func stop() {
        startTime = nil
    }
    
}