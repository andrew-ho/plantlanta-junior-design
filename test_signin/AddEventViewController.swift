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
        
        
    }
    
    func saveEvent() {
        var event = Event()
        event.eventDescription = eventDescription.text!
        //event.eventID = Double(eventList.count + 1)
        event.eventName = eventName.text!
        event.eventPoints = Double(eventPoints.text!)!
        event.publisher = currentUser.name
        
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .full
        let dateString = formatter.string(from: eventDate.date)
        event.time = dateString
        
        AddEvent(event: event)
    }
    
}
