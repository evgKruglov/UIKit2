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
    let button1 = UIButton()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .magenta
        
        self.button1.frame = CGRect(x: 120, y: 250, width: 150, height: 30)
        self.button1.backgroundColor = .orange
        self.button1.setTitle("ok", for: .normal)
        self.button1.setTitle("button press", for: .highlighted)
        self.view.addSubview(button1)
        
        //made button
        self.button.frame = CGRect.init(x: 120, y: 200, width: 150, height: 30)
        self.button.backgroundColor = .orange
        self.button.setTitle("ok", for: .normal)
        self.button.setTitle("button press", for: .highlighted)
        self.view.addSubview(button)

        self.mySwitch2.frame = CGRect.zero
        self.mySwitch2.center = self.view.center
        self.mySwitch2.tintColor = .red
        self.mySwitch2.thumbTintColor = .yellow
        self.mySwitch2.onTintColor = .blue
        self.view.addSubview(mySwitch2)
        self.mySwitch2.addTarget(self, action: #selector(isOn(target:)), for: .valueChanged)
        
        
    }
    
    @objc func isOn(target: UISwitch) {
        if target.isOn {
            self.button.isUserInteractionEnabled = false
            print("buktton off")
        } else {
            self.button.isUserInteractionEnabled = true
            print("button on")
        }
    }
}

