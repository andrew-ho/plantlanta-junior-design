//
//  MainPageController.swift
//  test_signin
//
//  Created by Steven Greenberg on 7/10/20.
//  Copyright © 2020 huh. All rights reserved.
//

import Foundation
import UIKit

class MainPageController: ViewController {
    
    @IBOutlet weak var ViewEventsButton: UIButton!
    
    @IBOutlet weak var EditEventsButton: UIButton!
    
    @IBOutlet weak var ViewPrizesButton: UIButton!
    
    @IBOutlet weak var EditPrizesButton: UIButton!
    
    @IBOutlet weak var ViewProfileButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //hides prizes if organization
        if (currentUser.accountType == "Organization") {
            ViewPrizesButton.isHidden = true
        }
        //hides events if sponsor
        if (currentUser.accountType == "Sponsor") {
            ViewEventsButton.isHidden = true
        }
    }
}
