//
// Created by 성준영 on 2020/12/31.
//

import Foundation

enum CookieError: Error {
    case NotExists(target: String)
}

class ErrorHandler {
    public static func handle(error: Error) {
        switch error {
        case CookieError.NotExists(let target):
            printError("\(target) is not exists")
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