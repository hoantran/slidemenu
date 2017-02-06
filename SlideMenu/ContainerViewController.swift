//
//  ContainerViewController.swift
//  SlideOutMenu
//
//  Created by Hoan Tran on 1/11/17.
//  Copyright © 2017 Pego Consulting. All rights reserved.
//

// TODO: while menu out, click on right panel should close the menu


import UIKit

class ContainerViewController: UIViewController {
    var leftViewController: UIViewController? {
        willSet{
            if self.leftViewController != nil {
                if self.leftViewController!.view != nil {
                    self.leftViewController!.view!.removeFromSuperview()
                }
                self.leftViewController!.removeFromParentViewController()
            }
        }
        
        didSet{
            self.view!.addSubview(self.leftViewController!.view)
            self.addChildViewController(self.leftViewController!)
        }
    }
    
    var rightViewController: UIViewController? {
        willSet {
            if self.rightViewController != nil {
                if self.rightViewController!.view != nil {
                    self.rightViewController!.view!.removeFromSuperview()
                }
                self.rightViewController!.removeFromParentViewController()
            }
        }
        
        didSet{
            self.view!.addSubview(self.rightViewController!.view)
            self.addChildViewController(self.rightViewController!)
        }
    }
    
    var menuShown: Bool = false
    
    @IBAction func swipeRight(_ sender: UISwipeGestureRecognizer) {
        showMenu()
    }
    
    @IBAction func swipeLeft(_ sender: UISwipeGestureRecognizer) {
        hideMenu()
    }
    
    func showMenu() {
        showShadowForCenterViewController(true)
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.rightViewController!.view.frame.origin.x = self.view.frame.origin.x + 235
            }, completion: { (Bool) -> Void in
                self.menuShown = true
        })
        
    }
    
    func hideMenu() {
        showShadowForCenterViewController(false)
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.rightViewController!.view.frame.origin.x = 0
            }, completion: { (Bool) -> Void in
                self.menuShown = false
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainNavigationController: UINavigationController    = storyboard.instantiateViewController(withIdentifier: "NavVC")  as! UINavigationController
        let menuViewController      : MenuViewController        = storyboard.instantiateViewController(withIdentifier: "MenuVC") as! MenuViewController
        menuViewController.animals = Animal.allDogs()
        
        self.leftViewController = menuViewController
        self.rightViewController = mainNavigationController
        
        addNewVCObserver()
    }
    
    private func addNewVCObserver() {
        let center = NotificationCenter.default
        
        center.addObserver(forName: .vcSelected, object: nil, queue: nil) { (notification: Notification!) in
            self.hideMenu()
        }
        
        center.addObserver(forName: .menuTapped, object: nil, queue: nil) { (notification: Notification!) in
            self.showMenu()
        }
    }
    
    func showShadowForCenterViewController(_ shouldShowShadow: Bool) {
        if (shouldShowShadow) {
            self.rightViewController?.view.layer.shadowOpacity = 0.8
        } else {
            self.rightViewController?.view.layer.shadowOpacity = 0.0
        }
    }
    
}
