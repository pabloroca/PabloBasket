//
//  ExchangeDataController.swift
//  PriceBasket
//
//  Created by Pablo Roca Rozas on 25/03/2017.
//  Copyright © 2017 PR2Studio. All rights reserved.
//

import Foundation
import RealmSwift

open class ExchangeDataController: DefaultDataManager {
    
    /// adding data from JSON
    open func addfromJSON(data: [String: Any], completionHandler: @escaping (_ success: Bool) -> Void) {
        
        self.deleteAll()

        guard let results = data["quotes"] as? [String: AnyObject] else {
            completionHandler(false)
            return
        }
        
        do {
            try realm.safeWrite {
                for (key, value) in results {
                    if let value = value as? Double {
                        let last3 = key.substring(from:key.index(key.endIndex, offsetBy: -3))
                        self.realm.add(CurrencyExchange.init(id: last3, exchange: value)!)
                    }
                }
                completionHandler(true)
                // set timestamp
                SettingsDataController().setTSforExchange()
            }
        } catch let error as NSError {
            print("setup - Something went wrong: \(error.localizedDescription)")
        }
    }

    open func readExchangeFor(currency: String) -> Double {
        if let currencyexchange = self.readFirstFor(objectype: CurrencyExchange.self, predicate: NSPredicate(format: "id = %@", currency)) as? CurrencyExchange {
            return currencyexchange.exchange
        } else {
            return 0.0
        }
    }
    
    open func deleteAll() {
        do {
            try realm.safeWrite {
                realm.delete(self.readAll(objectype: CurrencyExchange.self))
            }
        } catch let error as NSError {
            print("deleteAll - Something went wrong: \(error.localizedDescription)")
        }
    }
}

/// Factory method to create object
//
extension CurrencyExchange {
    convenience init?(id: String, exchange: Double) {
        self.init()
        
        self.id = id
        self.exchange = exchange
    }
}
