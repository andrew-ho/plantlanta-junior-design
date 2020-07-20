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
    //gets the file containing the json strings of all the prizes
    do {
        prizeFile = try JSONSerialization.loadJSON(withFilename: "prizes.txt") as! [[String : Any]]
    }
    catch {
        print("Something went wrong or file does not exist")
    }
    //populates the prize list
    prizeList = getPrizes()
    
    //Receives notification of a successful event sign up
    NotificationCenter.default.addObserver(self, selector: #selector(ShowPrizeAlert), name: Notification.Name("PrizeSuccessfullyPurchased"), object: nil)
    
}
    @objc func ShowPrizeAlert() {
        ShowAlert(Title: "Success!", Message: "You have succesfully signed up for the event", ViewController: self, ButtonMessage: "Ok")
    }
    
    //returns number of prizes in the prize list
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return prizeList.count
       }
    
    //puts in names and images to the prizes
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = PrizeFunction.dequeueReusableCell(withReuseIdentifier: "PrizeView", for: indexPath) as! PrizeCollectionCell
        cell.ConfigurePrizeName(with: prizeList [indexPath.row])
        
        cell.ConfigurePrizeImage(with: prizeList [indexPath.row])
        return cell
    }
    var index = 0
    
    //sets the current prize
    func collectionView(_ collectionView: UICollectionView,
    didSelectItemAt indexPath: IndexPath) {
        currentPrize = prizeList [indexPath.row]
        index = indexPath.row
        NotificationCenter.default.post(name: Notification.Name("UpdateLabel"), object: nil)
    }
    
    
    @IBOutlet weak var EventCollection: UICollectionView!
    @IBOutlet weak var PrizeFunction: UICollectionView!
    
    //pupulates the prize list
    func getPrizes() -> [Prizes] {
        var prizes = [Prizes]()
        for stuff in prizeFile {
            var prize = Prizes()
            prize.prizeDescription = stuff["prizeDescription"] as! String
            prize.prizePoints = stuff["prizePoints"] as! Double
            prize.prizeImage = stuff["prizeImage"] as! String
            prize.prizeName = stuff["prizeName"] as! String
            prize.publisher = stuff["publisher"] as! String
            
            prizes.append(prize)
        }
        return prizes
        
    }
}
