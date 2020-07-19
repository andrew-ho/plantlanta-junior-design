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
        
    }
    
    @IBAction func DeletePrizeButton(_ sender: Any) {
        var index = 0
        index = GetPrizeIndex(prize: currentPrize, list: prizeList)!
        
        prizeList.remove(at: index)
        
        index = GetPrizeIndex(prize: currentPrize, list: currentUser.userPrizes)!
        
        //TODO: go through every other account and remove prize
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "myEvents") as! MyEventsViewController
        self.present(nextViewController, animated:true, completion:nil)
    }
    
}
