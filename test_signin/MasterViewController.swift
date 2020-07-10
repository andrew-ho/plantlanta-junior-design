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

//Account class, this holds the user information
class Account {
    var name: String
    var email:String
    var password:String
    var accountType:String
    var userEvents: [Event]
    var userPrizes: [Prizes]
    var userPoints: Double
    init(email:String, password:String, name:String,
         accountType:String,
         userEvents: [Event], userPrizes: [Prizes], userPoints: Double) {
        self.name = name
        self.email = email
        self.password = password
        self.accountType = accountType
        self.userEvents = userEvents
        self.userPrizes = userPrizes
        self.userPoints = 0
    }
    
    init() {
        self.name = "Joe Schmoe"
        self.email = "email"
        self.password = "password"
        self.accountType = "None"
        self.userEvents = [Event]()
        self.userPrizes = [Prizes]()
        self.userPoints = 0
    }
}

//Event class, holds event information
class Event {
    var eventName : String
    var eventID : Double
    var eventDescription: String
    var eventImage: String
    init (eventName: String,
          eventID: Double, eventDescription: String, eventImage: String) {
        self.eventName = eventName
        self.eventID = eventID
        self.eventDescription = eventDescription
        self.eventImage = eventImage
    }
    
    init () {
        self.eventName = ""
        self.eventID = -1
        self.eventDescription = ""
        self.eventImage = ""
    }
}

//I don't know what the hell to put in here
class Prizes {
    var prizeName : String
    var prizeID : Double
    var prizeDescription: String
    var prizePoints: Double
    var prizeImage: String
    init (prizeName: String,
          prizeID: Double, prizeDescription: String, prizePoints: Double, prizeImage: String) {
            self.prizeName = prizeName
            self.prizeID = prizeID
            self.prizeDescription = prizeDescription
            self.prizePoints = prizePoints
            self.prizeImage = prizeImage
           
       }
       
       init () {
            self.prizeName = ""
            self.prizeID = -1
            self.prizeDescription = ""
            self.prizePoints = -1
            self.prizeImage = ""
       }
}

//array that holds all user info
var accounts = [Account]()
//the current user
var currentUser = Account()
//the current event
var currentEvent = Event()
var currentPrize = Prizes()
//Call this method to show an alert
func ShowAlert(Title: String, Message: String, ViewController: UIViewController, ButtonMessage: String) {
    let alert = UIAlertController(title: Title, message: Message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: ButtonMessage, style: .default, handler: nil))
    ViewController.present(alert, animated: true, completion: nil)
    print("the var found is ")
    
}

extension String {
   var containsSpecialCharacter: Bool {
      let regex = ".*[^A-Za-z0-9].*"
      let testString = NSPredicate(format:"SELF MATCHES %@", regex)
      return testString.evaluate(with: self)
   }
}

