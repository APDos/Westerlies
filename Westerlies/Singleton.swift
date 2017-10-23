//
//  Singleton.swift
//  Westerlies
//
//  Created by Adam P Dostalik on 10/20/17.
//  Copyright © 2017 Adam P Dostalik. All rights reserved.
//

import Foundation
import GoogleAPIClientForREST

class Singleton {
    static let main = Singleton()
    var batchList = [Batch]()
    let service = GTLRSheetsService()
    var currentBatch = Batch()
}
