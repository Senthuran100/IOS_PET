//
//  AddModel.swift
//  PersonalExpenseTracker
//
//  Created by Senthuran on 12/20/20.
//

import Foundation

class AddRecordModel {
    var amount: Double = 0
    var datetime = Date()
    var direction = 0
    var note: String?
    var reported: Bool?
    var uid: String?
    var expenseIndex = 0
    var incomeIndex = 0
    var accountIndex = 0
}

