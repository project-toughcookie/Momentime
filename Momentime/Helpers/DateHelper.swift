//
// Created by 성준영 on 2021/01/13.
//

import Foundation

class DateHelper {
    class func date(year: Int, month: Int, day: Int, hour: Int = 0, minute: Int = 0, seconds: Int = 0) throws -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        if let date = formatter.date(from: "\(year)-\(month)-\(day) \(hour):\(minute):\(seconds)") {
            return date
        }

        throw CookieError.DateCannotBeConverted
    }

    class func hourAfter(hour: Int, from baseDate: Date) throws -> Date {
        let hoursToAdd = hour
        var dateComponents = DateComponents()
        dateComponents.hour = hoursToAdd
        if let date = Calendar.current.date(byAdding: dateComponents, to: baseDate) {
            return date
        }

        throw CookieError.DateCannotBeConverted
    }
}
