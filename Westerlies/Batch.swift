//
//  Batch.swift
//  Westerlies
//
//  Created by Adam P Dostalik on 10/20/17.
//  Copyright © 2017 Adam P Dostalik. All rights reserved.
//

import Foundation

class Batch {
    
    private var _numberOfCases: Int = 0
    
    var numberOfCases:Int {
        get {
            return _numberOfCases
        }
        set {
            _numberOfCases = newValue
        }
    }
    
    init() {
    }
    
    init(cases: Int) {
        _numberOfCases = cases
    }
}
