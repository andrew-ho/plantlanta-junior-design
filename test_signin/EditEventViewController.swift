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
        
        
    }
    
    @objc func ChangeLabel() {
        eventName.text = currentEvent.eventName
        eventDescription.text = currentEvent.eventDescription
        eventPoints.text = String(currentEvent.eventPoints)
    }
    
    @IBAction func DeleteEventButton(_ sender: Any) {
        var index = 0
        index = GetEventIndex(event: currentEvent, list: eventList)!
        
        eventList.remove(at: index)
        
        index = GetEventIndex(event: currentEvent, list: currentUser.userEvents)!
        
        //TODO: go through every other account and remove event
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "myEvents") as! MyEventsViewController
        self.present(nextViewController, animated:true, completion:nil)
    }
}
