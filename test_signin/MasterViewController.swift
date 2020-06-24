//
//  MasterViewController.swift
//  test_signin
//
//  Created by Steven Greenberg on 6/13/20.
//  Copyright © 2020 huh. All rights reserved.
//

import Foundation
import UIKit
class Main {
  var name:String
  init(name:String) {
    self.name = name
  }
}
var mainInstance = Main(name:"My Global Class")

class Account {
    var name: String
    var email:String
    var password:String
    var accountType:String
    init(email:String, password:String, name:String,
         accountType:String) {
        self.name = name
        self.email = email
        self.password = password
        self.accountType = accountType
    }
    
    init() {
        self.name = "Joe Schmoe"
        self.email = "email"
        self.password = "password"
        self.accountType = "Volunteer"
    }
}

var accounts = [Account]()

func ShowAlert(Title: String, Message: String, ViewController: UIViewController) {
    let alert = UIAlertController(title: Title, message: Message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Try again", style: .default, handler: nil))
    ViewController.present(alert, animated: true, completion: nil)
    print("the var found is ")
    
}

