//
//  NumberFormatter.swift
//  CryptoCurrencyApp
//
//  Created by Revan Sadigli on 5.03.2023.
//

import Foundation

extension Double {
    
    
    private var curMapper: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 3
        return formatter
    }
    
   
    private var numMapper: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 3
        return formatter
    }
    
    
    func toCur() -> String {
        return curMapper.string(for: self) ?? ""
    }
    
    
    func toPerc() -> String {
        return (numMapper.string(for: self) ?? "0") + "%"
    }
    
    
}
