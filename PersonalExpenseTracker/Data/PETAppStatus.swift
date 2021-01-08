//
//  SWAppStatus.swift
//  PersonalExpenseTracker
//
//  Created by Senthuran on 12/20/20.
//

import Foundation

enum PETAppUpdate {
    case unknown
    case noUpdate(current: String)
    case updated(old: String, current: String)

    static var status: PETAppUpdate {
        let defaults = UserDefaults.standard

        guard let currentVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String else {
            return .unknown
        }

        let previousVersionMayNil = defaults.string(forKey: "appVersion")
        defaults.set(currentVersion, forKey: "appVersion")

        guard let previousVersion = previousVersionMayNil else {
            return .updated(old: "0", current: currentVersion)
        }

        if previousVersion == currentVersion {
            return .noUpdate(current: currentVersion)
        } else {
            return .updated(old: previousVersion, current: currentVersion)
        }
    }
}

