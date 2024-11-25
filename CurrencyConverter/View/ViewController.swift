//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Patrick Parks on 11/24/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var poundsSwitch: UISwitch!
    @IBOutlet weak var euroSwitch: UISwitch!
    @IBOutlet weak var yenSwitch: UISwitch!
    @IBOutlet weak var francSwitch: UISwitch!
    @IBOutlet weak var converButton: UIButton!
    
    var usdAmount: Int?
    var selectedCurrencies: [String: Bool] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.isHidden = true
    }
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let usdText = inputField.text, let usd = Int(usdText), usd > 0 else {
            errorLabel.text = "Please enter a USD amount."
            errorLabel.isHidden = false
            return
        }
        
        // Store data
        usdAmount = usd
        selectedCurrencies = [
            "GBP": poundsSwitch.isOn,
            "Euros": euroSwitch.isOn,
            "Yen": yenSwitch.isOn,
            "Franc": francSwitch.isOn
        ]
        
        // Perform segue
        performSegue(withIdentifier: "showConvertedValues", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showConvertedValues" {
            let destinationVC = segue.destination as! ConvertedValuesViewController
            destinationVC.usdAmount = usdAmount
            destinationVC.selectedCurrencies = selectedCurrencies
        }
    }
}


