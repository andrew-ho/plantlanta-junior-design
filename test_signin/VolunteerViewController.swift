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
            //Register(name: volunteerName.text!, email: volunteerEmail.text!, password: volunteerPassword.text!, accountType: "Volunteer", userEvents: userEvents, userPrizes: userPrizes, userPoints: 0)
            let newAccount = Account(email: volunteerEmail.text!, password: volunteerPassword.text!, name: volunteerName.text!, accountType: "Volunteer", userEvents: userEvents, userPrizes: userPrizes, userPoints: 0)
            //let a = Users(account: newAccount)
            
            //let dic = newAccount.convUserToDic()
            
            let dic = newAccount.convertUser()
            //let valid = JSONSerialization.isValidJSONObject(dic)
            //print(valid)
            do {
                
                //data["Users"]?.append(dic)
                
                yolo.append(dic)
                
                //data["Users"]?.append(newAccount.convertUser())
                //var r = accJSON as! [String: [String: Any]]
                //(r["Users"]? as AnyObject).append(dic)
                //print(r)
                //try JSONSerialization.save(jsonObject: dic, toFilename: "results.txt")
                try JSONSerialization.save(jsonObject: yolo, toFilename: "users2.txt")
            }
            catch {
                print("something went wrong")
            }
        }
    }
}
    
    
    

