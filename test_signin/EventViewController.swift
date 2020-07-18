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
        
        InsertEvent(email: currentUser.email, event: Event())
        //Receives notification of a successful event sign up
        NotificationCenter.default.addObserver(self, selector: #selector(ShowEventAlert), name: Notification.Name("EventSignInSuccessAlert"), object: nil)
    }
    
    //Shows an alert that the user has sucessfully signed up
    @objc func ShowEventAlert() {
        ShowAlert(Title: "Success!", Message: "You have succesfully signed up for the event", ViewController: self, ButtonMessage: "Ok")
    }
    
    //An array containing events
    let Events: [Event] = [Event(eventName: "Event1", eventID: 0, eventDescription: "Event 1", eventImage: "volunteer1"), Event(eventName: "Event2", eventID: 1, eventDescription: "Event 2", eventImage: "volunteer2"), Event(eventName: "Event3", eventID: 2, eventDescription: "Event 3", eventImage: "volunteer3"), Event(eventName: "Event 4", eventID: 3, eventDescription: "Event 4", eventImage: "volunteer4"), Event(eventName: "Event 5", eventID: 4, eventDescription: "Event 5", eventImage: "volunteer5")]
    
    @IBOutlet weak var EventCollection: UICollectionView!
    
    var index = 0
    
    //Returns the number of items in the events array
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Events.count
    }
    
    //Changes the label in the collectionview to match the event
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = EventCollection.dequeueReusableCell(withReuseIdentifier: "EventCell", for: indexPath) as! EventCollectionCell
        cell.configureEventName(with: Events[indexPath.row])
        cell.configureEventImage(with: Events[indexPath.row])
        return cell
    }
    
    
    //Sends a notification on which event was selected to the individual events page
    func collectionView(_ collectionView: UICollectionView,
    didSelectItemAt indexPath: IndexPath) {
        currentEvent = Events[indexPath.row]
        index = indexPath.row
        NotificationCenter.default.post(name: Notification.Name("UpdateLabel"), object: nil)
    }
    
}

