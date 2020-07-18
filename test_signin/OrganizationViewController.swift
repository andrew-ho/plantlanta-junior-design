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
    var userPrizes = [Prizes]()
    //Registers user as an organization
    @IBAction func RegisterOrganizationButton(_ sender: UIButton) {
        let reg = CheckRegistration(name: OrganizationName.text!, password: OrganizationPassword.text!, email: EmailField.text!, view: self)
        if (!reg) {
            //Register(name: OrganizationName.text!, email: EmailField.text!, password: OrganizationPassword.text!, accountType: "Organization", userEvents: userEvents, userPrizes: userPrizes, userPoints: 0)
            let newAccount = Account(email: EmailField.text!, password: OrganizationPassword.text!, name: OrganizationName.text!, accountType: "Organization", userEvents: userEvents, userPrizes: userPrizes, userPoints: 0)
            do {
                data["Users"]?.append(newAccount.convUserToDic())
                try JSONSerialization.save(jsonObject: data, toFilename: "users.txt")
            }
            catch {
                print("org messed up")
            }
        }
    }

}
