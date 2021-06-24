//
//  String+Extension.swift
//  NYTimes
//
//  Created by Irshad Qureshi on 23/06/2021.
//

import Foundation

extension String {
    func getformattedDate() -> String {
        let serverDateFormat = DateFormatter()
        serverDateFormat.dateFormat = "YYYY-MM-DD"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        
        guard let date = serverDateFormat.date(from: self) else { return self  }
        return dateFormatter.string(from: date)
    }
}
