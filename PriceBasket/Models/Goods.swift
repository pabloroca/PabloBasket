//
//  Goods.swift
//  PriceBasket
//
//  Created by Pablo Roca Rozas on 25/03/2017.
//  Copyright © 2017 PR2Studio. All rights reserved.
//

import Foundation
import RealmSwift

public class Goods: Object {
    dynamic var id: Int = 0
    dynamic var name: String = ""
    dynamic var price: Double = 0
    dynamic var unittyoe: String = ""
}
