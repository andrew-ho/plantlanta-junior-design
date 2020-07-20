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
        //loads events and puts it in the event list
        do {
            eventFile = try JSONSerialization.loadJSON(withFilename: "events2.txt") as! [[String : Any]]
        }
        catch {
            print("Something went wrong or file does not exist")
        }
        
        
        eventList = getEvents()
        
        //Receives notification of a successful event sign up
        NotificationCenter.default.addObserver(self, selector: #selector(ShowEventAlert), name: Notification.Name("EventSignInSuccessAlert"), object: nil)
    }
    
    //Shows an alert that the user has sucessfully signed up
    @objc func ShowEventAlert() {
        ShowAlert(Title: "Success!", Message: "You have succesfully signed up for the event", ViewController: self, ButtonMessage: "Ok")
    }
    
    @IBOutlet weak var EventCollection: UICollectionView!
    
    var index = 0
    
    //Returns the number of items in the events array
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return eventList.count
    }
    
    //Changes the label in the collectionview to match the event
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = EventCollection.dequeueReusableCell(withReuseIdentifier: "EventCell", for: indexPath) as! EventCollectionCell
        cell.configureEventName(with: eventList[indexPath.row])
        cell.configureEventImage(with: eventList[indexPath.row])
        return cell
    }
    
    
    //Sends a notification on which event was selected to the individual events page
    func collectionView(_ collectionView: UICollectionView,
    didSelectItemAt indexPath: IndexPath) {
        currentEvent = eventList[indexPath.row]
        index = indexPath.row
        NotificationCenter.default.post(name: Notification.Name("UpdateLabel"), object: nil)
    }
    
    
}

