///Users/administrator/Desktop/plantlanta-junior-design/test_signin/MyProfileViewController.swift
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
    
    @IBOutlet weak var viewMyEventsButton: UIButton!
    
    @IBOutlet weak var viewMyPrizesButton: UIButton!
    @IBOutlet weak var myPointsLabel: UILabel!
    
    @IBOutlet weak var myPoints: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        myName.text! = currentUser.name
        myEmail.text! = currentUser.email
        myPoints.text! = String(currentUser.userPoints)
        
        if (currentUser.accountType == "Organization") {
            viewMyPrizesButton.isHidden = true
            myPoints.isHidden = true
            myPointsLabel.isHidden = true
        }
        if (currentUser.accountType == "Sponsor") {
            viewMyEventsButton.isHidden = true
            myPoints.isHidden = true
            myPointsLabel.isHidden = true
        }
        else if (currentUser.accountType == "Volunteer") {
            viewMyEventsButton.isHidden = false
            viewMyPrizesButton.isHidden = false
            myPoints.isHidden = false
            myPointsLabel.isHidden = false
        }
    }
    
    
    
    @IBAction func returnButton(_ sender: Any) {
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let nextViewController = storyboard.instantiateViewController(withIdentifier: "mainPage") as! MainPageController
            self.present(nextViewController, animated:true, completion:nil)
        
    }
    
    @IBAction func viewMyPrizesButtonAction(_ sender: Any) {
        if (currentUser.accountType == "Volunteer" || currentUser.accountType == "Sponsor") {
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let nextViewController = storyboard.instantiateViewController(withIdentifier: "myPrizes") as! MyPrizesViewController
            self.present(nextViewController, animated:true, completion:nil)
        }
    }
}
