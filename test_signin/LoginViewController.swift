//
//  LoginViewController.swift
//  test_signin
//
//  Created by Steven Greenberg on 6/13/20.
//  Copyright © 2020 huh. All rights reserved.
//

import UIKit
class LoginViewController: ViewController {
    //Properties
    var found = false
    @IBOutlet weak var EmailLabel: UILabel!
    
    @IBOutlet weak var EmailTextField: UITextField!
    
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    //Actions
    
    @IBAction func EnterButton(_ sender: UIButton) {
        /*let currentAccount = Account()
        accounts.append(currentAccount)
        */
        found = CheckAccount(email: EmailTextField.text!, password: PasswordTextField.text!)
        if (found == false) {
            ShowAlert(Title: "Something went wrong", Message: "Username or password is wrong", ViewController: self)
        }
        
    }
}
