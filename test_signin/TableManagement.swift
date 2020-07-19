//
//  TableManagement.swift
//  test_signin
//
//  Created by administrator on 7/16/20.
//  Copyright © 2020 huh. All rights reserved.
//

import Foundation

func GetUser(email: String) -> Account? {
    for user in accounts {
        if (user.email == email) {
            return user
        }
    }
    return nil
}

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

func InsertEventToUser(email: String, event: Event) {
    for user in accounts {
        if (user.email == email) {
            print("user before appending")
            print(JSONSerialization.isValidJSONObject(user.convertUser()))
            user.userEvents.append(event)
            print("user after appending")
            print(JSONSerialization.isValidJSONObject(user.convertUser()))
        }
    }
    var newData = [[String: Any]]()
    
    for account in accounts {
        newData.append(account.convertUser())
    }
    print(JSONSerialization.isValidJSONObject(newData))
    do {
        try JSONSerialization.save(jsonObject: newData, toFilename: "users4.txt")
    } catch {
        print("inserting events did not work or file does not exist yet")
    }
}

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
    do {
        try JSONSerialization.save(jsonObject: newData, toFilename: "users4.txt")
    } catch {
        print("inserting prizes did not work or file does not exist yet")
    }
}

func AddEvent(event: Event) {
    eventList.append(event)
    var newEvents = [[String: Any]]()
    for ev in eventList {
        newEvents.append(ev.convertToDic())
    }
    do {
        try JSONSerialization.save(jsonObject: newEvents, toFilename: "events.txt")
    }
    catch {
        print("something went wrong with saving events to text or file does not exist yet")
    }
}

func AddPrize(prize: Prizes) {
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

func ConvertToAccount(User: [String: Any]) -> Account {
    let newAccount = Account(email: User["email"] as! String, password: User["password"] as! String, name: User["name"] as! String, accountType: User["accountType"] as! String, userEvents: User["userEvents"] as! [Event], userPrizes: User["userPrizes"] as! [Prizes], userPoints: User["userPoints"] as! Double)
    return newAccount
}
