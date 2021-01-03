//
//  SWCategoryData.swift
//  PersonalExpenseTracker
//
//  Created by Senthuran on 12/20/20.
//

import Foundation

enum PETCategoryType {
    case expense
    case income

    var direction: Int {
        switch self {
        case .expense:
            return -1
        case .income:
            return +1
        }
    }
}

struct PETCategoryData {
    let title: String
    let identifier: String
    let icon: String
    let type: PETCategoryType
}

extension PETCategoryData {

    static var list: [PETCategoryData] {
        return PETCategoryData.expenseList + PETCategoryData.incomeList
    }

    static let expenseList: [PETCategoryData] = [
        PETCategoryData(
            title: "Foods & Drinks",
            identifier: "cat_expense_foods",
            icon: "fa-utensils",
            type: .expense
        ),
        PETCategoryData(
            title: "Groceries",
            identifier: "cat_expense_groceries",
            icon: "fa-shopping-cart",
            type: .expense
        ),
        PETCategoryData(
            title: "General",
            identifier: "cat_expense_general",
            icon: "fa-stream",
            type: .expense
        ),
        PETCategoryData(
            title: "Transport",
            identifier: "cat_expense_transport",
            icon: "fa-subway",
            type: .expense
        ),
        PETCategoryData(
            title: "Entertainment",
            identifier: "cat_expense_entertainment",
            icon: "fa-smile-beam",
            type: .expense
        ),
        PETCategoryData(
            title: "Personal Care",
            identifier: "cat_expense_care",
            icon: "fa-heartbeat",
            type: .expense
        ),
        PETCategoryData(
            title: "Bills",
            identifier: "cat_expense_bills",
            icon: "fa-file-invoice",
            type: .expense
        ),
        PETCategoryData(
            title: "Shopping",
            identifier: "cat_expense_shopping",
            icon: "fa-shopping-bag",
            type: .expense
        ),
        PETCategoryData(
            title: "Accommodation",
            identifier: "cat_expense_accommodation",
            icon: "fa-building",
            type: .expense
        ),
        PETCategoryData(
            title: "Housing",
            identifier: "cat_expense_housing",
            icon: "fa-paint-roller",
            type: .expense
        ),
        PETCategoryData(
            title: "Holidays",
            identifier: "cat_expense_holidays",
            icon: "fa-umbrella-beach",
            type: .expense
        ),
        PETCategoryData(
            title: "Lending",
            identifier: "cat_expense_lending",
            icon: "fa-hand-holding-usd",
            type: .expense
        )
    ]

    static let incomeList: [PETCategoryData] = [
        PETCategoryData(
            title: "Salary",
            identifier: "cat_income_salary",
            icon: "fa-suitcase",
            type: .income
        ),
        PETCategoryData(
            title: "General",
            identifier: "cat_income_general",
            icon: "fa-stream",
            type: .income
        ),
        PETCategoryData(
            title: "Gifts",
            identifier: "cat_income_gifts",
            icon: "fa-gift",
            type: .income
        ),
        PETCategoryData(
            title: "Sales",
            identifier: "cat_income_sales",
            icon: "fa-chart-bar",
            type: .income
        ),
        PETCategoryData(
            title: "Interests",
            identifier: "cat_income_interests",
            icon: "fa-coins",
            type: .income
        ),
        PETCategoryData(
            title: "Coupon",
            identifier: "cat_income_copuns",
            icon: "fa-money-bill-wave",
            type: .income
        ),
        PETCategoryData(
            title: "Supports",
            identifier: "cat_income_supports",
            icon: "fa-star",
            type: .income
        ),
        PETCategoryData(
            title: "Investments",
            identifier: "cat_income_investments",
            icon: "fa-piggy-bank",
            type: .income
        ),
        PETCategoryData(
            title: "Refunding Debt",
            identifier: "cat_income_refunding",
            icon: "fa-undo-alt",
            type: .income
        )
    ]
}

