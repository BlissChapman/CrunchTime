//
//  Stopwatch.swift
//  CrunchTime
//
//  Created by Bliss Chapman on 7/23/16.
//  Copyright © 2016 Bliss Chapman. All rights reserved.
//

import Foundation


struct Stopwatch {

    private var startTime: NSDate?

    var elapsedTime: TimeInterval {
        guard let startTime = self.startTime else {
            return 0
        }

        return -startTime.timeIntervalSinceNow
    }

    var isRunning: Bool {
        return startTime != nil
    }

    mutating func start() {
        startTime = NSDate()
    }

    mutating func stop() {
        startTime = nil
    }
}
