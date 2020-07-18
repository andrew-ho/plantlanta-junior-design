//
//  Login.swift
//  test_signin
//
//  Created by Steven Greenberg on 6/15/20.
//  Copyright © 2020 huh. All rights reserved.
//

import Foundation

func test() {
    if (yolo.count != 0) {
        for s in yolo {
            print(s["email"]!)
        }
    }
}

func CheckIfUserExists(userName: String) -> Bool {
    /*if (data.count != 0) {
        for user in data["Users"]! {
            for values in user.values {
                let f = values as! [String: Any]
                if (f["name"] as! String == userName) {
                    return true
                }
            }
        }
    }
    
    return false*/
    
    /*if (yolo.count != 0) {
        for user in yolo {
            if (user["name"] as! String == userName) {
                return true
            }
        }
    }*/
    
    if (accounts.count != 0) {
        for account in accounts {
            if (account.name == userName) {
                return true
            }
        }
    }
    return false
}

func CheckIfEmailExists(email: String) -> Bool {
    /*if (data.count != 0) {
        for user in data["Users"]! {
            for values in user.values {
                let f = values as! [String: Any]
                if (f["email"] as! String == email) {
                    return true
                }
            }
        }
    }*/
    /*if (yolo.count != 0) {
        for user in yolo {
            if (user["email"] as! String == email) {
                return true
            }
        }
    }*/
    if (accounts.count != 0) {
        for account in accounts {
            if (account.email == email) {
                return true
            }
        }
    }
    return false
}
    

func CheckRegistration(name: String, password: String, email: String, view: ViewController) -> Bool{
    if (name.count < 4) {
        ShowAlert(Title: "Error", Message: "Username has to be of length 4 or more", ViewController: view, ButtonMessage: "Try again")
        return true
    }
    else if (password.count < 8) {
        ShowAlert(Title: "Error", Message: "Password length has to be 8 or more", ViewController: view, ButtonMessage: "Try again")
        return true
    }
    else if (!password.containsSpecialCharacter) {
        ShowAlert(Title: "Error", Message: "Password must contain at least 1 special character", ViewController: view, ButtonMessage: "Try again")
        return true
    }
    else if (!email.validEmail) {
        ShowAlert(Title: "Error", Message: "This email is not valid", ViewController: view, ButtonMessage: "Try again")
        return true
    }
    else if (email.count == 0) {
        ShowAlert(Title: "Error", Message: "Please type in an email", ViewController: view, ButtonMessage: "Try again")
        return true
    }
    else if (CheckIfUserExists(userName: name)) {
        ShowAlert(Title: "Error", Message: "A user with that name already exists", ViewController: view, ButtonMessage: "Try again")
        return true
    }
    else if (CheckIfEmailExists(email: email)) {
        ShowAlert(Title: "Error", Message: "This email is already being used", ViewController: view, ButtonMessage: "Try again")
        return true
    }
    return false
}
func loadAccounts() {
    let filename = getDocumentsDirectory().appendingPathComponent("output.txt")
    //reading
    do {
        let text2: String = try String(contentsOf: filename, encoding: .utf8)
        print("text is " + text2)
        let result = text2.split(separator: "\n")
        print (result)
    }
    catch {/* error handling here */}
    
}

//Check if account exists in the accounts array in masterviewcontroller
func CheckAccount(email: String, password: String) -> Account {
    /*if (data.count != 0) {
        let users = data["Users"]!
        for user in users {
            for userData in user {
                let h = userData.value as! [String: Any]
                if (h["email"] as! String == email) {
                    if (h["password"] as! String == password) {
                        
                        let newAccount = Account(email: h["email"] as! String, password: h["password"] as! String, name: h["name"] as! String, accountType: h["accountType"] as! String, userEvents: h["userEvents"] as! [Event], userPrizes: h["userPrizes"] as! [Prizes], userPoints: h["userPoints"] as! Double)
                        return newAccount
                    }
                    else {
                        return Account()
                    }
                }
        
            }
        }
        
    }*/
    
    let user = GetUser(email: email)
    
    if (user != nil) {
        if (user?["password"] as! String == password) {
            return ConvertToAccount(User: user!)
        }
    }
    return Account()
}

//saves to a text file on the mac
func TryWriting(email: String, password: String) {
    let filename = getDocumentsDirectory().appendingPathComponent("output.txt")

    do {
        var prevText = try String(contentsOf: filename, encoding: .utf8)
        prevText = prevText + "\n" + email
        try prevText.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
        /*try account.write(to: filename, atomically: true, encoding: String.Encoding.utf8)*/
        print(filename)
        } catch {
            // failed to write file – bad permissions, bad filename, missing permissions, or more likely it can't be converted to the encoding
        }
    
    //reading
    do {
        let text2 = try String(contentsOf: filename, encoding: .utf8)
        print("text is " + text2)
    }
    catch {/* error handling here */}
    }

//prints the document directory in where the text file is located on the mac
func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
    }

