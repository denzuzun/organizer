//
//  Alert+.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 10.06.2023.
//

import Foundation
import UIKit


extension UIViewController{
    func displayAlert(message: String) {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.5) {
                let alert = UIAlertController(title: "BILGI", message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "TAMAM", style: .default))
                self.present(alert, animated: true)
            }
        }
    }
}
