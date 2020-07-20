//
//  AddEventViewController.swift
//  test_signin
//
//  Created by administrator on 7/18/20.
//  Copyright © 2020 huh. All rights reserved.
//

import Foundation
import UIKit

class AddEventViewController: ViewController {
    
    
    @IBOutlet weak var eventName: UITextField!
    
    @IBOutlet weak var eventDescription: UITextField!
    
    @IBOutlet weak var eventLocation: UITextField!
    
    @IBOutlet weak var eventPoints: UITextField!
    
    @IBOutlet weak var eventDate: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(eventList.count)
    }
    
    func saveEvent() {
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
            var event = Event()
            event.eventDescription = eventDescription.text!
            //event.eventID = Double(eventList.count + 1)
            event.eventName = eventName.text!
            event.eventPoints = Double(eventPoints.text!)!
            event.publisher = currentUser.name
            event.eventImage = "volunteer1"
            let formatter = DateFormatter()
            formatter.dateStyle = .full
            formatter.timeStyle = .full
            let dateString = formatter.string(from: eventDate.date)
            event.time = dateString
            
            AddEvent(event: event)
            print(eventList.count)
        }
    }
    
    
    @IBAction func saveEventButton(_ sender: Any) {
        saveEvent()
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "myEvents") as! MyEventsViewController
        self.present(nextViewController, animated:true, completion:nil)
        
        NotificationCenter.default.post(name: Notification.Name("EventAdded"), object: nil)
    }
    
}
