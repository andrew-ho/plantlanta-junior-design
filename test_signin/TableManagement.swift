//
//  TableManagement.swift
//  test_signin
//
//  Created by administrator on 7/16/20.
//  Copyright © 2020 huh. All rights reserved.
//

import Foundation

func GetPrizePoints(email:String) -> Double? {
    let user = GetUser(email: email)
    return user?.userPoints
}

func GetUser(email: String) -> Account? {
    for user in accounts {
        if (user.email == email) {
            return user
        }
    }
    
    
    return nil
}

func GetEvents(email: String) -> [Event]? {
    let user = GetUser(email: email)
    return user?.userEvents
}

func InsertEvent(email: String, event: Event) {
    for user in accounts {
        if (user.email == email) {
            user.userEvents.append(event)
        }
    }
    var newData = [[String: Any]]()
    for account in accounts {
        newData.append(account.convertUser())
    }
    do {
        try JSONSerialization.save(jsonObject: newData, toFilename: "users2.txt")
    } catch {
        print("inserting events did not work")
    }
}

func InsertPrize(email: String, prize: Prizes) {
    for user in accounts {
        if (user.email == email) {
            user.userPrizes.append(prize)
        }
    }
    var newData = [[String: Any]]()
    for account in accounts {
        newData.append(account.convertUser())
    }
    do {
        try JSONSerialization.save(jsonObject: newData, toFilename: "users2.txt")
    } catch {
        print("inserting prizes did not work")
    }
}

func ConvertToAccount(User: [String: Any]) -> Account {
    let newAccount = Account(email: User["email"] as! String, password: User["password"] as! String, name: User["name"] as! String, accountType: User["accountType"] as! String, userEvents: User["userEvents"] as! [Event], userPrizes: User["userPrizes"] as! [Prizes], userPoints: User["userPoints"] as! Double)
    return newAccount
}
