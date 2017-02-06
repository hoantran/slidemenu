//
//  NavigationViewController.swift
//  SlideMenu
//
//  Created by Hoan Tran on 1/13/17.
//  Copyright © 2017 Pego Consulting. All rights reserved.
//

import UIKit

class NavigationViewController: UINavigationController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addObservers()
    }
    
    private func addObservers() {
        let center = NotificationCenter.default
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        center.addObserver(forName: .workSelected, object: nil, queue: nil) { (notification: Notification!) in
            let mvc = storyboard.instantiateViewController(withIdentifier: "WorkerVC")
            self.setViewControllers([mvc], animated: true)
        }
        
        center.addObserver(forName: .clockSelected, object: nil, queue: nil) { (notification: Notification!) in
            let mvc = storyboard.instantiateViewController(withIdentifier: "ClockVC") as! ClockViewController
            mvc.clocks = Animal.allCats()
            self.setViewControllers([mvc], animated: true)
        }
    }
}
