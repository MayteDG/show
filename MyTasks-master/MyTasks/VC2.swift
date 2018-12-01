//
//  VC2.swift
//  MyTasks
//
//  Created by Adrian Pascual Dominguez on 12/1/18.
//  Copyright © 2018 Runtime Revolution. All rights reserved.
//

import UIKit


class VC2: UIViewController {
  
    let alluser = GlobalVariables.sharedinstance
    override func viewDidLoad() {
        super.viewDidLoad()
            alluser.allUsers()
        
    }
    

    

}
