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
    
    //Registers user as volunteer
    @IBAction func RegisterVolunteer(_ sender: UIButton) {
        if (volunteerPassword.text!.count < 8) {
            ShowAlert(Title: "Error", Message: "Password length has to be 8 or more", ViewController: self, ButtonMessage: "Try again")
        }
        else if (!volunteerPassword.text!.containsSpecialCharacter) {
            
        }
        else {
            Register(name: volunteerName.text!, email: volunteerEmail.text!, password: volunteerPassword.text!, accountType: "Volunteer", userEvents: userEvents)
        }
    }
}
    
    
    

