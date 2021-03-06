//
//  DataManager.swift
//  Four
//
//  Created by Pablo Roca Rozas on 19/3/17.
//  Copyright © 2017 PR2Studio. All rights reserved.
//

import Foundation
import RealmSwift

/// Class to control Realm versioning
public class DataManager {
    
    func setUpLocalStorage(completionHandler: @escaping (_ success: Bool) -> Void) {
        migrateStorage()
        
        GoodsDataController().setup()
        SettingsDataController().setup()
        
        // addinf a minor delay for allowing to have the data setup
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            completionHandler(true)
        }
        
    }
    
    func migrateStorage() {
        // Inside your application(application:didFinishLaunchingWithOptions:)
        
        let config = Realm.Configuration(
            // Set the new schema version. This must be greater than the previously used
            // version (if you've never set a schema version before, the version is 0).
            schemaVersion: 0,
            
            // Set the block which will be called automatically when opening a Realm with
            // a schema version lower than the one set above
            migrationBlock: { migration, oldSchemaVersion in
                // We haven’t migrated anything yet, so oldSchemaVersion == 0
                if (oldSchemaVersion < 1) {
                    // Nothing to do!
                    // Realm will automatically detect new properties and removed properties
                    // And will update the schema on disk automatically
                    //                    migration.enumerate(FONSettings.className(), { (_, newObject) in
                    //                        newObject!["userState"] = "ACTIVE"
                    //                    })
                }
        })
        
        // Tell Realm to use this new configuration object for the default Realm
        Realm.Configuration.defaultConfiguration = config
        
        // Now that we've told Realm how to handle the schema change, opening the file
        // will automatically perform the migration
        //let realm = try! Realm()
    }
    
}
