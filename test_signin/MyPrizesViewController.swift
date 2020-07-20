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
        
        if (currentUser.accountType == "Volunteer" || currentUser.accountType == "Organization") {
            addPrizeButton.isHidden = true
        }
        
        //Receives notification that the prize has been added
        NotificationCenter.default.addObserver(self, selector: #selector(ShowAddedPrizeAlert), name: Notification.Name("PrizeAdded"), object: nil)
        //receives notification that the prize has been changed
        NotificationCenter.default.addObserver(self, selector: #selector(ShowChangedPrizeAlert), name: Notification.Name("PrizeChanged"), object: nil)
    }
    //shows alert that the prize has been added
    @objc func ShowAddedPrizeAlert() {
        ShowAlert(Title: "Success!", Message: "The prize has been added", ViewController: self, ButtonMessage: "Ok")
    }
    //shows alert that the prize has been changed
    @objc func ShowChangedPrizeAlert() {
        ShowAlert(Title: "Success!", Message: "The prize has been changed/removed", ViewController: self, ButtonMessage: "Ok")
    }
    //returns the number of prizes that the user has collected
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentUser.userPrizes.count
    }
    //configures prize name and image
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myPrizeCollectionView.dequeueReusableCell(withReuseIdentifier: "myPrizeCell", for: indexPath) as! myPrizeCollectionCell
        cell.ConfigureMyPrizeName(with: currentUser.userPrizes[indexPath.row])
        cell.ConfigureMyPrizeImage(with: currentUser.userPrizes[indexPath.row])
        return cell
    }
    
    var index = 0
    //decide which storyboard to go to
    func collectionView(_ collectionView: UICollectionView,
    didSelectItemAt indexPath: IndexPath) {
        currentPrize = currentUser.userPrizes[indexPath.row]
        index = indexPath.row
        //if the user is the same as the one who added, go to edit prizes controller
        if (currentPrize.publisher == currentUser.name) {
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let nextViewController = storyboard.instantiateViewController(withIdentifier: "editPrize") as! EditPrizeViewController
            self.present(nextViewController, animated:true, completion:nil)
            
            NotificationCenter.default.post(name: Notification.Name("ChangePrizeLabels"), object: nil)
        }
        //if user is not the same as the one who added, go to individual prizes controller
        else {
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let nextViewController = storyboard.instantiateViewController(withIdentifier: "individualPrize") as! IndividualPrizeController
            self.present(nextViewController, animated:true, completion:nil)
            
            NotificationCenter.default.post(name: Notification.Name("UpdateLabel"), object: nil)
        }
    }
    
}
