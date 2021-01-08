//
//  NSLocale+Extensions.swift
//  PersonalExpenseTracker
//
//  Created by Senthuran on 12/20/20.
//

import Foundation

extension NSLocale {
    static var defaultCurrency: String {
        return UserDefaults.standard.string(forKey: UserDefaults.currencySymbolKey) ?? ""
    }

    static func setCurrencyCodeDefault(symbol: String) {
        UserDefaults.standard.set(symbol, forKey: UserDefaults.currencySymbolKey)
    }
}

