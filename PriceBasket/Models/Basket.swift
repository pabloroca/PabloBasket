//
//  Basket.swift
//  PriceBasket
//
//  Created by Pablo Roca Rozas on 25/03/2017.
//  Copyright © 2017 PR2Studio. All rights reserved.
//

import Foundation
import RealmSwift

public class Basket: Object {
    dynamic var fkid: Int = 0
    dynamic var units: Int = 0
}
