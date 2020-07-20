//
//  EditPrizeViewController.swift
//  test_signin
//
//  Created by administrator on 7/19/20.
//  Copyright © 2020 huh. All rights reserved.
//

import Foundation
import UIKit
class EditPrizeViewController: ViewController {
    
    
    @IBOutlet weak var prizeName: UITextField!
    
    @IBOutlet weak var prizeDescription: UITextField!
    
    @IBOutlet weak var prizePoints: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChangePrizeLabels), name: Notification.Name("ChangePrizeLabels"), object: nil)
    }
    
    @objc func ChangePrizeLabels() {
        prizeName.text = currentPrize.prizeName
        prizeDescription.text = currentPrize.prizeDescription
        prizePoints.text = String(currentPrize.prizePoints)
    }
    
    
    
    @IBAction func savePrizeButton(_ sender: Any) {
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
            var index = 0
            index = GetPrizeIndex(prize: currentPrize, list: prizeList)!
            
            let element = prizeList.remove(at: index)
            var newPrize = Prizes()
            newPrize.prizeName = prizeName.text!
            newPrize.prizeDescription = prizeDescription.text!
            if (prizePoints.text!.count > 0) {
                newPrize.prizePoints = Double(prizePoints.text!)!
            } else {
                newPrize.prizePoints = 0
            }
            newPrize.prizeImage = element.prizeImage
            newPrize.prizeID = element.prizeID
            newPrize.publisher = element.publisher
            
            prizeList.append(newPrize)
            
            
            //index = GetEventIndex(event: currentEvent, list: currentUser.userEvents)!
            
            addPrizeToAccounts(prize: newPrize)
            
            SaveChanges()
            
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let nextViewController = storyboard.instantiateViewController(withIdentifier: "myEvents") as! MyEventsViewController
            self.present(nextViewController, animated:true, completion:nil)
            
            NotificationCenter.default.post(name: Notification.Name("PrizeChanged"), object: nil)
        }
    }
    
    
    @IBAction func DeletePrizeButton(_ sender: Any) {
        var index = 0
        index = GetPrizeIndex(prize: currentPrize, list: prizeList)!
        
        prizeList.remove(at: index)
        
        //index = GetPrizeIndex(prize: currentPrize, list: currentUser.userPrizes)!
        
        //TODO: go through every other account and remove prize
        removePrizeFromAccounts(prize: currentPrize)
        
        SaveChanges()
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "myEvents") as! MyEventsViewController
        self.present(nextViewController, animated:true, completion:nil)
        
        NotificationCenter.default.post(name: Notification.Name("PrizeChanged"), object: nil)
    }
    
    
    func removePrizeFromAccounts(prize: Prizes) {
        for account in accounts {
            var found = false
            var index = 0
            for prizes in account.userPrizes {
                if (prizes.prizeName == prize.prizeName) {
                    found = true
                }
                else if (found == false){
                    index += 1
                }
            }
            if (found) {
                account.userPrizes.remove(at: index)
            }
            
        }
    }
    
    func addPrizeToAccounts(prize: Prizes) {
        for account in accounts {
            var found = false
            var index = 0
            for prizes in account.userPrizes {
                if (prizes.prizeName == prize.prizeName) {
                    found = true
                }
                else if (found == false){
                    index += 1
                }
            }
            if (found) {
                account.userPrizes.remove(at: index)
                account.userPrizes.append(prize)
            }
            
        }
    }
}
