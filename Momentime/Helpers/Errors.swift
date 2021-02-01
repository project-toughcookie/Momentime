//
// Created by 성준영 on 2020/12/31.
//

import Foundation

enum CookieError: Error {
    case NotExists(target: String)
    case UnAuthorized
    case DateCannotBeConverted
    case TaskUpdateFailed
}

enum ErrorHandler {
    public static func handle(error: Error) {
        switch error {
        case let CookieError.NotExists(target):
            printError("\(target) is not exists")
        case CookieError.UnAuthorized:
            printError("unathorized")
        case CookieError.DateCannotBeConverted:
            printError("date cannot be converted")
        case CookieError.TaskUpdateFailed:
            printError("failed to update task")
        default:
            printError("unknown error")
        }
    }

    private static func printError(_ error: String) {
        for symbol: String in Thread.callStackSymbols {
            print(symbol)
        }
        print("cookies error: \(error)")
    }
}
