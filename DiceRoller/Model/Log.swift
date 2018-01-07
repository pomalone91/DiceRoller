//
//  Log.swift
//  DiceRoller
//
//  Created by Paul Malone on 1/6/18.
//  Copyright © 2018 stroggi. All rights reserved.
//

import Foundation

class Log {
    var roll: String
    var result: Int
    var timeStamp: String
    
    // Initializer
    init(roll: String, result: Int) {
        self.roll = roll
        self.result = result
        
        // Get the current time and format it
        let now = Date()
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "yyy-MM-dd HH:mm"
        self.timeStamp = formatter.string(from: now)
    }
}
