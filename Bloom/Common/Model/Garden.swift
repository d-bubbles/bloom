//
//  Garden.swift
//  Bloom
//
//  Created by Dinara Shadyarova on 2/7/21.
//  Copyright © 2021 dinarashadyarova. All rights reserved.
//

import UIKit

struct Garden {
    let section: Int
    let number: Int
    let creationDate: Date
    let finishDate: Date
    var totalFlowers: Int
    var durationMode: Duration
    
    var description: String {
        switch durationMode {
        case .amountOfFlowers(let amount):
            return "\(totalFlowers)/\(amount) (\(amount - totalFlowers) flowers left)"
        case .forever:
            return "No limit"
        case .date(let date):
            return "Til \(date)"
        case .period(let days):
            return "some/\(days) (Some days left)"
        }
    }
    
    var status: String {
        switch durationMode {
        case .amountOfFlowers(let amount):
            return "\(totalFlowers)/\(amount)"
        case .forever:
            return ""
        case .date(let date):
            return "1/30"
        case .period(let days):
            return "1/\(days)"
        }
    }
    
    var durationModeStyle: DurationModeStyle {
        switch durationMode {
        case .amountOfFlowers:
            return DurationModeStyle(image: UIImage(named: "flowerMode")!, bgColor: Color.coral)
        case .forever:
            return DurationModeStyle(image: UIImage(named: "foreverMode")!, bgColor: Color.lightBlue)
        case .date, .period:
            return DurationModeStyle(image: UIImage(named: "timeMode")!, bgColor: Color.lightGreen)
        }
    }
}
