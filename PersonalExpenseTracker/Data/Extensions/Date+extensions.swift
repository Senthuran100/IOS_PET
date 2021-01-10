//
//  Date+extensions.swift
//  PersonalExpenseTracker
//
//  Created by Senthuran on 12/20/20.
//

import Foundation

extension Date {
    static func randomDate(range: Int) -> Date {
        // Get interval for date
        let interval =  Date().timeIntervalSince1970

        // Multiplying by 86400 (i.e millisecond in a day)
        let intervalRange = Double(86_400 * range)

        // Select a random point within the interval range
        let random = Double(arc4random_uniform(UInt32(intervalRange)) + 1)

        // Since this can either be in the past or future, we shift the range
        // so that the halfway point is the present
        let newInterval = interval + (random - (intervalRange / 2.0))
        // Initialize a date value with our newly created interval

        return Date(timeIntervalSince1970: newInterval)
    }

    static func monthsBetweenDates(
        startDate: Date?,
        endDate: Date?,
        currentDate: Date = Date()) -> [PETMonth] {

        var mothYearData = [PETMonth]()

        guard let startDate = startDate, let endDate = endDate else { return mothYearData }

        for year in startDate.year() ... endDate.year() {
            let monthStartIndex = year == startDate.year() ? startDate.month() : 1
            let monthEndIndex = year < endDate.year() ? 12 : endDate.month()

            for month in monthStartIndex ... monthEndIndex {
                let monthTitle = DateFormatter.monthFormatter.monthSymbols[month - 1]
                let shortMonthTitle = DateFormatter.monthFormatter.shortMonthSymbols[month - 1]
                let shortYear = String(String(year).suffix(2))
                mothYearData.append(
                    PETMonth(
                        year: year,
                        shortYear: Int(shortYear) ?? 0,
                        month: month,
                        title: monthTitle,
                        shortTitle: shortMonthTitle,
                        currentYear: year == currentDate.year()
                    )
                )
            }
        }

        return mothYearData
    }

    func month() -> Int {
        let month = Calendar.current.component(.month, from: self)
        return month
    }

    func day() -> Int {
        let day = Calendar.current.component(.day, from: self)
        return day
    }
    
    func year() -> Int {
        let year = Calendar.current.component(.year, from: self)
        return year
    }

    func startOfMonth() -> Date {
        let day = Calendar.current.startOfDay(for: self)
        return Calendar.current.date(
            from: Calendar.current.dateComponents([.year, .month], from: day))!
    }

    func endOfMonth() -> Date {
        return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth())!
    }

    func dateOnly() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.none
        dateFormatter.dateStyle = DateFormatter.Style.short
        let dateString = dateFormatter.string(from: self)

        return dateFormatter.date(from: dateString)!
    }

    //method that is used to get the duration of month.
    static func getDurationOfMonth(year: Int,
                          month: Int,
                          considerCurrent: Bool,
                          currentDate: Date = Date()) -> Int {

        guard !(considerCurrent && year == currentDate.year() && month == currentDate.month()) else {
            return currentDate.day()
        }

        let dateComponents = DateComponents(year: year, month: month)
        let calendar = Calendar.current
        let date = calendar.date(from: dateComponents)!

        let range = calendar.range(of: .day, in: .month, for: date)!
        return range.count
    }

    func dayRepresentation() -> String {
        let calendar = Calendar.current
        if calendar.isDateInToday(self) {
            return "Today"
        } else if calendar.isDateInYesterday(self) {
            return "Yesterday"
        } else if calendar.isDate(Date(), equalTo: self, toGranularity: .weekOfYear) {
            let formatter = DateFormatter()
            let weekday = calendar.component(.weekday, from: self)
            return formatter.weekdaySymbols[weekday-1]
        } else {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            return formatter.string(from: self)
        }
    }

}

