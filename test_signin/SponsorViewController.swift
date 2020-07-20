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
        //registration checking
        let reg = CheckRegistration(name: SponsorName.text!, password: SponsorPassword.text!, email: SponsorEmail.text!, view: self)
        if (!reg) {
            let newAccount = Account(email: SponsorEmail.text!, password: SponsorPassword.text!, name: SponsorName.text!, accountType: "Sponsor", userEvents: userEvents, userPrizes: userPrizes, userPoints: 0)
            
            do {
                accounts.append(newAccount)
                
                var newData = [[String: Any]]()
                
                for account in accounts {
                    newData.append(account.convertUser())
                }
                //saves user into json and puts it into file
                try JSONSerialization.save(jsonObject: newData, toFilename: "users6.txt")
            }
            catch {
                print("org messed up")
            }
        }
    }
    
}
