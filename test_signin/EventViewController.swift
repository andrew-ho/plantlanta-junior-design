//
//  EventViewController.swift
//  test_signin
//
//  Created by Steven Greenberg on 6/24/20.
//  Copyright © 2020 huh. All rights reserved.
//

import UIKit

class EventViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        EventCollection.delegate = self
        EventCollection.dataSource = self
    }
    
    let eventNames: [String] = ["Event 1", "Event 2", "Event 3", "Event 4", "Event 5"]
    
    @IBOutlet weak var EventCollection: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return eventNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = EventCollection.dequeueReusableCell(withReuseIdentifier: "EventCell", for: indexPath) as! EventCollectionCell
        cell.backgroundColor = UIColor.red
        cell.configureEventName(with: eventNames[indexPath.row])
        return cell
    }
}
