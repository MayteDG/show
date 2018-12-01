//
//  AppDelegate.swift
//  MyTasks
//
//  Created by Filipe Martins on 21/03/2017.
//  Copyright © 2017 Runtime Revolution. All rights reserved.
//

import UIKit
import CoreData
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
    {
        //Referencia a nuestro ViewController
        let controller = self.window!.rootViewController as! ViewController
        //Referencia a nuestro Managed Object Context
        let context = self.persistentContainer.viewContext
        controller.managedObjectContext = self.persistentContainer.viewContext
        
        FirebaseApp.configure()
        
        class GlobalVariables {
            static let sharedinstance = GlobalVariables ()
            
            private init () {}
            
            func allUsers() {
                let db = Firestore.firestore()
                db.collection("ejemplo").document("ejem").addSnapshotListener {documentSnapshot, error in
                    guard let document = documentSnapshot else {
                        print("Error fetching document: \(error!)")
                        return
                    }
                    print("Current data: \(String(describing: document.data()))")
                }
            }
        }
        
        return true
    }


    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it.
         */
        let container = NSPersistentContainer(name: "MyTasks")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    

    
}

