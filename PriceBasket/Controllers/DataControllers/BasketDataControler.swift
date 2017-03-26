//
//  BasketDataControler.swift
//  PriceBasket
//
//  Created by Pablo Roca Rozas on 25/03/2017.
//  Copyright © 2017 PR2Studio. All rights reserved.
//

import Foundation
import RealmSwift

open class BasketDataControler: DefaultDataManager {
    
    open func readforKey(fkid: Int) -> Basket? {
        if let basket = self.readFirstFor(objectype: Basket.self, predicate: NSPredicate(format: "fkid = %d", fkid)) as? Basket {
            return basket
        } else {
            return nil
        }
    }
    
    open func update(fkid: Int, units: Int) {
        do {
            try realm.safeWrite {
                if let basket = self.readforKey(fkid: fkid) {
                    basket.units = units
                } else {
                    self.realm.add(Basket.init(fkid: fkid, units: units)!)
                }
            }
        } catch let error as NSError {
            print("setup - Something went wrong: \(error.localizedDescription)")
        }
    }

    open func calculateBasket() -> Double {
        let arrBasket = self.readAll(objectype: Basket.self) as? [Basket] ?? []
        var total: Double = 0
        let currency = SettingsDataController().keyforCurrencySelected()
        let exchange = ExchangeDataController().readExchangeFor(currency: currency)
        
        for item in arrBasket {
            if let good = GoodsDataController().readforKey(id: item.fkid) {
                total = total + Double(item.units)*good.price*exchange
            }
        }
        return total
    }
    
    open func readAll() -> [Basket] {
        return self.readAll(objectype: Basket.self) as? [Basket] ?? []
    }
    
    open func deleteAll() {
        do {
            try realm.safeWrite {
                realm.delete(self.readAll(objectype: Basket.self))
            }
        } catch let error as NSError {
            print("deleteAll - Something went wrong: \(error.localizedDescription)")
        }
    }

}

/// Factory method to create object
//
extension Basket {
    convenience init?(fkid: Int, units: Int) {
        self.init()
        
        self.fkid = fkid
        self.units = units
    }
}
