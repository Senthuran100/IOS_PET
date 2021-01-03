//
//  Facade.swift
//  PersonalExpenseTracker
//
//  Created by Senthuran on 12/20/20.
//

import Foundation

class Facade {
    static let share = Facade()
    let model = PersistentModel()

    private init() {
//        print("Facade - init")
    }
}
