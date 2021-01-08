//
//  ReportModel.swift
//  PersonalExpenseTracker
//
//  Created by Senthuran on 12/20/20.
//

import Foundation

class ReportModel {

    // swiftlint:disable:next function_body_length
    static func monthlyOveralInfo() -> [PETMonthlyOverall] {
        let model = Facade.share.model

        let (minDate, maxDate) = model.retrieveMinMaxDateInRecords()
        let monthYearList = Date.monthsBetweenDates(
            startDate: minDate,
            endDate: maxDate
        )
        let totalBudget = model.calculateTotalBudget()

        return monthYearList.compactMap {
            let numDays = Date.getDurationOfMonth(
                year: $0.year,
                month: $0.month,
                considerCurrent: true
            )
            let numDaysAll = Date.getDurationOfMonth(
                year: $0.year,
                month: $0.month,
                considerCurrent: false
            )

            let monthlyTotalCost = model.retrieveTotalMonth(
                year: $0.year,
                month: $0.month,
                type: .cost
            )
            let dailyAverageCost = monthlyTotalCost / Double(numDays)

            let monthlyTotalIncome = model.retrieveTotalMonth(
                year: $0.year,
                month: $0.month,
                type: .income
            )
            let dailyAverageIncome = monthlyTotalIncome / Double(numDays)

            let monthlyTotal = monthlyTotalIncome - monthlyTotalCost
            let dailyAverage = dailyAverageIncome - dailyAverageCost

            var items = [SWRecordRepresentation]()

            items.append(SWRecordRepresentation(
                type: .totalCost,
                value: monthlyTotalCost,
                recordType: .cost
            ))

            items.append(SWRecordRepresentation(
                type: .totalIncome,
                value: monthlyTotalIncome,
                recordType: .income
            ))

            items.append(SWRecordRepresentation(
                type: .total,
                value: monthlyTotal,
                recordType: .all
            ))

            if totalBudget > 0 {
                let monthlyTotalSave = totalBudget - monthlyTotalCost
                items.append(SWRecordRepresentation(
                    type: .totalSave,
                    value: monthlyTotalSave,
                    recordType: .all
                ))
            }

            items.append(SWRecordRepresentation(
                type: .dailyAverage,
                value: dailyAverage,
                recordType: .all
            ))

            items.append(SWRecordRepresentation(
                type: .dailyAverageCost,
                value: dailyAverageCost,
                recordType: .cost
            ))

            items.append(SWRecordRepresentation(
                type: .dailyAverageIncome,
                value: dailyAverageIncome,
                recordType: .income
            ))

            let monthlyForecast = dailyAverage * Double(numDaysAll)
            items.append(SWRecordRepresentation(
                type: .forcast,
                value: monthlyForecast,
                recordType: .all
            ))

            let monthlyForecastCost = dailyAverageCost * Double(numDaysAll)
            items.append(SWRecordRepresentation(
                type: .forcastCost,
                value: monthlyForecastCost,
                recordType: .cost
            ))

            let monthlyForecastIncome = dailyAverageIncome * Double(numDaysAll)
            items.append(SWRecordRepresentation(
                type: .forcastIncome,
                value: monthlyForecastIncome,
                recordType: .income
            ))

            return PETMonthlyOverall(month: $0, items: items)
        }
    }
}

struct PETMonthlyOverall {
    let month: PETMonth
    var items: [SWRecordRepresentation]
}

struct SWRecordRepresentation {
    let type: PETRepresentationType
    let value: Double
    let recordType: RecordType

    var label: String {
        return value.recordPresenter(for: recordType)
    }
}

enum PETRepresentationType: String {
    case totalCost = "Sum of Expenses"
    case totalIncome = "Sum of Income"
    case total = "Net Amount"
    case totalSave = "Net Savings"
    case dailyAverage = "Daily Average"
    case dailyAverageCost = "Daily Average Expenses"
    case dailyAverageIncome = "Daily Average Income"
    case forcast = "Monthly Prediction"
    case forcastCost = "Predicted Monthly Cost"
    case forcastIncome = "Predicted Monthly Income"
}

