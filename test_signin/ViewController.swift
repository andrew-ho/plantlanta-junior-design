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
            //data = try JSONSerialization.loadJSON(withFilename: "users.txt") as! [String: [[String: Any]]]
            yolo = try JSONSerialization.loadJSON(withFilename: "users2.txt") as! [[String: Any]]
        }
        catch {
            print("something went wrong")
        }
        /*var ev = [Event]()
        ev.append(Event(eventName: "ev1", eventID: 0, eventDescription: "boo", eventImage: "ilk1"))
        yolo[0]["userEvents"]! = ev
        let pop = yolo[0]["userEvents"]! as! NSArray
        print("pop")
        let yur = pop[0] as! Event
        print(yur.eventDescription)
        print(yolo[0]["userEvents"]!)
        print(yolo)
        print(type(of: yolo[0]["userEvents"]! ))*/
        
        
        //data["Users"]?.append(Account().convUserToDic())
        //CheckIfUserExists()
        /*print(data)
        print("data")
        print(data["Users"]!)*/
        
        /*print(type(of: data["Users"]![1]["Users"]!))
        let q = data["Users"]![1]["Users"]! as! NSDictionary
        print(q["email"]!)
        print(type(of: q))
        print(type(of: data))
        print(type(of: data["Users"]))
        print(type(of: data["Users"]?[0]))
        print(type(of: data["Users"]?[0]["Users"]))
        
        let acc = Account()
        yolo.append(acc.convertUser())
        print(JSONSerialization.isValidJSONObject(yolo))
        print(yolo[0]["name"]!)*/

        
        //print(yolo[0]["email"]!)
        //print(yolo[0]["userEvents"]! as! [Event])
        //print(yolo)
        accounts = GetAccounts()
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
        account.userEvents = stuff["userEvents"] as! [Event]
        account.userPrizes = stuff["userPrizes"] as! [Prizes]
        newAccounts.append(account)
    }
    return newAccounts
}
