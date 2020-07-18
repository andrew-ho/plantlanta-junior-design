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

struct Users {
    var account: Account
    init(account: Account) {
        self.account = account
    }
    func convToDic() -> [String: Any] { let dic = ["User": self.account.convUserToDic()]
        return dic
    }
}
//Account class, this holds the user information
class Account: Codable {
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
        self.userPoints = userPoints
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
    
    func convUserToDic() -> [String :[String: Any]] {
        let dic: [String: [String: Any]] = ["Users" : ["name": self.name, "email":self.email, "password":self.password, "accountType":self.accountType, "userEvents":self.userEvents, "userPrizes":self.userPrizes, "userPoints":self.userPoints]]
        return dic
    }
    
    func convertUser() -> [String: Any] {
        let dic: [String: Any] = ["name": self.name, "email":self.email, "password":self.password, "accountType":self.accountType, "userEvents":self.userEvents, "userPrizes":self.userPrizes, "userPoints":self.userPoints]
        return dic
    }
}
var data: [String : [[String: Any]]] = [
    "Users" : []
]

var yolo = [[String: Any]]()

//Event class, holds event information
struct Event: Codable {
    var eventName : String
    var eventID : Double
    var eventDescription: String
    var eventImage: String
    var publisher: String
    var time: String
    var eventPoints: Double
    
    init (eventName: String,
          eventID: Double, eventDescription: String, eventImage: String, publisher: String, time: String, eventPoints: Double) {
        self.eventName = eventName
        self.eventID = eventID
        self.eventDescription = eventDescription
        self.eventImage = eventImage
        self.publisher = publisher
        self.time = time
        self.eventPoints = eventPoints
    }
    
    init () {
        self.eventName = ""
        self.eventID = -1
        self.eventDescription = ""
        self.eventImage = ""
        self.publisher = "NoOne"
        self.time = ""
        self.eventPoints = 0
    }
}


//I don't know what the hell to put in here
struct Prizes: Codable {
    var prizeName : String
    var prizeID : Double
    var prizeDescription: String
    var prizePoints: Double
    var prizeImage: String
    var publisher: String
    init (prizeName: String,
          prizeID: Double, prizeDescription: String, prizePoints: Double, prizeImage: String, publisher: String) {
            self.prizeName = prizeName
            self.prizeID = prizeID
            self.prizeDescription = prizeDescription
            self.prizePoints = prizePoints
            self.prizeImage = prizeImage
            self.publisher = publisher
           
       }
       
       init () {
            self.prizeName = ""
            self.prizeID = -1
            self.prizeDescription = ""
            self.prizePoints = -1
            self.prizeImage = ""
            self.publisher = "NoOne"
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

extension String {
    var validEmail: Bool {
        let REGEX: String
            REGEX = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", REGEX).evaluate(with: self)
    }
}

func readBundle(file: String) -> String {
    var res = ""
    if let asset = NSDataAsset(name: file) , let string = String(data:asset.data, encoding: String.Encoding.utf8) {
        res = string
    }
    return res
}

func writeDataToFile(file:String, data: String)-> Bool{
 // check our data exists
    //guard let data = textView.text else {return false}
    //print(data)
    //get the file path for the file in the bundle
    // if it doesnt exisit, make it in the bundle
    var fileName = file + ".txt"
    if let filePath = Bundle.main.path(forResource: file, ofType: "txt"){
        fileName = filePath
    } else {
        fileName = Bundle.main.bundlePath + fileName
    }
    //write the file, return true if it works, false otherwise.
    do{
        try data.write(toFile: fileName, atomically: true, encoding: String.Encoding.utf8 )
        return true
    } catch{
        return false
    }

}

extension JSONSerialization {
    
    static func loadJSON(withFilename filename: String) throws -> Any? {
        let fm = FileManager.default
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
        if let url = urls.first {
            var fileURL = url.appendingPathComponent(filename)
            fileURL = fileURL.appendingPathExtension("json")
            let data = try Data(contentsOf: fileURL)
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: [.mutableContainers, .mutableLeaves])
            return jsonObject
        }
        return nil
    }
    
    static func save(jsonObject: Any, toFilename filename: String) throws -> Bool{
        let fm = FileManager.default
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
        if let url = urls.first {
            var fileURL = url.appendingPathComponent(filename)
            fileURL = fileURL.appendingPathExtension("json")
            let data = try JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted])
            try data.write(to: fileURL, options: [.atomicWrite])
            return true
        }
        
        return false
    }
}

extension Account : Hashable {
    public func hash(into hasher: inout Hasher) {
             hasher.combine(ObjectIdentifier(self).hashValue)
        }
}

extension Account: Equatable {

    public static func ==(lhs: Account, rhs: Account) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
}


