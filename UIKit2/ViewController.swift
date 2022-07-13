//
//  ViewController.swift
//  UIKit2
//
//  Created by Евгений Кухаренко on 13.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let mySwitch2 = UISwitch()
    let button = UIButton()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //made button
        self.button.frame = CGRect.init(x: 120, y: 200, width: 150, height: 30)
 
            //color button
        self.button.backgroundColor = .orange
                    //
        self.button.setTitle("ok", for: .normal)
        self.button.setTitle("button press", for: .highlighted)
                        //added button
        self.view.addSubview(button)

        //made switch
        self.mySwitch2.frame = CGRect.zero
        self.mySwitch2.center = self.view.center
            //color switch
        self.mySwitch2.tintColor = .red
        self.mySwitch2.thumbTintColor = .yellow
        self.mySwitch2.onTintColor = .blue
                //added switch
        self.view.addSubview(mySwitch2)
        self.mySwitch2.addTarget(self, action: #selector(isOn(target:)), for: .valueChanged)
        
    }
    
    @objc func isOn(target: UISwitch) {
        if target.isOn {
            self.button.isUserInteractionEnabled = false
            print("off")
        } else {
            self.button.isUserInteractionEnabled = true
            print("on")
        }
    }
}

