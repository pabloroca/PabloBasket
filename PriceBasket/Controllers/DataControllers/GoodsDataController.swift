//
//  GoodsDataController.swift
//  PriceBasket
//
//  Created by Pablo Roca Rozas on 25/03/2017.
//  Copyright © 2017 PR2Studio. All rights reserved.
//

import Foundation
import RealmSwift

open class GoodsDataController: DefaultDataManager {
    
    /// initial setup
    open func setup() {
        let arrobjects = realm.objects(Goods.self)
        if arrobjects.isEmpty {
            do {
                try realm.safeWrite {
                    realm.add(Goods.init(id: 1, name: "Peas", price: 0.95, unittype: "Bag")!)
                    realm.add(Goods.init(id: 2, name: "Eggs", price: 2.10, unittype: "Dozen")!)
                    realm.add(Goods.init(id: 3, name: "Milk", price: 1.30, unittype: "Bottle")!)
                    realm.add(Goods.init(id: 4, name: "Beans", price: 0.73, unittype: "Can")!)
                }
            } catch let error as NSError {
                print("setup - Something went wrong: \(error.localizedDescription)")
            }
        }
    }
    
    open func readAll() -> [Goods] {
        return readAll(objectype: Goods.self) as? [Goods] ?? []
    }
    
    open func readforKey(id: Int) -> Goods? {
        if let goods = readFirstFor(objectype: Goods.self, predicate: NSPredicate(format: "id = %d", id)) as? Goods {
            return goods
        } else {
            return nil
        }
    }
    
    open func deleteAll() {
        do {
            try realm.safeWrite {
                realm.delete(readAll(objectype: Goods.self))
            }
        } catch let error as NSError {
            print("deleteAll - Something went wrong: \(error.localizedDescription)")
        }
    }

}

/// Factory method to create object
//
extension Goods {
    convenience init?(id: Int, name: String, price: Double, unittype: String) {
        self.init()
        
        self.id = id
        self.name = name
        self.price = price
        self.unittyoe = unittype
    }
}
