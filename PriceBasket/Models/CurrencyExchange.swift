//
//  CurrencyExchange.swift
//  PriceBasket
//
//  Created by Pablo Roca Rozas on 25/03/2017.
//  Copyright © 2017 PR2Studio. All rights reserved.
//

import Foundation
import RealmSwift

public class CurrencyExchange: Object {
    dynamic var id: String = ""
    dynamic var exchange: Double = 0
}
