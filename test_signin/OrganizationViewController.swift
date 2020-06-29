//
//  OrganizationViewController.swift
//  test_signin
//
//  Created by Steven Greenberg on 6/24/20.
//  Copyright © 2020 huh. All rights reserved.
//

import UIKit

class OrganizationViewController: ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var OrganizationName: UITextField!
    @IBOutlet weak var EmailField: UITextField!

    
    @IBOutlet weak var OrganizationPassword: UITextField!
    
    var userEvents = [Event]()
    
    //Registers user as an organization
    @IBAction func RegisterOrganizationButton(_ sender: UIButton) {
        if (OrganizationPassword.text!.count < 8) {
            ShowAlert(Title: "Error", Message: "Password length has to be 4 or more", ViewController: self, ButtonMessage: "Try again")
        }
        else if (!OrganizationPassword.text!.containsSpecialCharacter) {
            ShowAlert(Title: "Error", Message: "Password must contain at least one special character", ViewController: self, ButtonMessage: "Try again")
        }
        else {
            Register(name: OrganizationName.text!, email: EmailField.text!, password: OrganizationPassword.text!, accountType: "Organization", userEvents: userEvents)
        }
    }

}
