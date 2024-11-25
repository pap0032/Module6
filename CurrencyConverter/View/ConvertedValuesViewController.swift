//
//  ConvertedValuesViewController.swift
//  CurrencyConverter
//
//  Created by Patrick Parks on 11/24/24.
//

import UIKit

class ConvertedValuesViewController: UIViewController {
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var poundsLabel: UILabel!
    @IBOutlet weak var euroLabel: UILabel!
    @IBOutlet weak var yenLabel: UILabel!
    @IBOutlet weak var francLabel: UILabel!
    
    var usdAmount: Int?
    var selectedCurrencies: [String: Bool] = [:]
    private let currencyConverter = CurrencyConverter()

    override func viewDidLoad() {
            super.viewDidLoad()
            guard let usdAmount = usdAmount else { return }
            usdLabel.text = "Amount in USD: \(usdAmount)"
            
            // Use the CurrencyConverter to calculate the amounts
            let convertedAmounts = currencyConverter.convert(amountInUSD: usdAmount, for: selectedCurrencies)
            
            // Update labels based on selected currencies
            if selectedCurrencies["GBP", default: false] {
                poundsLabel.text = "GBP: \(convertedAmounts["GBP"] ?? 0.0)"
            } else {
                poundsLabel.isHidden = true
            }
            
            if selectedCurrencies["Euros", default: false] {
                euroLabel.text = "Euros: \(convertedAmounts["Euros"] ?? 0.0)"
            } else {
                euroLabel.isHidden = true
            }
            
            if selectedCurrencies["Yen", default: false] {
                yenLabel.text = "Yen: \(convertedAmounts["Yen"] ?? 0.0)"
            } else {
                yenLabel.isHidden = true
            }
            
            if selectedCurrencies["Franc", default: false] {
                francLabel.text = "Franc: \(convertedAmounts["Franc"] ?? 0.0)"
            } else {
                francLabel.isHidden = true
            }
        }
    }
