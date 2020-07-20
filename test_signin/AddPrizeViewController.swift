//
//  AddPrizeViewController.swift
//  test_signin
//
//  Created by administrator on 7/19/20.
//  Copyright © 2020 huh. All rights reserved.
//

import Foundation
import UIKit

class AddPrizeViewController: ViewController {
    
    @IBOutlet weak var prizeName: UITextField!
    
    @IBOutlet weak var prizeDescription: UITextField!
    
    @IBOutlet weak var prizePoints: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //helper method to saving prizes
    func savePrize() {
        if (!prizePoints.text!.isDouble) {
            ShowAlert(Title: "Error", Message: "Please put in a valid number", ViewController: self, ButtonMessage: "Ok")
        }
        else if (prizeName.text! == "") {
            ShowAlert(Title: "Error", Message: "Name cannot be blank", ViewController: self, ButtonMessage: "Ok")
        }
        else if (prizeDescription.text! == "") {
            ShowAlert(Title: "Error", Message: "Description cannot be blank", ViewController: self, ButtonMessage: "Ok")
        }
        else {
            //adds prize to prize list
            var prize = Prizes()
            prize.prizeName = prizeName.text!
            prize.prizeDescription = prizeDescription.text!
            prize.prizePoints = Double(prizePoints.text!)!
            prize.publisher = currentUser.name
            prize.prizeImage = "prize1"
            AddPrize(prize: prize)
        }
    }
    
    //saves the prize to the prize list and switches back to MyPrizes
    @IBAction func savePrizeButton(_ sender: Any) {
        savePrize()
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "myPrizes") as! MyPrizesViewController
        self.present(nextViewController, animated:true, completion:nil)
        
        NotificationCenter.default.post(name: Notification.Name("PrizeAdded"), object: nil)
        
    }
}
