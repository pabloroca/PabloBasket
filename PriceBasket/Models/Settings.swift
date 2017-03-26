//
//  Settings.swift
//  PriceBasket
//
//  Created by Pablo Roca Rozas on 25/03/2017.
//  Copyright © 2017 PR2Studio. All rights reserved.
//

import Foundation
import RealmSwift

public class Settings: Object {
    dynamic var currencyselected: String = ""
    dynamic var tscurrency: Double = 0
    dynamic var tsexchange: Double = 0
}
