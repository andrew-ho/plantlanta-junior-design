//
//  VolunteerViewController.swift
//  test_signin
//
//  Created by Steven Greenberg on 6/17/20.
//  Copyright © 2020 huh. All rights reserved.
//

import Foundation
import UIKit
class VolunteerViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }
    @IBOutlet weak var RegisterVolunteerButton: UIButton!
    
    
    @IBOutlet weak var volunteerName: UITextField!
    
    @IBOutlet weak var volunteerEmail: UITextField!
    
    
    @IBOutlet weak var volunteerPassword: UITextField!
    
    var userEvents = [Event]()
    var userPrizes = [Prizes]()
    //Registers user as volunteer
    @IBAction func RegisterVolunteer(_ sender: UIButton) {
        let reg = CheckRegistration(name: volunteerName.text!, password: volunteerPassword.text!, email: volunteerEmail.text!, view: self)
        if (!reg) {
            let newAccount = Account(email: volunteerEmail.text!, password: volunteerPassword.text!, name: volunteerName.text!, accountType: "Volunteer", userEvents: userEvents, userPrizes: userPrizes, userPoints: 0)

            do {
                accounts.append(newAccount)
                
                var newData = [[String: Any]]()
                
                for account in accounts {
                    newData.append(account.convertUser())
                }
                
                try JSONSerialization.save(jsonObject: newData, toFilename: "users6.txt")
            }
            catch {
                print("something went wrong")
            }
        }
    }
}
    
    
    

