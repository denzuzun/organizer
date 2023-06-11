//
//  Date+.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 9.06.2023.
//

import Foundation
import UIKit

extension UIViewController {
    func formatingDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        let modelDate = formatter.string(from: date)
        return modelDate
    }
}
