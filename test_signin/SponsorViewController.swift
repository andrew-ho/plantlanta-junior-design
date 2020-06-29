//
//  SponsorViewController.swift
//  test_signin
//
//  Created by Steven Greenberg on 6/24/20.
//  Copyright © 2020 huh. All rights reserved.
//

import UIKit

class SponsorViewController: ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var SponsorName: UITextField!
    
    @IBOutlet weak var SponsorEmail: UITextField!
    
    
    @IBOutlet weak var SponsorPassword: UITextField!
    
    var userEvents = [Event]()
    //Registers User as a sponsor
    @IBAction func RegisterSponsorButton(_ sender: UIButton) {
        if (SponsorPassword.text!.count < 8) {
            ShowAlert(Title: "Error", Message: "Password length has to be 4 or more", ViewController: self, ButtonMessage: "Try again")
        }
        else if (!SponsorPassword.text!.containsSpecialCharacter) {
            ShowAlert(Title: "Error", Message: "Password must contain at least one special character", ViewController: self, ButtonMessage: "Try again")
        }
        else {
            Register(name: SponsorName.text!, email: SponsorEmail.text!, password: SponsorPassword.text!, accountType: "Sponsor", userEvents: userEvents)
        }
    }
    
}
