//
//  Animal.swift
//  SlideOutMenu
//
//  Created by Hoan Tran on 1/11/17.
//  Copyright © 2017 Pego Consulting. All rights reserved.
//

import UIKit

extension Notification.Name {
    static let workSelected = Notification.Name("workSelected")
    static let clockSelected = Notification.Name("clockSelected")
    static let vcSelected = Notification.Name("vcSelected")
    static let menuTapped = Notification.Name("menuTapped")
}

class Animal {
    
    let title: String
    let creator: String
    let image: UIImage?
    let notif: Notification.Name
    let timestamp: Date?
    
    init(title: String, creator: String, image: UIImage?, notif: Notification.Name, timestamp: Date?) {
        self.title = title
        self.creator = creator
        self.image = image
        self.notif = notif
        self.timestamp = timestamp
    }
    
    class func allCats() -> Array<Animal> {
        return [    Animal(title: "Rumble", creator: "papa", image: UIImage(named: "cat.2.jpg"), notif: .workSelected   , timestamp: Date() ),
                    Animal(title: "Bronx", creator: "mama" , image: UIImage(named: "cat.3.jpg"), notif: .clockSelected  , timestamp: Date() ),
                    Animal(title: "Rumble", creator: "papa", image: UIImage(named: "cat.2.jpg"), notif: .workSelected   , timestamp: nil    ),
                    Animal(title: "Bronx", creator: "mama" , image: UIImage(named: "cat.3.jpg"), notif: .clockSelected  , timestamp: nil    ),
                    Animal(title: "Rumble", creator: "papa", image: UIImage(named: "cat.2.jpg"), notif: .workSelected   , timestamp: nil    ),
                    Animal(title: "Bronx", creator: "mama" , image: UIImage(named: "cat.3.jpg"), notif: .clockSelected  , timestamp: Date() ),
                    Animal(title: "Rumble", creator: "papa", image: UIImage(named: "cat.2.jpg"), notif: .workSelected   , timestamp: nil    ),
                    Animal(title: "Bronx", creator: "mama" , image: UIImage(named: "cat.3.jpg"), notif: .clockSelected  , timestamp: Date() )
        ]
    }
    
    class func allDogs() -> Array<Animal> {
        return [    Animal(title: "SFO", creator: "aunt", image: UIImage(named: "dog.2.jpg"), notif: .workSelected      , timestamp: Date()  ),
                    Animal(title: "SJC", creator: "uncl", image: UIImage(named: "dog.3.jpg"), notif: .clockSelected     , timestamp: nil     )
        ]
    }
}

