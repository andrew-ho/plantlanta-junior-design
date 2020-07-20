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
        do {
            eventFile = try JSONSerialization.loadJSON(withFilename: "events2.txt") as! [[String : Any]]
        }
        catch {
            print("Something went wrong or file does not exist")
        }
        
        
        eventList = getEvents()
        
        //Receives notification of a successful event sign up
        NotificationCenter.default.addObserver(self, selector: #selector(ShowEventAlert), name: Notification.Name("EventSignInSuccessAlert"), object: nil)
        
        print(eventList.count)
    }
    
    //Shows an alert that the user has sucessfully signed up
    @objc func ShowEventAlert() {
        ShowAlert(Title: "Success!", Message: "You have succesfully signed up for the event", ViewController: self, ButtonMessage: "Ok")
    }
    
    //An array containing events
    //let Events: [Event] = [Event(eventName: "Event1", eventID: 0, eventDescription: "Event 1", eventImage: "volunteer1", publisher: "publisher 1", time: "time", eventPoints: 0), Event(eventName: "Event2", eventID: 1, eventDescription: "Event 2", eventImage: "volunteer2", publisher: "publisher 2", time: "time", eventPoints: 0), Event(eventName: "Event3", eventID: 2, eventDescription: "Event 3", eventImage: "volunteer3", publisher: "publisher 3", time: "time", eventPoints: 0), Event(eventName: "Event 4", eventID: 3, eventDescription: "Event 4", eventImage: "volunteer4", publisher: "publisher 4", time: "time", eventPoints: 0), Event(eventName: "Event 5", eventID: 4, eventDescription: "Event 5", eventImage: "volunteer5", publisher: "publisher 5", time: "time", eventPoints: 0)]
    
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

