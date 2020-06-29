//
//  PrizeViewController.swift
//  test_signin
//
//  Created by YaSs on 6/29/20.
//  Copyright © 2020 huh. All rights reserved.
//

import Foundation
import UIKit

class PrizeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

override func viewDidLoad() {
    super.viewDidLoad()
    
    PrizeFunction.delegate = self
    PrizeFunction.dataSource = self
    
    
    //Receives notification of a successful event sign up
    NotificationCenter.default.addObserver(self, selector: #selector(ShowPrizeAlert), name: Notification.Name("PrizeSuccessfullyPurchased"), object: nil)
    
}
    @objc func ShowPrizeAlert() {
        ShowAlert(Title: "Success!", Message: "You have succesfully signed up for the event", ViewController: self, ButtonMessage: "Ok")
    }
    let Prize: [Prizes] = [Prizes(prizeName: "Prize 1", prizeID: 0, prizeDescription: "Prize 1", prizePoints: 0), Prizes(prizeName: "Prize1", prizeID: 0, prizeDescription: "Prize 1", prizePoints: 0)]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return Prize.count
       }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = PrizeFunction.dequeueReusableCell(withReuseIdentifier: "PrizeView", for: indexPath) as! UICollectionViewCell
        cell.backgroundColor = UIColor.red
//        cell.configureEventName(with: Prize [indexPath.row])
        return cell
    }
    var index = 0
    func collectionView(_ collectionView: UICollectionView,
    didSelectItemAt indexPath: IndexPath) {
        currentPrize = Prize[indexPath.row]
        index = indexPath.row
        NotificationCenter.default.post(name: Notification.Name("UpdateLabel"), object: nil)
    }
    
    
    @IBOutlet weak var EventCollection: UICollectionView!
    @IBOutlet weak var PrizeFunction: UICollectionView!
    
}
