//
//  Converter.swift
//  smartNinja-converter
//
//  Created by Andraz Kuret on 26. 10. 15.
//  Copyright © 2015 Andraz Kuret. All rights reserved.
//

import Foundation

class Converter{
    func convert(amount: Double, startCurrency: Currency, targetCurrency: Currency) -> (Double, Double) {
        return( amount * startCurrency.rate * targetCurrency.rate, startCurrency.rate * targetCurrency.rate )
    }
}