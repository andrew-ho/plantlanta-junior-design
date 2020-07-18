//
//  Register.swift
//  test_signin
//
//  Created by Steven Greenberg on 6/15/20.
//  Copyright © 2020 huh. All rights reserved.
//

//method to register users
func Register(name:String, email: String, password: String, accountType: String, userEvents: [Event], userPrizes: [Prizes], userPoints: Double) {
    accounts.append(Account(email: email, password: password, name: name, accountType: accountType, userEvents: userEvents, userPrizes: userPrizes, userPoints: userPoints))
    /*write(text: "Wow", to: "Jim.txt")*/
    TryWriting(email: email, password: password)
    
}
