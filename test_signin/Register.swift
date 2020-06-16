//
//  Register.swift
//  test_signin
//
//  Created by Steven Greenberg on 6/15/20.
//  Copyright © 2020 huh. All rights reserved.
//

import Foundation
func Register(name:String, email: String, password: String) {
    accounts.append(Account(email: email, password: password, name: name))
}
