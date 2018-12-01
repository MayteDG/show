//
//  File.swift
//  MyTasks
//
//  Created by Adrian Pascual Dominguez on 12/1/18.
//  Copyright © 2018 Runtime Revolution. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore



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
