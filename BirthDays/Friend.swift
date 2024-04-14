//
//  Friend.swift
//  BirthDays
//
//  Created by Robinson Thairu on 14/04/2024.
//

import Foundation
import SwiftData

@Model
class Friend {
    let name: String
    let birthDate: Date
    
    init(name: String, birthDate: Date) {
        self.name = name
        self.birthDate = birthDate
    }
    
    var isBirthdayToday: Bool {
        Calendar.current.isDateInToday(birthDate)
    }
}
