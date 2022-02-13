//
//  String + Date.swift
//  iosApp
//
//  Created by Kirill Presnyakov on 13.02.2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import Foundation

extension Date {
    func formatToString(_ format: String) -> String {
        let formatter = DateFormatter()
        let locale = Calendar.current.locale
        
        formatter.dateFormat = format
        formatter.locale = locale
        
        return formatter.string(from: self)
    }
}
