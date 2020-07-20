//
//  TableManagement.swift
//  test_signin
//
//  Created by administrator on 7/16/20.
//  Copyright © 2020 huh. All rights reserved.
//

import Foundation
//gets the user
func GetUser(email: String) -> Account? {
    for user in accounts {
        if (user.email == email) {
            return user
        }
    }
    return nil
}
//gets the index of the event from given list
func GetEventIndex(event: Event, list: [Event]) -> Int? {
    var index = 0
    while (index < list.count) {
        if (list[index].eventName == event.eventName) {
            return index
        }
        else {
            index += 1
        }
    }
    return nil
}
//gets the index of the prize from the given list
func GetPrizeIndex(prize: Prizes, list: [Prizes]) -> Int? {
    var index = 0
    while (index < list.count) {
        if (list[index].prizeName == prize.prizeName) {
            return index
        }
        else {
            index += 1
        }
    }
    return nil
}
//adds event to the user
func InsertEventToUser(email: String, event: Event) {
    for user in accounts {
        if (user.email == email) {
            user.userEvents.append(event)
        }
    }
    var newData = [[String: Any]]()
    
    for account in accounts {
        newData.append(account.convertUser())
    }
    //saves changes to the user
    do {
        try JSONSerialization.save(jsonObject: newData, toFilename: "users6.txt")
    } catch {
        print("inserting events did not work or file does not exist yet")
    }
}

//adds prizes to the user
func InsertPrizeToUser(email: String, prize: Prizes) {
    for user in accounts {
        if (user.email == email) {
            user.userPrizes.append(prize)
        }
    }
    var newData = [[String: Any]]()
    for account in accounts {
        newData.append(account.convertUser())
    }
    //saves changes to the user
    do {
        try JSONSerialization.save(jsonObject: newData, toFilename: "users6.txt")
    } catch {
        print("inserting prizes did not work or file does not exist yet")
    }
}
//adds event to the event list and saves it
func AddEvent(event: Event) {
    eventList.append(event)
        var newEvents = [[String: Any]]()
        for ev in eventList {
            newEvents.append(ev.convertToDic())
        }
        do {
            try JSONSerialization.save(jsonObject: newEvents, toFilename: "events2.txt")
        }
        catch {
            print("something went wrong with saving events to text or file does not exist yet")
        }
}
//adds prizes to the prize list and saves it
func AddPrize(prize: Prizes) {
    prizeList.append(prize)
    var newPrizes = [[String: Any]]()
    for stuff in prizeList {
        newPrizes.append(stuff.convertToDic())
    }
    do {
        try JSONSerialization.save(jsonObject: newPrizes, toFilename: "prizes.txt")
    }
    catch {
        print("something went wrong with saving prizes or file does not exist yet")
    }
}

//Converts the json string after loading to an account
func ConvertToAccount(User: [String: Any]) -> Account {
    let newAccount = Account(email: User["email"] as! String, password: User["password"] as! String, name: User["name"] as! String, accountType: User["accountType"] as! String, userEvents: User["userEvents"] as! [Event], userPrizes: User["userPrizes"] as! [Prizes], userPoints: User["userPoints"] as! Double)
    return newAccount
}
//saves any and all changes to their respective files
func SaveChanges() {
    var newData = [[String: Any]]()
    
    for account in accounts {
        newData.append(account.convertUser())
    }
    var newEvents = [[String: Any]]()
    var newPrizes = [[String: Any]]()
    for stuff in prizeList {
        newPrizes.append(stuff.convertToDic())
    }
    for stuff in eventList {
        newEvents.append(stuff.convertToDic())
    }
    do {
        try JSONSerialization.save(jsonObject: newPrizes, toFilename: "prizes.txt")
        try JSONSerialization.save(jsonObject: newEvents, toFilename: "events2.txt")
        try JSONSerialization.save(jsonObject: newData, toFilename: "users6.txt")
    }
    catch {
        print("something went wrong with saving prizes/events or file does not exist yet")
    }
}
