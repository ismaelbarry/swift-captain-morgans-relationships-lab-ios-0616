//
//  DataStore.swift
//  swift-captain-morgans-relationships-lab
//
//  Created by Ismael Barry on 7/24/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation
import CoreData

class DataStore {
    
     // Because this is a "static let" we call this specific variable without having to instatiate a version or actual instance of DataStore. When we call DataStore.sharedDataStore(), we create one single instance of data store. Thus, anywhere in our code, we can all any functions from DataStore and be working within the same exact object context.
    static let sharedDataStore = DataStore()

    // Create a public Array property to hold your fetched ship objects:
    var ship : [Ship] = []
    
    // Create a public Array property to hold your fetched engine objects:
    var engine : [Engine] = []
    
    // Create a public Array property to hold your fetched priate objects:
    var pirate : [Pirate] = []
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        if managedObjectContext.hasChanges {
            // What we what to happen:
            do {
                try managedObjectContext.save()
                // What happens when we fail:
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    }
    
    // Implement fetchData() to create an NSFetchRequest, have your context execute it, and set the results to your ship array:
    func fetchShipData() {
        
        var error : NSError? = nil
        
        let shipRequest = NSFetchRequest(entityName: Ship.entityName)
        
        let nameSorter = NSSortDescriptor(key: "name", ascending: true)
        
        shipRequest.sortDescriptors = [nameSorter]
        
        // What we what to happen:
        do {
            
            self.ship = try managedObjectContext.executeFetchRequest(shipRequest) as! [Ship]
        
        // What happens when we fail:
        } catch {
            
            print("Fetching Ships does not work.")
            
        }
        // If your ships array is still empty, call generateTestData() and pass them again.
        if self.ship.count == 0 {
            
            self.generateTestData()
            
        }
    }
    
    // Implement fetchData() to create an NSFetchRequest, have your context execute it, and set the results to your engine array:
    func fetchEngineData() {
        
        var error : NSError? = nil
        
        let engineRequest = NSFetchRequest(entityName: Engine.entityName)
        
        let propulsionSorter = NSSortDescriptor(key: "propulsion", ascending: true)
        
        engineRequest.sortDescriptors = [propulsionSorter]
        
        // // What we what to happen:
        do {
            
            self.engine = try managedObjectContext.executeFetchRequest(engineRequest) as! [Engine]
         
        // What happens when we fail:
        } catch {
            
            print("Fetching Engine does not work.")
            
        }
        
        // If your engine array is still empty, call generateTestData() and pass them again.
        if self.engine.count == 0 {
            
            self.generateTestData()
            
        }
    }
    
    // Implement fetchData() to create an NSFetchRequest, have your context execute it, and set the results to your pirate array:
    func fetchPirateData() {
        
        var error : NSError? = nil
        
        let pirateRequest = NSFetchRequest(entityName: Pirate.entityName)
        
        let nameSorter = NSSortDescriptor(key: "name", ascending: true)
        
        pirateRequest.sortDescriptors = [nameSorter]
        
        // What we what to happen:
        do {
            
            self.pirate = try managedObjectContext.executeFetchRequest(pirateRequest) as! [Pirate]
         
        // What happens when we fail:
        } catch {
            
            print("Fetching Pirate does not work.")
            
        }
        
        // If your pirate array is still empty, call generateTestData() and pass them again.
        if self.pirate.count == 0 {
            
            self.generateTestData()
            
        }
    }
    
    // Create a few pirates, engines, and ships. Use NSEntityDescription class function insertNewObjectForEntityForName(_:inManagedObjectContext:)
    func generateTestData() {
    
        // -----Create 4 Pirates:
        
        let jackSparrow: Pirate = NSEntityDescription.insertNewObjectForEntityForName(Pirate.entityName, inManagedObjectContext: managedObjectContext) as! Pirate
        
        let chrisHarris: Pirate = NSEntityDescription.insertNewObjectForEntityForName(Pirate.entityName, inManagedObjectContext: managedObjectContext) as! Pirate
        
        let deadPool: Pirate = NSEntityDescription.insertNewObjectForEntityForName(Pirate.entityName, inManagedObjectContext: managedObjectContext) as! Pirate
        
        let batman: Pirate = NSEntityDescription.insertNewObjectForEntityForName(Pirate.entityName, inManagedObjectContext: managedObjectContext) as! Pirate
        
        
        // ------Create 4 Engines:
        
        let n54: Engine = NSEntityDescription.insertNewObjectForEntityForName(Engine.entityName, inManagedObjectContext: managedObjectContext) as! Engine
        
        
        let n55: Engine = NSEntityDescription.insertNewObjectForEntityForName(Engine.entityName, inManagedObjectContext: managedObjectContext) as! Engine
        
        let s65: Engine = NSEntityDescription.insertNewObjectForEntityForName(Engine.entityName, inManagedObjectContext: managedObjectContext) as! Engine
        
        let s65tu: Engine = NSEntityDescription.insertNewObjectForEntityForName(Engine.entityName, inManagedObjectContext: managedObjectContext) as! Engine
        
        
        // ------Create 4 Ships:
        
        let blackPearl: Ship = NSEntityDescription.insertNewObjectForEntityForName(Ship.entityName, inManagedObjectContext: managedObjectContext) as! Ship
        
        let silverPearl: Ship = NSEntityDescription.insertNewObjectForEntityForName(Ship.entityName, inManagedObjectContext: managedObjectContext) as! Ship
        
        let yellowPearl: Ship = NSEntityDescription.insertNewObjectForEntityForName(Ship.entityName, inManagedObjectContext: managedObjectContext) as! Ship
        
        let bluePearl: Ship = NSEntityDescription.insertNewObjectForEntityForName(Ship.entityName, inManagedObjectContext: managedObjectContext) as! Ship
        

        // -----Create First Object Entity:
        
        blackPearl.name = "Black Pearl"
        blackPearl.pirates = jackSparrow
        blackPearl.engines = n54
        n54.propulsion = "300 HP"
        n54.ships = blackPearl
        jackSparrow.name = "Jack Sparrow"
//        jackSparrow.ships?.insert(blackPearl)
//        jackSparrow.ships?.insert(silverPearl)
//        jackSparrow.ships?.insert(yellowPearl)
//        jackSparrow.ships?.insert(bluePearl)
        
        
        // ------Create Second Object Entity:
        
        silverPearl.name = "Silver Pearl"
        silverPearl.pirates = chrisHarris
        silverPearl.engines = n55
        n55.propulsion = "306 HP"
        n55.ships = silverPearl
        chrisHarris.name = "Chris Harris"
//        chrisHarris.ships?.insert(silverPearl)
//        chrisHarris.ships?.insert(blackPearl)
//        chrisHarris.ships?.insert(yellowPearl)
//        chrisHarris.ships?.insert(bluePearl)
        
        
        // -------Create Third Object Entity:
        
        yellowPearl.name = "Yellow Pearl"
        yellowPearl.pirates = deadPool
        yellowPearl.engines = s65
        s65.propulsion = "454 HP"
        s65.ships = yellowPearl
        deadPool.name = "Deadpool"
//        deadPool.ships?.insert(yellowPearl)
//        deadPool.ships?.insert(bluePearl)
//        deadPool.ships?.insert(blackPearl)
//        deadPool.ships?.insert(silverPearl)
        
        
        // -------Create Fourth Object Entity:
        
        bluePearl.name = "Blue Pearl"
        bluePearl.pirates = batman
        bluePearl.engines = s65tu
        s65tu.propulsion = "520 HP"
        s65tu.ships = bluePearl
        batman.name = "Batman"
//        batman.ships?.insert(bluePearl)
//        batman.ships?.insert(blackPearl)
//        batman.ships?.insert(yellowPearl)
//        batman.ships?.insert(silverPearl)
        
        
        self.saveContext()
        self.fetchShipData()
        self.fetchEngineData()
        self.fetchPirateData()
    }
    
    // MARK: - Core Data stack
    // Managed Object Context property getter. This is where we've dropped our "boilerplate" code.
    // If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
    
    lazy var managedObjectContext: NSManagedObjectContext = {
        // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
        let coordinator = self.persistentStoreCoordinator
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()
    
    lazy var managedObjectModel: NSManagedObjectModel = {
        // The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
        let modelURL = NSBundle.mainBundle().URLForResource("swift_captain_morgans_relationships_lab", withExtension: "momd")!
        return NSManagedObjectModel(contentsOfURL: modelURL)!
    }()
    
    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it. This property is optional since there are legitimate error conditions that could cause the creation of the store to fail.
        // Create the coordinator and store
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent("SingleViewCoreData.sqlite")
        var failureReason = "There was an error creating or loading the application's saved data."
        do {
            try coordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: nil)
        } catch {
            // Report any error we got.
            var dict = [String: AnyObject]()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data"
            dict[NSLocalizedFailureReasonErrorKey] = failureReason
            
            dict[NSUnderlyingErrorKey] = error as NSError
            let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
            // Replace this with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
            abort()
        }
        
        return coordinator
    }()
    
    //MARK: Application's Documents directory
    // Returns the URL to the application's Documents directory.
    
    lazy var applicationDocumentsDirectory: NSURL = {
        // The directory the application uses to store the Core Data store file. This code uses a directory named "com.FlatironSchool.SlapChat" in the application's documents Application Support directory.
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count-1]
    }()   
}
