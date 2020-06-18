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
            if (password == account.password) {
                return true
            }
        }
    }
    return false
}

/*func write(text: String, to fileNamed: String, folder: String = "SavedFiles") {
    guard let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first else { return }
    guard let writePath = NSURL(fileURLWithPath: path).appendingPathComponent(folder) else { return }
    try? FileManager.default.createDirectory(atPath: writePath.path, withIntermediateDirectories: true)
    let file = writePath.appendingPathComponent(fileNamed + ".txt")
    try? text.write(to: file, atomically: false, encoding: String.Encoding.utf8)
}
    */
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
func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
    }

