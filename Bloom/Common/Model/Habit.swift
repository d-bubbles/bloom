//
//  Habit.swift
//  Bloom
//
//  Created by Dinara Shadyarova on 2/7/21.
//  Copyright © 2021 dinarashadyarova. All rights reserved.
//

import UIKit

struct Habit {
    var name: String
    var gardens: [Garden]
    var creationDate: Date
    
    var currentDurationMode: Duration {
        return gardens.last!.durationMode
    }
    
    var currentDurationModeStyle: DurationModeStyle {
        return gardens.last!.durationModeStyle
    }
    
    var currentStatus: String {
        return gardens.last!.status
    }
    
    var description: String {
        return gardens.last!.description
    }
    
    var totalFlowers: Int {
        var result = 0
        gardens.forEach { result += $0.totalFlowers }
        return result
    }
}
