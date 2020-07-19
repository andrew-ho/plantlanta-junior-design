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
    
    @IBAction func DeletePrizeButton(_ sender: Any) {
        var index = 0
        index = GetPrizeIndex(prize: currentPrize, list: prizeList)!
        
        prizeList.remove(at: index)
        
        index = GetPrizeIndex(prize: currentPrize, list: currentUser.userPrizes)!
        
        //TODO: go through every other account and remove prize
        removePrizeFromAccounts(prize: currentPrize)
        
        
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
}
