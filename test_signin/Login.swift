//
//  Login.swift
//  test_signin
//
//  Created by Steven Greenberg on 6/15/20.
//  Copyright © 2020 huh. All rights reserved.
//

import Foundation

func CheckAccount(email: String, password: String) -> Bool {
    for account in accounts {
        if (email == account.email) {
            if (password == account.email) {
                return true
            }
        }
    }
    return false
}

func write(text: String, to fileNamed: String, folder: String = "SavedFiles") {
    guard let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first else { return }
    guard let writePath = NSURL(fileURLWithPath: path).appendingPathComponent(folder) else { return }
    try? FileManager.default.createDirectory(atPath: writePath.path, withIntermediateDirectories: true)
    let file = writePath.appendingPathComponent(fileNamed + ".txt")
    try? text.write(to: file, atomically: false, encoding: String.Encoding.utf8)
}
    
func wow() {
    let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
    let documentsDirectory = paths[0]
    let docURL = URL(string: documentsDirectory)!
    let dataPath = docURL.appendingPathComponent("MyFolder")
    if !FileManager.default.fileExists(atPath: dataPath.absoluteString) {
        do {
            try FileManager.default.createDirectory(atPath: dataPath.absoluteString, withIntermediateDirectories: true, attributes: nil)
        } catch {
            print(error.localizedDescription);
        }
    }
}
