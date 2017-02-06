//
//  ClockViewController.swift
//  SlideMenu
//
//  Created by Hoan Tran on 1/12/17.
//  Copyright © 2017 Pego Consulting. All rights reserved.
//

import UIKit

class ClockViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var noWorkerLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var timer: Timer!
    
    var clocks: [Animal]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noWorkerLabel.isHidden = self.clocks.count == 0
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerFired), userInfo: nil, repeats: true)
    }

    deinit {
        self.timer?.invalidate()
        self.timer = nil
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func timerFired(timer: Timer) {
        let visibles = self.tableView.visibleCells
        for cell in visibles {
            if let labelCell = cell as? LabelCell {
                labelCell.updateTimeInterval()
            }
        }
    }

    @IBAction func menuTapped(_ sender: Any) {
        print("menu tapped on clock")
        NotificationCenter.default.post(Notification(name: .menuTapped, object: self))
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let animal = self.clocks[indexPath.row]
        
        if let _ = animal.timestamp {
            return 55
        } else {
            return 155
        }
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.clocks.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let animal = self.clocks[indexPath.row]
        
        if let _ = animal.timestamp {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath) as! LabelCell
            cell.config(animal)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath)
            let imgView: UIImageView = cell.viewWithTag(99) as! UIImageView
            imgView.image = animal.image
            //            UIView.animate(withDuration: 1.2, delay: 0, options: [.autoreverse, .repeat], animations: {
            //                imgView.alpha = 0.0
            //            }, completion: { finished in
            //                imgView.alpha = 1.0
            //            })
            
            let lbl: UILabel = cell.viewWithTag(100) as! UILabel
            lbl.text = animal.title
            return cell
        }
        
        
//        if indexPath.row % 2 == 0 {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath)
//            let imgView: UIImageView = cell.viewWithTag(99) as! UIImageView
//            imgView.image = animal.image
////            UIView.animate(withDuration: 1.2, delay: 0, options: [.autoreverse, .repeat], animations: {
////                imgView.alpha = 0.0
////            }, completion: { finished in
////                imgView.alpha = 1.0
////            })
//            
//            let lbl: UILabel = cell.viewWithTag(100) as! UILabel
//            lbl.text = animal.title
//            return cell
//        } else {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath) as! LabelCell
//            cell.config(animal)
//            
////            let lbl: UILabel = cell.viewWithTag(110) as! UILabel
////            lbl.text = animal.title
////            
////            let imgView1: UIImageView = cell.viewWithTag(1001) as! UIImageView
////            let rotationAnimation1 = CABasicAnimation()
////            rotationAnimation1.keyPath = "transform.rotation.z"
////            rotationAnimation1.toValue = -M_PI * 2.0
////            rotationAnimation1.duration = 1.0
////            rotationAnimation1.isCumulative = true
////            rotationAnimation1.repeatCount = .infinity
////            imgView1.layer.add(rotationAnimation1, forKey: "rotationAnimation")
////
////            let imgView2: UIImageView = cell.viewWithTag(1002) as! UIImageView
////            let rotationAnimation2 = CABasicAnimation()
////            rotationAnimation2.keyPath = "transform.rotation.z"
////            rotationAnimation2.toValue = M_PI * 2.0
////            rotationAnimation2.duration = 2.0
////            rotationAnimation2.isCumulative = true
////            rotationAnimation2.repeatCount = .infinity
////            imgView2.layer.add(rotationAnimation2, forKey: "rotationAnimation")
////
////            let imgView3: UIImageView = cell.viewWithTag(1003) as! UIImageView
////            let rotationAnimation3 = CABasicAnimation()
////            rotationAnimation3.keyPath = "transform.rotation.z"
////            rotationAnimation3.toValue = -M_PI * 2.0
////            rotationAnimation3.duration = 4.0
////            rotationAnimation3.isCumulative = true
////            rotationAnimation3.repeatCount = .infinity
////            imgView3.layer.add(rotationAnimation3, forKey: "rotationAnimation")
//
//            return cell
//        }
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected: \(indexPath.row)")
    }
}


class LabelCell: UITableViewCell {
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var timerCircle1: UIImageView!
    @IBOutlet weak var timerCircle2: UIImageView!
    @IBOutlet weak var timerCircle3: UIImageView!
    @IBOutlet weak var timerLabel: UILabel!
    
    var timeInterval: TimeInterval = 0 {
        didSet {
            let elapsed = Int(timeInterval)
            let hours = Int(elapsed/(60*60))
            let minutes = Int( (elapsed - (hours*60*60))/60 )
            let seconds = Int( elapsed - (hours*60*60) - (minutes*60))
            self.timerLabel.text = "\( String(format: "%02d", hours) ):\(String(format: "%02d", minutes)):\(String(format: "%02d", seconds))"
        }
    }
    
    var animal: Animal!
    
    func config(_ animal: Animal) {
        self.descLabel.text = animal.title
        self.animal = animal
        
        self.descLabel.text = animal.title
        
        let rotationAnimation1 = CABasicAnimation()
        rotationAnimation1.keyPath = "transform.rotation.z"
        rotationAnimation1.toValue = -M_PI * 2.0
        rotationAnimation1.duration = 1.0
        rotationAnimation1.isCumulative = true
        rotationAnimation1.repeatCount = .infinity
        self.timerCircle1.layer.add(rotationAnimation1, forKey: "rotationAnimation")
        
        let rotationAnimation2 = CABasicAnimation()
        rotationAnimation2.keyPath = "transform.rotation.z"
        rotationAnimation2.toValue = M_PI * 2.0
        rotationAnimation2.duration = 2.0
        rotationAnimation2.isCumulative = true
        rotationAnimation2.repeatCount = .infinity
        self.timerCircle2.layer.add(rotationAnimation2, forKey: "rotationAnimation")
        
        let rotationAnimation3 = CABasicAnimation()
        rotationAnimation3.keyPath = "transform.rotation.z"
        rotationAnimation3.toValue = -M_PI * 2.0
        rotationAnimation3.duration = 4.0
        rotationAnimation3.isCumulative = true
        rotationAnimation3.repeatCount = .infinity
        self.timerCircle3.layer.add(rotationAnimation3, forKey: "rotationAnimation")
        
        updateTimeInterval()
    }
    
    func updateTimeInterval() {
        self.timeInterval = Date().timeIntervalSince(self.animal.timestamp!)
    }
}




