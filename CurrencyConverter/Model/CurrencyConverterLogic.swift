//
//  CurrencyConverterLogic.swift
//  CurrencyConverter
//
//  Created by Patrick Parks on 11/24/24.
//

import Foundation

class CurrencyConverter {
    // Dictionary to store conversion rates (example rates)
    private let conversionRates: [String: Double] = [
        "GBP": 1.2629, // USD to Currency 1
        "Euros": 1.0552, // USD to Currency 2
        "Yen": 154.59, // USD to Currency 3
        "Franc": 0.89 // USD to Currency 4
    ]
    
    // Function to convert USD to a specific currency
    func convert(amountInUSD: Int, to currency: String) -> Double? {
        guard let rate = conversionRates[currency] else { return nil }
        return Double(amountInUSD) * rate
    }
    
    // Function to convert USD to multiple selected currencies
    func convert(amountInUSD: Int, for selectedCurrencies: [String: Bool]) -> [String: Double] {
        var convertedAmounts: [String: Double] = [:]
        
        for (currency, isSelected) in selectedCurrencies {
            if isSelected, let convertedAmount = convert(amountInUSD: amountInUSD, to: currency) {
                convertedAmounts[currency] = convertedAmount
            }
        }
        
        return convertedAmounts
    }
}
