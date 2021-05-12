//
//  DatePrintable.swift
//  MtpTask
//
//  Created by Can KOÇ on 12.05.2021.
//

import Foundation

protocol DatePrintable {
    func getDate(from timestampString: String?) -> String?
}

extension DatePrintable {
    
    func getDate(from timestampString: String?) -> String? {
        guard let string = timestampString, let timeStamp = Double(string) else { return nil }
        let date = Date(timeIntervalSince1970: timeStamp)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YYYY, EE"
        return dateFormatter.string(from: date)
    }
}
