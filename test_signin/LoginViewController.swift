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
    var found = Account()
    @IBOutlet weak var EmailLabel: UILabel!
    
    @IBOutlet weak var EmailTextField: UITextField!
    
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup
        
        /*let a = Account()
        let g = a.convertUser()
        var b = data["Users"]
        b?.append(g)
        data["Users"]?.append(g)*/
        /*print(JSONSerialization.isValidJSONObject(b!))
        print(JSONSerialization.isValidJSONObject(a.convUserToDic()))
        print(a.convUserToDic())
        print("b")
        print(data["Users"]!)
        print(JSONSerialization.isValidJSONObject(data))
        print(data)
        do {
            try JSONSerialization.save(jsonObject: data, toFilename: "test.txt")
        }
        catch {
            print("uh oh")
        }
        do {
            var t = try JSONSerialization.loadJSON(withFilename: "test.txt") as? [String: [[String: Any]]]
            print("t is")
            print(t!)
        }
        catch {
           print("damn it")
        }
        print("here")*/
    }
    
    
    //Actions
    
    @IBAction func EnterButton(_ sender: UIButton) {
        /*let currentAccount = Account()
        accounts.append(currentAccount)
        */
        
        
        //Checking
        found = CheckAccount(email: EmailTextField.text!, password: PasswordTextField.text!)

        if (found.accountType == "None") {
            ShowAlert(Title: "Wrong credentials", Message: "Username or password is wrong", ViewController: self, ButtonMessage: "Ok")
        } else {
        currentUser = found
        }
    }
}
