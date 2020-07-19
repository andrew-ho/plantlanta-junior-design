//
//  ViewController.swift
//  test_signin
//
//  Created by Steven Greenberg on 6/2/20.
//  Copyright © 2020 huh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        do {
            yolo = try JSONSerialization.loadJSON(withFilename: "users4.txt") as! [[String: Any]]
        }
        catch {
            print("something went wrong or the file does not exist yet")
        }
        accounts = GetAccounts()
        for account in accounts {
            print(account.userEvents)
        }
    
}

func GetAccounts() -> [Account] {
    var newAccounts = [Account]()
    for stuff in yolo {
        let account = Account()
        account.name = stuff["name"] as! String
        account.email = stuff["email"] as! String
        account.password = stuff["password"] as! String
        account.accountType = stuff["accountType"] as! String
        account.userPoints = stuff["userPoints"] as! Double
        //account.userEvents = stuff["userEvents"] as! [Event]
        account.userEvents = ConvertEventDicToArray(dic: stuff["userEvents"] as! [[String: Any]])
        //account.userPrizes = stuff["userPrizes"] as! [Prizes]
        account.userPrizes = ConvertPrizeDicToArray(dic: stuff["userPrizes"] as! [[String: Any]])
        newAccounts.append(account)
    }
    return newAccounts
}
        
    
    
}
