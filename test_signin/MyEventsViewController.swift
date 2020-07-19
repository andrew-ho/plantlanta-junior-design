//
//  MyEventsViewController.swift
//  test_signin
//
//  Created by administrator on 7/18/20.
//  Copyright © 2020 huh. All rights reserved.
//

import Foundation
import UIKit

class MyEventsViewController: ViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var addEventsButton: UIButton!
    
    
    @IBOutlet weak var myEventsCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myEventsCollection.delegate = self
        myEventsCollection.dataSource = self
        
        if (currentUser.accountType == "Volunteer") {
            addEventsButton.isHidden = true
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentUser.userEvents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myEventsCollection.dequeueReusableCell(withReuseIdentifier: "myEventsCell", for: indexPath) as! myEventCollectionCell
        cell.ConfigureMyEventName(with: currentUser.userEvents[indexPath.row])
        cell.ConfigureMyEventImage(with: currentUser.userEvents[indexPath.row])
        return cell
    }
    
    var index = 0
    
    func collectionView(_ collectionView: UICollectionView,
    didSelectItemAt indexPath: IndexPath) {
        currentEvent = currentUser.userEvents[indexPath.row]
        index = indexPath.row
        //NotificationCenter.default.post(name: Notification.Name("UpdateLabel"), object: nil)
    }
    
}
