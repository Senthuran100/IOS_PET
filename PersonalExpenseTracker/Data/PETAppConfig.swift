//
//  PETAppConfig.swift
//  PersonalExpenseTracker
//
//  Created by Senthuran on 12/20/20.
//

import Foundation

enum PETAppConfig {
    static var isSnapshot: Bool {
        return UserDefaults.standard.bool(forKey: UserDefaults.snapshotKey)
    }
}

