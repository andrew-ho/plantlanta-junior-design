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
    
    
    var event: Event = Event()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        //Receives notification if an event was selected
        NotificationCenter.default.addObserver(self, selector: #selector(ChangeLabel), name: Notification.Name("UpdateLabel"), object: nil)
    }
    
    //Changes the label so that the label changes to the current event
    @objc func ChangeLabel() {
        EventNameLabel.text = currentEvent.eventName
        eventText.text = currentEvent.eventDescription
        EventImage.image = UIImage(named: currentEvent.eventImage)
    }
    
    
    //Signs the user to the event
    @IBAction func EventSignUpButton(_ sender: Any) {
        currentUser.userEvents.append(currentEvent)
        
        //Change the storyboard programmatically
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Events") as! EventViewController
        self.present(nextViewController, animated:true, completion:nil)
        
        
        //Sending notification back to events
        NotificationCenter.default.post(name: Notification.Name("EventSignInSuccessAlert"), object: nil)
    }
}

