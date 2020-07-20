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
        //hides add button if volunteer or sponsor
        if (currentUser.accountType == "Volunteer" || currentUser.accountType == "Sponsor") {
            addEventsButton.isHidden = true
        }
        //Receives notification of a successful event addition
        NotificationCenter.default.addObserver(self, selector: #selector(ShowAddedEventAlert), name: Notification.Name("EventAdded"), object: nil)
        //receives notification of a successful event change
        NotificationCenter.default.addObserver(self, selector: #selector(ShowChangedEventAlert), name: Notification.Name("EventChanged"), object: nil)
        
    }
    
    //Shows an alert that the event has been added
    @objc func ShowAddedEventAlert() {
        ShowAlert(Title: "Success!", Message: "The event has been added", ViewController: self, ButtonMessage: "Ok")
    }
    //shows an alert that the event has been changed
    @objc func ShowChangedEventAlert() {
        ShowAlert(Title: "Success!", Message: "The event has been changed/removed", ViewController: self, ButtonMessage: "Ok")
    }
    //returns the number of user's events
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentUser.userEvents.count
    }
    //configues event name and image for the collection cells
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myEventsCollection.dequeueReusableCell(withReuseIdentifier: "myEventsCell", for: indexPath) as! myEventCollectionCell
        cell.ConfigureMyEventName(with: currentUser.userEvents[indexPath.row])
        cell.ConfigureMyEventImage(with: currentUser.userEvents[indexPath.row])
        return cell
    }
    
    var index = 0
    //decides which storyboard to go to
    func collectionView(_ collectionView: UICollectionView,
    didSelectItemAt indexPath: IndexPath) {
        currentEvent = currentUser.userEvents[indexPath.row]
        index = indexPath.row
        //if the user is the same as the one who added, go to edit event controller
        if (currentEvent.publisher == currentUser.name) {
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let nextViewController = storyboard.instantiateViewController(withIdentifier: "editEvent") as! EditEventViewController
            self.present(nextViewController, animated:true, completion:nil)
            
            NotificationCenter.default.post(name: Notification.Name("ChangeEventLabels"), object: nil)
        }
        //if the user is not the same as the one who added, go to the individual event controller
        else {
            
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let nextViewController = storyboard.instantiateViewController(withIdentifier: "individualEvent") as! IndividualEventController
            self.present(nextViewController, animated:true, completion:nil)
            
            NotificationCenter.default.post(name: Notification.Name("UpdateLabel"), object: nil)
            NotificationCenter.default.post(name: Notification.Name("Hide"), object: nil)
        }
    }
    
}
