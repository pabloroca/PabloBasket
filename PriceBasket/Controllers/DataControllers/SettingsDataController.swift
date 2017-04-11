//
//  SettingsDataController.swift
//  PriceBasket
//
//  Created by Pablo Roca Rozas on 25/03/2017.
//  Copyright © 2017 PR2Studio. All rights reserved.
//

import Foundation
import RealmSwift

open class SettingsDataController: DefaultDataManager {
    
    /// initial setup
    public func setup() {
        let arrobjects = realm.objects(Settings.self)
        if arrobjects.isEmpty {
            do {
                try realm.safeWrite {
                    realm.add(Settings.init(currencyselected: Constants.defaultCurency, tscurrency: 0, tsexchange: 0)!)
                }
            } catch let error as NSError {
                print("setup - Something went wrong: \(error.localizedDescription)")
            }
        }
    }
    
    // MARK: - Common funcs

    public func readFirst() -> Settings? {
        return readFirst(objectype: Settings.self) as? Settings
    }
    
    /// setTSforCurrency
    public func setTSforCurrency() {
        if let result = readFirst(objectype: Settings.self) as? Settings {
            do {
                try realm.safeWrite {
                    result.tscurrency = Date().timeIntervalSince1970
                }
            } catch let error as NSError {
                print("setup - Something went wrong: \(error.localizedDescription)")
            }
        }
    }

    /// setTSforExchange
    public func setTSforExchange() {
        if let result = readFirst(objectype: Settings.self) as? Settings {
            do {
                try realm.safeWrite {
                    result.tsexchange = Date().timeIntervalSince1970
                }
            } catch let error as NSError {
                print("setup - Something went wrong: \(error.localizedDescription)")
            }
        }
    }

    /// setDefaultCurrency
    public func setDefaultCurrency(currency: String) {
        if let result = readFirst(objectype: Settings.self) as? Settings {
            do {
                try realm.safeWrite {
                    result.currencyselected = currency
                }
            } catch let error as NSError {
                print("setup - Something went wrong: \(error.localizedDescription)")
            }
        }
    }

    /// setDefaultCurrencyToDefault
    public func setDefaultCurrencyToDefault() {
        setDefaultCurrency(currency: Constants.defaultCurency)
    }
    
    public func keyforCurrencySelected() -> String {
        if let settings = readFirst() {
            return settings.currencyselected
        } else {
            return ""
        }
    }
    
    public func nameforCurrencySelected() -> String {
        if let settings = readFirst() {
            return CurrencyDataController().nameforCurrency(currency: settings.currencyselected)
        } else {
            return ""
        }
    }

    open func deleteAll() {
        do {
            try realm.safeWrite {
                realm.delete(readAll(objectype: Settings.self))
            }
        } catch let error as NSError {
            print("deleteAll - Something went wrong: \(error.localizedDescription)")
        }
    }
}

/// Factory method to create object
//

extension Settings {
    convenience init?(currencyselected: String, tscurrency: Double, tsexchange: Double) {
        self.init()
        
        self.currencyselected = currencyselected
        self.tscurrency = tscurrency
        self.tsexchange = tsexchange
    }
}
