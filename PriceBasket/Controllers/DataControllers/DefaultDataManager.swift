//
//  DefaultDataManager.swift
//  PriceBasket
//
//  Created by Pablo Roca Rozas on 25/03/2017.
//  Copyright © 2017 PR2Studio. All rights reserved.
//

import Foundation
import RealmSwift

open class DefaultDataManager {
    var realm: Realm = try! Realm()

    // MARK: - Common funcs
    
    open func readAll(objectype: Object.Type) -> [Object] {
        let results = realm.objects(objectype.self)
        return(Array(results))
    }
    
    open func readFirst(objectype: Object.Type) -> Object? {
        if let result = realm.objects(objectype.self).first {
            return result
        } else {
            return nil
        }
    }

    open func readFirstFor(objectype: Object.Type, predicate: NSPredicate) -> Object? {
        if let result = realm.objects(objectype.self).filter(predicate).first {
            return result
        } else {
            return nil
        }
    }

    open func deleteAll(objectype: Object.Type) {
        do {
            try realm.safeWrite {
                realm.delete(readAll(objectype: Object.self))
            }
        } catch let error as NSError {
            print("deleteAll - Something went wrong: \(error.localizedDescription)")
        }
    }

}
