//
//  MenuViewController.swift
//  SlideOutMenu
//
//  Created by Hoan Tran on 1/11/17.
//  Copyright © 2017 Pego Consulting. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var animals: Array<Animal>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.animals.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalCell", for: indexPath) as! AnimalCell
        cell.configureForAnimal(self.animals[indexPath.row])
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedAnimal = animals[indexPath.row]
//        delegate?.animalSelected(selectedAnimal)
        let center = NotificationCenter.default
        
        center.post(Notification(name: selectedAnimal.notif, object: self))
        center.post(Notification(name: .vcSelected, object: self))
    }
}


class AnimalCell: UITableViewCell {
    @IBOutlet weak var animalImageView: UIImageView!
    @IBOutlet weak var animalTitleLabel: UILabel!
    
    
    func configureForAnimal(_ animal: Animal) {
        animalImageView.image = animal.image
        animalTitleLabel.text = animal.title
    }
}

