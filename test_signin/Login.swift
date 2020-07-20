//
//  Login.swift
//  test_signin
//
//  Created by Steven Greenberg on 6/15/20.
//  Copyright © 2020 huh. All rights reserved.
//

import Foundation
//checks if user already exists
func CheckIfUserExists(userName: String) -> Bool {
    if (accounts.count != 0) {
        for account in accounts {
            if (account.name == userName) {
                return true
            }
        }
    }
    return false
}

//checks if email already exists
func CheckIfEmailExists(email: String) -> Bool {
    if (accounts.count != 0) {
        for account in accounts {
            if (account.email == email) {
                return true
            }
        }
    }
    return false
}
    
//registration checks
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
    let user = GetUser(email: email)
    
    if (user != nil) {
        return user!
    }
    return Account()
}

//prints the document directory in where the text file is located on the mac
func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
    }

