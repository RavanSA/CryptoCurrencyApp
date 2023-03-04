//
//  Helpers.swift
//  CryptoCurrencyApp
//
//  Created by Revan Sadigli on 4.03.2023.
//

import UIKit
import CoreData


func showMessage(_ message: String, title: String?) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let ok = UIAlertAction(title: "OK", style: .default)
    alert.addAction(ok)
    
    if let view = UIApplication.shared.keyWindow?.rootViewController {
        view.present(alert, animated: true)
    }
}
