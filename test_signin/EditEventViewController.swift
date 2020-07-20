//
//  EditEventViewController.swift
//  test_signin
//
//  Created by administrator on 7/19/20.
//  Copyright © 2020 huh. All rights reserved.
//
import UIKit
import Foundation
class EditEventViewController: ViewController {
    @IBOutlet weak var eventName: UITextField!
    
    @IBOutlet weak var eventDescription: UITextField!
    
    @IBOutlet weak var eventLocation: UITextField!
    
    @IBOutlet weak var eventPoints: UITextField!
    
    @IBOutlet weak var eventDate: UIDatePicker!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Receives a notification to update the event labels
        NotificationCenter.default.addObserver(self, selector: #selector(ChangeEventLabels), name: Notification.Name("ChangeEventLabels"), object: nil)
    }
    //change the labels so that they match the current event
    @objc func ChangeEventLabels() {
        eventName.text = currentEvent.eventName
        eventDescription.text = currentEvent.eventDescription
        eventPoints.text = String(currentEvent.eventPoints)
    }
    //saves changes to the event
    @IBAction func saveEventButton(_ sender: Any) {
        
        if (!eventPoints.text!.isDouble) {
            ShowAlert(Title: "Error", Message: "Please put in a valid number", ViewController: self, ButtonMessage: "Ok")
        }
        else if (eventName.text! == "") {
            ShowAlert(Title: "Error", Message: "Name cannot be blank", ViewController: self, ButtonMessage: "Ok")
        }
        else if (eventDescription.text! == "") {
            ShowAlert(Title: "Error", Message: "Description cannot be blank", ViewController: self, ButtonMessage: "Ok")
        }
        else {
            //remove from event list
            var index = 0
            index = GetEventIndex(event: currentEvent, list: eventList)!
            let element = eventList.remove(at: index)
            //make a new event with all the changes
            var newEvent = Event()
            newEvent.eventName = eventName.text!
            newEvent.eventDescription = eventDescription.text!
            newEvent.eventPoints = Double(eventPoints.text!)!
            newEvent.eventImage = element.eventImage
            newEvent.eventID = element.eventID
            newEvent.publisher = element.publisher
            
            eventList.append(newEvent)
            //look for accounts that have the event and change them
            addToAccounts(event: currentEvent, newEvent: newEvent)
            //save everything
            SaveChanges()
            //change storyboard programatically
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let nextViewController = storyboard.instantiateViewController(withIdentifier: "myEvents") as! MyEventsViewController
            self.present(nextViewController, animated:true, completion:nil)
            //sends a notification that an event has changed
            NotificationCenter.default.post(name: Notification.Name("EventChanged"), object: nil)
        }
        
        
        
        
    }
    //deletes event from event list and all accounts that have the current event
    @IBAction func DeleteEventButton(_ sender: Any) {
        //removes event from event list
        var index = 0
        index = GetEventIndex(event: currentEvent, list: eventList)!
        
        eventList.remove(at: index)
        //removes event from every account
        removeEventFromAccounts(event: currentEvent)
        //save all changes
        SaveChanges()
        //change storyboard programatically
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "myEvents") as! MyEventsViewController
        self.present(nextViewController, animated:true, completion:nil)
        
        NotificationCenter.default.post(name: Notification.Name("EventChanged"), object: nil)
    }
    //removes event from all accounts
    func removeEventFromAccounts(event: Event) {
        for account in accounts {
            var found = false
            var index = 0
            for events in account.userEvents {
                if (events.eventName == event.eventName) {
                    found = true
                }
                else if (found == false){
                    index += 1
                }
            }
            if (found) {
                account.userEvents.remove(at: index)
            }
            
        }
    }
    
    //adds changes to all the accounts
    func addToAccounts(event: Event, newEvent: Event) {
        for account in accounts {
            var found = false
            var index = 0
            for events in account.userEvents {
                if (events.eventName == event.eventName) {
                    found = true
                }
                else if (found == false){
                    index += 1
                }
            }
            if (found) {
                account.userEvents.remove(at: index)
                account.userEvents.append(newEvent)
            }
            
        }
    }
}
