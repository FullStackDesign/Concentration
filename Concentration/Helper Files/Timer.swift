//
//  Timer.swift
//  Concentration
//
//  Created by Ricky on 9/23/18.
//  Copyright © 2018 Full Stack Design. All rights reserved.
//

import Foundation

struct Timer {
    private static var startTime: Date?

    static func startTimer() {
        if startTime == nil {
            print("Started new time")
            startTime = Date()
        } else {
            print("Timer.startTime is in use")
        }
    }

    static func endTimer() -> Double {
        if let initialTime = startTime {
            let endTime = Date()
            startTime = nil
            print("Ended time: \(endTime.timeIntervalSince(initialTime))")
            return endTime.timeIntervalSince(initialTime)
        } else {
            print("Make sure to start the timer first")
            return 0
        }
    }
}
