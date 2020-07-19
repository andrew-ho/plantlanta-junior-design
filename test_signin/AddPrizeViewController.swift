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
    
    func saveEvent() {
        var prize = Prizes()
        prize.prizeName = prizeName.text!
        prize.prizeDescription = prizeDescription.text!
        prize.prizePoints = Double(prizePoints.text!)!
        prize.publisher = currentUser.name
        
        AddPrize(prize: prize)
    }
}
