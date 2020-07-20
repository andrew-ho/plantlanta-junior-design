//
//  StartViewController.swift
//  test_signin
//
//  Created by administrator on 7/19/20.
//  Copyright © 2020 huh. All rights reserved.
//

import Foundation
class StartViewController: ViewController {
override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    //gets the file containing the json strings of all the users
    do {
        yolo = try JSONSerialization.loadJSON(withFilename: "users6.txt") as! [[String: Any]]
    }
    catch {
        print("something went wrong or the file does not exist yet")
    }
    //populate accounts
    accounts = GetAccounts()
    //gets the file containing the json strings of all the events
    do {
        eventFile = try JSONSerialization.loadJSON(withFilename: "events2.txt") as! [[String : Any]]
    }
    catch {
        print("Something went wrong or file does not exist")
    }
    
    for account in accounts {
        print(account.name)
        print(account.userPrizes)
    }
    //populate event list
    eventList = getEvents()

}
//populates the account list from the file containing the json strings
func GetAccounts() -> [Account] {
    var newAccounts = [Account]()
    for stuff in yolo {
        var account = Account()
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
