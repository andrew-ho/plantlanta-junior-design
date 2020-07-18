//
//  TableManagement.swift
//  test_signin
//
//  Created by administrator on 7/16/20.
//  Copyright © 2020 huh. All rights reserved.
//

import Foundation

func GetPrizePoints(email:String) -> Double {
    let user = GetUser(email: email)
    return user?["userPoints"] as! Double
}

func GetUser(email: String) -> [String: Any]? {
    /*let users = data["Users"]!
    for user in users {
        for userData in user {
            let h = userData.value as! [String: Any]
            if (h["email"] as! String == email) {
                return h
            }
        }
    }*/
    
    for user in yolo {
        if (user["email"] as! String == email) {
            return user
        }
    }
    return nil
}

func GetUserIndex(email: String) -> Int {
    var index = 0
    while (index < yolo.count) {
        if (yolo[index]["email"] as! String == email) {
            return index
        }
        else {
            index += 1
        }
    }
    return -1
}

func GetEvents(email: String) -> [Event] {
    let user = GetUser(email: email)
    return user?["userEvents"] as! [Event]
}

func InsertEvent(email: String, event: Event) {
    currentUser.userEvents.append(event)
    yolo.remove(at: GetUserIndex(email: email))
    yolo.append(currentUser.convertUser())
    print(currentUser)
}

func ConvertToAccount(User: [String: Any]) -> Account {
    let newAccount = Account(email: User["email"] as! String, password: User["password"] as! String, name: User["name"] as! String, accountType: User["accountType"] as! String, userEvents: User["userEvents"] as! [Event], userPrizes: User["userPrizes"] as! [Prizes], userPoints: User["userPoints"] as! Double)
    return newAccount
}
