//
//  MyPrizesViewController.swift
//  test_signin
//
//  Created by administrator on 7/18/20.
//  Copyright © 2020 huh. All rights reserved.
//

import Foundation
import UIKit

class MyPrizesViewController: ViewController {
    
    
    @IBOutlet weak var myPrizeCollectionView: UICollectionView!
    
    @IBOutlet weak var addPrizeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (currentUser.accountType == "Volunteer") {
            addPrizeButton.isHidden = true
        }
        
        //Receives notification of a successful event sign up
        NotificationCenter.default.addObserver(self, selector: #selector(ShowAddedPrizeAlert), name: Notification.Name("PrizeAdded"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ShowChangedPrizeAlert), name: Notification.Name("PrizeChanged"), object: nil)
    }
    
    @objc func ShowAddedPrizeAlert() {
        ShowAlert(Title: "Success!", Message: "The prize has been added", ViewController: self, ButtonMessage: "Ok")
    }
    
    @objc func ShowChangedPrizeAlert() {
        ShowAlert(Title: "Success!", Message: "The prize has been changed/removed", ViewController: self, ButtonMessage: "Ok")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentUser.userPrizes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myPrizeCollectionView.dequeueReusableCell(withReuseIdentifier: "myPrizeCell", for: indexPath) as! myPrizeCollectionCell
        cell.ConfigureMyPrizeName(with: currentUser.userPrizes[indexPath.row])
        cell.ConfigureMyPrizeImage(with: currentUser.userPrizes[indexPath.row])
        return cell
    }
    
    var index = 0
    
    func collectionView(_ collectionView: UICollectionView,
    didSelectItemAt indexPath: IndexPath) {
        currentPrize = currentUser.userPrizes[indexPath.row]
        index = indexPath.row
        NotificationCenter.default.post(name: Notification.Name("ChangePrizeLabels"), object: nil)
    }
    
}
