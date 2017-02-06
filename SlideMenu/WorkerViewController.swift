//
//  WorkerViewController
//  SlideOutMenu
//
//  Created by Hoan Tran on 1/11/17.
//  Copyright © 2017 Pego Consulting. All rights reserved.
//

import UIKit

class WorkerViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var img: UIImageView!


    override func viewDidLoad() {
        super.viewDidLoad()
        self.label.text = "Believer"
        self.img.image = UIImage(named: "dog.1.jpg")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func menuTapped(_ sender: UIBarButtonItem) {
        print("tapped")
        NotificationCenter.default.post(Notification(name: .menuTapped, object: self))
    }
}
