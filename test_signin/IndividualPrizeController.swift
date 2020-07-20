//
//  IndividualPrizeController.swift
//  test_signin
//
//  Created by Steven Greenberg on 7/10/20.
//  Copyright © 2020 huh. All rights reserved.
//

import Foundation
import UIKit

class IndividualPrizeController: ViewController {
    
    @IBOutlet weak var PrizeName: UILabel!
    
    @IBOutlet weak var PrizeText: UITextView!
    
    @IBOutlet weak var PrizeImage: UIImageView!
    
    @IBOutlet weak var prizeCost: UILabel!
    
    @IBOutlet weak var myPoints: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Sends a notification to change the label for the prize name
        NotificationCenter.default.addObserver(self, selector: #selector(ChangePrizeLabel), name: Notification.Name("UpdateLabel"), object: nil)
    }
    //changes label to the prize name
    @objc func ChangePrizeLabel() {
        prizeCost.text! = String(currentPrize.prizePoints)
        PrizeName.text = currentPrize.prizeName
        PrizeText.text = currentPrize.prizeDescription
        PrizeImage.image = UIImage(named: currentPrize.prizeImage)
        myPoints.text! = String(currentUser.userPoints)
    }
    
    
    @IBAction func RedeemPrize(_ sender: Any) {
        if (currentUser.userPoints < currentPrize.prizePoints) {
            ShowAlert(Title: "Not Enough Points", Message: "You do not have enough points for this prize", ViewController: self, ButtonMessage: "Ok")
        }
        else if (currentUser.userPoints >= currentPrize.prizePoints) {
            //adds prize to user
            InsertPrizeToUser(email: currentUser.email, prize: currentPrize)
            //Switch back to prizes
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let nextViewController = storyboard.instantiateViewController(withIdentifier: "Shop") as! PrizeViewController
            self.present(nextViewController, animated:true, completion:nil)
            
            //Sending notification back to shop scene
                NotificationCenter.default.post(name: Notification.Name("PrizeSuccessfullyPurchased"), object: nil)
            
        }
    }
    
    
}
