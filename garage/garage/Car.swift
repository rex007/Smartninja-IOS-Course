//
//  Car.swift
//  garage
//
//  Created by Andraz Kuret on 18. 11. 15.
//  Copyright © 2015 Andraz Kuret. All rights reserved.
//

import Foundation

class Car : NSObject {
    let brand: String
    let model: String
    let yearBoth: Int
    
    init(brand: String, model: String, yearBoth: Int){
        self.brand = brand
        self.model = model
        self.yearBoth = yearBoth
    }
}
