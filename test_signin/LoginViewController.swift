//
//  LoginViewController.swift
//  test_signin
//
//  Created by Steven Greenberg on 6/13/20.
//  Copyright © 2020 huh. All rights reserved.
//

import UIKit
class LoginViewController: ViewController {
    //Properties
    @IBOutlet weak var EmailLabel: UILabel!
    
    @IBOutlet weak var EmailTextField: UITextField!
    
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    //Actions
    
    @IBAction func EnterButton(_ sender: UIButton) {
        let currentAccount = Account()
        accounts.append(currentAccount)
        let alert = UIAlertController(title: EmailTextField.text, message: PasswordTextField.text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
              switch action.style{
              case .default:
                    print("default")

              case .cancel:
                    print("cancel")

              case .destructive:
                    print("destructive")



            }}))
        /*self.present(alert, animated: true, completion: nil)*/
    }
}
