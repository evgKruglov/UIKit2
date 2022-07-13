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
    let picker = UIDatePicker()
    let showSecondViewController = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .brown
        
        //create picker
        self.picker.frame = CGRect(x: 20, y: 300, width: 350, height: 40)
        picker.datePickerMode = .dateAndTime
        self.view.addSubview(picker)
        
        picker.addTarget(self, action: #selector(dataPickerChange(paramData:)), for: .valueChanged)
        
        
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
        
        self.showSecondViewController.frame = CGRect(x: 120, y: 700, width: 150, height: 30)
        self.showSecondViewController.backgroundColor = .blue
        self.showSecondViewController.setTitle("next", for: .normal)
        self.view.addSubview(showSecondViewController)
        self.showSecondViewController.addTarget(self, action: #selector(show(tap:)), for: .allTouchEvents)
        
    }
    
    @objc func show(tap: UIButton) {
        if showSecondViewController.isTouchInside == true {
            present(SecondViewController, animated: true, completion: nil)
        }
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
    @objc func dataPickerChange(paramData: UIDatePicker) {
        if paramData.isEqual(self.picker) {
            print("date is \(paramData.date)")
        }
    }
}

//extension ViewController: UIPickerViewDataSource {
//    // how many components view
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//    // how many string
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return 10
//    }
//
//}
//extension ViewController: UIPickerViewDelegate {
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        let result = "raw = \(row)"
//        return result
//    }
//}
