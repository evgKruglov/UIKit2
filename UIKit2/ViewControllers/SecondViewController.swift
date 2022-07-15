//
//  SecondViewController.swift
//  UIKit2
//
//  Created by Евгений Кухаренко on 13.07.2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    var segmentConrol = UISegmentedControl()
    var imageView = UIImageView()
    var menuArray = ["one", "two", "three"]
    let imageArrays = [
        UIImage(named: "1.jpeg"),
        UIImage(named: "2.jpeg"),
        UIImage(named: "3.jpeg")
    ]

    override func viewDidLoad() {
        // create segment
        super.viewDidLoad()
        self.segmentConrol = UISegmentedControl(items: self.menuArray)
        self.segmentConrol.frame = CGRect(x: 100, y: 730, width: 200, height: 30)
        self.view.addSubview(self.segmentConrol)
        self.segmentConrol.isMomentary = false
        self.segmentConrol.addTarget(self, action: #selector(selectedValue(target:)), for: .valueChanged)
        
        //create image
        self.imageView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        self.imageView.center = self.view.center
        self.imageView.image = self.imageArrays[0]
        self.view.addSubview(imageView)
    }
    
    @objc func selectedValue(target: UISegmentedControl) {
        if target == self.segmentConrol {
            let segmentIndex = target.selectedSegmentIndex
            self.imageView.image = self.imageArrays[segmentIndex]
        }
    }
        
}
