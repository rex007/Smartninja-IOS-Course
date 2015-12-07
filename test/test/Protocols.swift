//
//  Protocols.swift
//  test
//
//  Created by Andraz Kuret on 22. 10. 15.
//  Copyright © 2015 Andraz Kuret. All rights reserved.
//

import Foundation

struct Kvadrat : Geometrija {
    var x : Double
    var y : Double
    var width : Double
    var height : Double
    
    func ploscina () -> Double {
        return width * height
    }
    
    mutating  func povecaj (faktor : Double){
        width *= faktor
        height *= faktor
    }
}

protocol Geometrija{
    func ploscina () -> Double
    
    mutating func povecaj (faktor: Double)
}


func printKvadrat () {
    var kvadrat1 = Kvadrat(x: 1.0, y: 10.0, width: 60, height: 60)
    var kvadrat2 = Kvadrat(x: 2.0, y: 15.5, width: 40, height: 40)
    
    print("Ploscina 1: \(kvadrat1.ploscina())")
    print("Ploscina 2: \(kvadrat2.ploscina())")
}


//   tako se shrani local data

//  NSUserDefaults.standardUserDefaults().setObject("Moona", forKey: "MoonaName")
//  NSUserDefaults.standardUserDefaults().synchronize()