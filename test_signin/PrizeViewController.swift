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
    
    do {
        prizeFile = try JSONSerialization.loadJSON(withFilename: "prizes.txt") as! [[String : Any]]
    }
    catch {
        print("Something went wrong or file does not exist")
    }
    
    prizeList = getPrizes()
    
    //Receives notification of a successful event sign up
    NotificationCenter.default.addObserver(self, selector: #selector(ShowPrizeAlert), name: Notification.Name("PrizeSuccessfullyPurchased"), object: nil)
    
}
    @objc func ShowPrizeAlert() {
        ShowAlert(Title: "Success!", Message: "You have succesfully signed up for the event", ViewController: self, ButtonMessage: "Ok")
    }
    //let Prize: [Prizes] = [Prizes(prizeName: "Prize 1", prizeID: 0, prizeDescription: "Prize 1", prizePoints: 0, prizeImage: "prize1", publisher: "publisher 1"), Prizes(prizeName: "Prize2", prizeID: 1, prizeDescription: "Prize 2", prizePoints: 0, prizeImage: "prize2", publisher: "publisher 2")]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return prizeList.count
       }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = PrizeFunction.dequeueReusableCell(withReuseIdentifier: "PrizeView", for: indexPath) as! PrizeCollectionCell
        cell.ConfigurePrizeName(with: prizeList [indexPath.row])
        
        cell.ConfigurePrizeImage(with: prizeList [indexPath.row])
        return cell
    }
    var index = 0
    func collectionView(_ collectionView: UICollectionView,
    didSelectItemAt indexPath: IndexPath) {
        currentPrize = prizeList [indexPath.row]
        index = indexPath.row
        NotificationCenter.default.post(name: Notification.Name("UpdateLabel"), object: nil)
    }
    
    
    @IBOutlet weak var EventCollection: UICollectionView!
    @IBOutlet weak var PrizeFunction: UICollectionView!
    
    
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
