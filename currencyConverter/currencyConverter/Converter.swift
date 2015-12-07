//
//  Converter.swift
//  currencyConverter
//
//  Created by Andraz Kuret on 25. 10. 15.
//  Copyright © 2015 Andraz Kuret. All rights reserved.
//

import Foundation




class Converter {
    func convert(amount: Double, startCurrency: String, targetCurrency: Double) -> (convertedValue: Double, targetCurrency: Double) {
        let convertedValue = amount * targetCurrency
        return (convertedValue, targetCurrency)
    }
}