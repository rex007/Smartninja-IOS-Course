//
//  Status.swift
//  toDo
//
//  Created by Andraz Kuret on 1. 12. 15.
//  Copyright © 2015 Andraz Kuret. All rights reserved.
//

import Foundation

enum Status: UInt {
    case Adopted, Acquiree, Resolved, NoResponse, Agreement, Closed
    
    func toRawValue() -> UInt {
        switch (self){
        case .Adopted:
            return 0
        case .Acquiree:
            return 1
        case .Resolved:
            return 2
        case .NoResponse:
            return 3
        case .Agreement:
            return 4
        case .Closed:
            return 5
        }
    }
}
