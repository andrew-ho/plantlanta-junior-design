//
//  Login.swift
//  test_signin
//
//  Created by Steven Greenberg on 6/15/20.
//  Copyright © 2020 huh. All rights reserved.
//

import Foundation

//Check if account exists in the accounts array in masterviewcontroller
func CheckAccount(email: String, password: String) -> Account {
    for account in accounts {
        if (email == account.email) {
            if (password == account.password) {
                return account
            }
        }
    }
    return Account()
}

//saves to a text file on the mac
func TryWriting(account: String) {
    let filename = getDocumentsDirectory().appendingPathComponent("output.txt")

    do {
        try account.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
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

