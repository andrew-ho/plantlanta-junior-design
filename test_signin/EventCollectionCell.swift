//
//  EventCollectionCell.swift
//  test_signin
//
//  Created by Steven Greenberg on 6/24/20.
//  Copyright © 2020 huh. All rights reserved.
//

import UIKit

class EventCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var EventName: UILabel!
    
    func configureEventName(with eventName: String) {
        EventName.text = eventName
    }
}
