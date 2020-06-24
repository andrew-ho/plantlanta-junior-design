//
//  SponsorViewController.swift
//  test_signin
//
//  Created by Steven Greenberg on 6/24/20.
//  Copyright © 2020 huh. All rights reserved.
//

import UIKit

class SponsorViewController: ViewController {
    
    @IBOutlet weak var SponsorName: UITextField!
    
    @IBOutlet weak var SponsorEmail: UITextField!
    
    
    @IBOutlet weak var SponsorPassword: UITextField!
    
    
    @IBAction func RegisterSponsorButton(_ sender: UIButton) {
        Register(name: SponsorName.text!, email: SponsorEmail.text!, password: SponsorPassword.text!, accountType: "Sponsor")
    }
    
}
