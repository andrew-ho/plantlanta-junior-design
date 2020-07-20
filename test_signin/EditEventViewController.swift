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
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChangeEventLabels), name: Notification.Name("ChangeEventLabels"), object: nil)
    }
    
    @objc func ChangeEventLabels() {
        eventName.text = currentEvent.eventName
        eventDescription.text = currentEvent.eventDescription
        eventPoints.text = String(currentEvent.eventPoints)
    }
    
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
            var index = 0
            index = GetEventIndex(event: currentEvent, list: eventList)!
            let element = eventList.remove(at: index)
            var newEvent = Event()
            newEvent.eventName = eventName.text!
            newEvent.eventDescription = eventDescription.text!
            newEvent.eventPoints = Double(eventPoints.text!)!
            newEvent.eventImage = element.eventImage
            newEvent.eventID = element.eventID
            newEvent.publisher = element.publisher
            
            eventList.append(newEvent)
            
            
            //index = GetEventIndex(event: currentEvent, list: currentUser.userEvents)!
            
            addToAccounts(event: currentEvent, newEvent: newEvent)
            
            SaveChanges()
            
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let nextViewController = storyboard.instantiateViewController(withIdentifier: "myEvents") as! MyEventsViewController
            self.present(nextViewController, animated:true, completion:nil)
            
            NotificationCenter.default.post(name: Notification.Name("EventChanged"), object: nil)
        }
        
        
        
        
    }
    
    @IBAction func DeleteEventButton(_ sender: Any) {
        var index = 0
        index = GetEventIndex(event: currentEvent, list: eventList)!
        
        eventList.remove(at: index)
        
        //index = GetEventIndex(event: currentEvent, list: currentUser.userEvents)!
        
        //TODO: go through every other account and remove event
        removeEventFromAccounts(event: currentEvent)
        
        SaveChanges()
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "myEvents") as! MyEventsViewController
        self.present(nextViewController, animated:true, completion:nil)
        
        NotificationCenter.default.post(name: Notification.Name("EventChanged"), object: nil)
    }
    
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
