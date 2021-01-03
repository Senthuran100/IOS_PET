//
//  PETMonth.swift
//  PersonalExpenseTracker
//
//  Created by Senthuran on 12/20/20.
//

import Foundation

struct PETMonth {
    let year: Int
    let shortYear: Int
    let month: Int
    let title: String
    let shortTitle: String
    let currentYear: Bool

    var titleWithYear: String {
        return "\(title) \(year)"
    }

    var shortTitleWithYear: String {
        return "\(shortTitle) \(shortYear)"
    }

    var titleWithCurrentYear: String {
        return currentYear ? title : titleWithYear
    }

    var shortTitleWithCurrentYear: String {
        return currentYear ? shortTitle : shortTitleWithYear
    }
}

