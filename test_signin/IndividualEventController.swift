//
//  IndividualEventController.swift
//  test_signin
//
//  Created by Steven Greenberg on 6/25/20.
//  Copyright © 2020 huh. All rights reserved.
//

import UIKit
import Foundation

class IndividualEventController: ViewController {
    
    @IBOutlet weak var EventNameLabel: UILabel!
    
    @IBOutlet weak var eventText: UITextView!
    
    @IBOutlet weak var EventImage: UIImageView!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    @IBOutlet weak var signUpButton: UIButton!
    
    var event: Event = Event()
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        datePicker.addTarget(self, action: #selector(datePickerChanged(sender:)), for: .valueChanged)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(showSignUp), name: Notification.Name("Show"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(hideSignUp), name: Notification.Name("Hide"), object: nil)
        //Receives notification if an event was selected
        NotificationCenter.default.addObserver(self, selector: #selector(ChangeLabel), name: Notification.Name("UpdateLabel"), object: nil)
    }
    //listens to any change in the date picker
    @objc func datePickerChanged(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .full
        let strDate = dateFormatter.string(from: sender.date)
        print(strDate)
    }
    
    @objc func showSignUp() {
        signUpButton.isHidden = false
    }
    @objc func hideSignUp() {
        signUpButton.isHidden = true
    }
    //Changes the label so that the label changes to the current event
    @objc func ChangeLabel() {
        EventNameLabel.text = currentEvent.eventName
        eventText.text = currentEvent.eventDescription
        EventImage.image = UIImage(named: currentEvent.eventImage)
    }
    
    
    //Signs the user to the event
    @IBAction func EventSignUpButton(_ sender: Any) {
        //checks if the user already has signed up for the event
        var duplicate = false
        for ev in currentUser.userEvents {
            if (ev.eventName == currentEvent.eventName) {
                duplicate = true
            }
        }
        if (duplicate) {
            ShowAlert(Title: "Error", Message: "You have already signed up for this event", ViewController: self, ButtonMessage: "Ok")
        }
        else {
            //changes date to a string
            let formatter = DateFormatter()
            formatter.dateStyle = .full
            formatter.timeStyle = .full
            let dateString = formatter.string(from: datePicker.date)
            currentEvent.time = dateString
            //adds event to the user
            InsertEventToUser(email: currentUser.email, event: currentEvent)
            
            //Change the storyboard programmatically
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Events") as! EventViewController
            self.present(nextViewController, animated:true, completion:nil)
            
            
            //Sending notification back to events
            NotificationCenter.default.post(name: Notification.Name("EventSignInSuccessAlert"), object: nil)
        }
    }
}

