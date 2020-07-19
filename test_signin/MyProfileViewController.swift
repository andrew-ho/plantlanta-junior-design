//
//  MyProfileViewController.swift
//  test_signin
//
//  Created by administrator on 7/18/20.
//  Copyright © 2020 huh. All rights reserved.
//

import Foundation
import UIKit
class MyProfileViewController: ViewController {
    
    @IBOutlet weak var myName: UILabel!
    
    
    @IBOutlet weak var myEmail: UILabel!
    
    
    @IBOutlet weak var myPoints: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        myName.text! = currentUser.name
        myEmail.text! = currentUser.email
        myPoints.text! = String(currentUser.userPoints)
    }
}
