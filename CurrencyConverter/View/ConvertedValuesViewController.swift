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

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let usd = usdAmount else { return }
        
        usdLabel.text = "Amount in USD: \(usd)"
        
        let conversionRates = [
            "GBP": 1.2629,
            "Euros": 1.0552,
            "Yen": 154.59,
            "Franc": 0.89
        ]
        
        poundsLabel.isHidden = !selectedCurrencies["GBP"]!
        euroLabel.isHidden = !selectedCurrencies["Euros"]!
        yenLabel.isHidden = !selectedCurrencies["Yen"]!
        francLabel.isHidden = !selectedCurrencies["Franc"]!
        
        if selectedCurrencies["GBP"]! {
            poundsLabel.text = "GBP: \(Double(usd) * conversionRates["GBP"]!)"
        }
        if selectedCurrencies["Euros"]! {
            euroLabel.text = "Euros: \(Double(usd) * conversionRates["Euros"]!)"
        }
        if selectedCurrencies["Yen"]! {
            yenLabel.text = "Yen: \(Double(usd) * conversionRates["Yen"]!)"
        }
        if selectedCurrencies["Franc"]! {
            francLabel.text = "Franc: \(Double(usd) * conversionRates["Franc"]!)"
        }
    }
}
