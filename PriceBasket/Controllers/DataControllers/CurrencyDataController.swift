//
//  CurrencyDataController.swift
//  PriceBasket
//
//  Created by Pablo Roca Rozas on 25/03/2017.
//  Copyright © 2017 PR2Studio. All rights reserved.
//

import Foundation
import RealmSwift

open class CurrencyDataController: DefaultDataManager {
    
    /// adding data from JSON
    open func addfromJSON(data: [String: Any], completionHandler: @escaping (_ success: Bool) -> Void) {
        
        self.deleteAll()
        
        guard let results = data["currencies"] as? [String: AnyObject] else {
            completionHandler(false)
            return
        }
        
        do {
            try realm.safeWrite {
                for (key, value) in results {
                    self.realm.add(Currency.init(id: key, name: value as! String)!)
                }
                completionHandler(true)
                // set timestamp
                SettingsDataController().setTSforCurrency()
            }
        } catch let error as NSError {
            print("setup - Something went wrong: \(error.localizedDescription)")
        }
    }

    open func readAll() -> [Currency] {
        return self.readAll(objectype: Currency.self) as? [Currency] ?? []
    }

    open func readAllSorted() -> [Currency] {
        let arrCurrency = self.readAll(objectype: Currency.self) as? [Currency] ?? []
        let sortedArray = arrCurrency.sorted { ($0["id"] as? String)! < ($1["id"] as? String)! }
//        let sortedArray = (arrCurrency as NSArray).sortedArray(using: [NSSortDescriptor(key: "id", ascending: true)]) as! [Currency]
        return sortedArray
    }

    open func nameforCurrency(currency: String) -> String {
        if let currency = self.readFirstFor(objectype: Currency.self, predicate: NSPredicate(format: "id = %@", currency)) as? Currency {
            return currency.name
        } else {
            return ""
        }
    }
    
    open func deleteAll() {
        do {
            try realm.safeWrite {
                realm.delete(self.readAll(objectype: Currency.self))
            }
        } catch let error as NSError {
            print("deleteAll - Something went wrong: \(error.localizedDescription)")
        }
    }

}

/// Factory method to create object
//
extension Currency {
    convenience init?(id: String, name: String) {
        self.init()
        
        self.id = id
        self.name = name
    }
}
