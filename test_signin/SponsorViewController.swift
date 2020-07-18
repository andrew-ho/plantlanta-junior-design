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
    
    var userPrizes = [Prizes]()
    //Registers User as a sponsor
    @IBAction func RegisterSponsorButton(_ sender: UIButton) {
        let reg = CheckRegistration(name: SponsorName.text!, password: SponsorPassword.text!, email: SponsorEmail.text!, view: self)
        if (!reg) {
            Register(name: SponsorName.text!, email: SponsorEmail.text!, password: SponsorPassword.text!, accountType: "Sponsor", userEvents: userEvents, userPrizes: userPrizes, userPoints: 0)
        }
    }
    
}
