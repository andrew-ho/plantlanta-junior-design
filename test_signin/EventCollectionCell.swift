//
//  EventCollectionCell.swift
//  test_signin
//
//  Created by Steven Greenberg on 6/24/20.
//  Copyright © 2020 huh. All rights reserved.
//

import UIKit

//Don't worry about this
class EventCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var EventName: UILabel!
    
    @IBOutlet weak var EventImage: UIImageView!
    
    
    func configureEventName(with eventName: Event) {
        EventName.text = eventName.eventName
    }
    
    func configureEventImage(with eventImage: Event) {
        EventImage.image = UIImage(named: eventImage.eventImage)
    }
}
class PrizeCollectionCell: UICollectionViewCell {
    @IBOutlet weak var PrizeName: UILabel!
    
    @IBOutlet weak var PrizeImage: UIImageView!
    
    func ConfigurePrizeName(with prizeName: Prizes) {
        PrizeName.text = prizeName.prizeName
    }
    
    func ConfigurePrizeImage(with prizeImage: Prizes) {
        PrizeImage.image = UIImage(named: prizeImage.prizeImage)
    }
}

class myEventCollectionCell:
    UICollectionViewCell {
    
    @IBOutlet weak var myEventName: UILabel!
    
    
    @IBOutlet weak var myEventImage: UIImageView!
    
    func ConfigureMyEventName(with eventName: Event) {
        myEventName.text = eventName.eventName
    }
    
    func ConfigureMyEventImage(with eventImage: Event) {
        myEventImage.image = UIImage(named: eventImage.eventImage)
    }
}

class myPrizeCollectionCell: UICollectionViewCell {
    
    
    
}
