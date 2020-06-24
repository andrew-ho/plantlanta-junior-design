//
//  Register.swift
//  test_signin
//
//  Created by Steven Greenberg on 6/15/20.
//  Copyright © 2020 huh. All rights reserved.
//

func Register(name:String, email: String, password: String, accountType: String) {
    accounts.append(Account(email: email, password: password, name: name, accountType: accountType))
    /*write(text: "Wow", to: "Jim.txt")*/
    TryWriting(account: email)
    
}
