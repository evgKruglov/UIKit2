//
//  ViewController.swift
//  UIKit2
//
//  Created by Евгений Кухаренко on 13.07.2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    // добавляем сущность плеера
    var player = AVAudioPlayer()
    // остальные кнопки
    let mySwitch = UISwitch()
    let changeBackground = UIButton()
    let button1 = UIButton()
    let picker = UIDatePicker()
    let playButton = UIButton()
    let pauseButton = UIButton()
    let slider = UISlider()
    let lableSong = UILabel()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationItem.title = "VievController"
        let tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        self.tabBarItem = tabBarItem
        
        
        self.view.backgroundColor = .brown
        //MARK: Пытаемся воспроизвести
        do {
            if let audioPath = Bundle.main.path(forResource: "gayazov", ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                self.slider.maximumValue = Float(player.duration)
            }
        } catch {
            print("error")
        }
        //MARK: make lable
        self.lableSong.frame = CGRect(x: 0, y: 450, width: 370, height: 200)
        self.view.addSubview(lableSong)
        self.lableSong.text = self.player.url?.absoluteString
        
        //MARK: make place slider
        self.slider.frame = CGRect(x: 10, y: 0, width: 370, height: 200)
        self.slider.minimumValue = 0.0
        self.slider.maximumValue = 100.0
        self.view.addSubview(slider)
        self.slider.addTarget(self, action: #selector(changeSlider), for: .valueChanged)
        
        //MARK: make data picker
        self.picker.frame = CGRect(x: 0, y: 300, width: 300, height: 40)
        picker.datePickerMode = .dateAndTime
        self.view.addSubview(picker)
        picker.addTarget(self, action: #selector(dataPickerChange(paramData:)), for: .valueChanged)
        
        //MARK: make button
        self.button1.frame = CGRect(x: 120, y: 250, width: 150, height: 30)
        self.button1.backgroundColor = .orange
        self.button1.setTitle("ok", for: .normal)
        self.button1.setTitle("button press", for: .highlighted)
        self.view.addSubview(button1)
        
        //MARK: make color button
        self.changeBackground.frame = CGRect.init(x: 120, y: 200, width: 150, height: 30)
        self.changeBackground.backgroundColor = .orange
        self.changeBackground.setTitle("Orange", for: .normal)
        self.changeBackground.setTitle("Magenta", for: .highlighted)
        self.view.addSubview(changeBackground)
        changeBackground.addTarget(self, action: #selector(buttonOn(button:)), for: .allTouchEvents)
        
        //MARK: make play button
        self.playButton.frame = CGRect.init(x: 130, y: 130, width: 40, height: 40)
        self.playButton.backgroundColor = .blue
        self.playButton.setTitle("⏯", for: .normal)
        self.playButton.setTitle("⏯", for: .highlighted)
        self.view.addSubview(playButton)
        playButton.addTarget(self, action: #selector(play), for: .touchUpInside)
        
        //MARK: make pause button
        self.pauseButton.frame = CGRect.init(x: 210, y: 130, width: 40, height: 40)
        self.pauseButton.backgroundColor = .blue
        self.pauseButton.setTitle("⏸", for: .normal)
        self.pauseButton.setTitle("⏸", for: .highlighted)
        self.view.addSubview(pauseButton)
        pauseButton.addTarget(self, action: #selector(pause), for: .touchUpInside)
        
        //MARK: make switch
        self.mySwitch.frame = CGRect.zero
        self.mySwitch.center = self.view.center
        self.mySwitch.tintColor = .red
        self.mySwitch.thumbTintColor = .yellow
        self.mySwitch.onTintColor = .blue
        self.view.addSubview(mySwitch)
        self.mySwitch.addTarget(self, action: #selector(isOn(target:)), for: .valueChanged)
    }
    
    @objc func buttonOn(button: UIButton) {
        let arrayColor: [UIColor] = [.magenta, .blue, .brown, .orange, .red, .yellow, .green]
        if button.isTouchInside {
            view.backgroundColor = arrayColor.randomElement()
        }
    }
    
    @objc func isOn(target: UISwitch) {
        if target.isOn {
            self.changeBackground.isUserInteractionEnabled = false
            self.button1.isUserInteractionEnabled = false
            print("button off")
        } else {
            self.changeBackground.isUserInteractionEnabled = true
            self.button1.isUserInteractionEnabled = true
            print("button on")
        }
    }
    
    @objc func dataPickerChange(paramData: UIDatePicker) {
        if paramData.isEqual(self.picker) {
            print("date is \(paramData.date)")
        }
    }
    
    @objc func play() {
        self.player.play()
    }
    
    @objc func pause() {
        self.player.pause()
    }
    
    @objc func changeSlider(sender: UISlider) {
        if sender == slider {
            self.player.currentTime = TimeInterval(sender.value)
        }
    }
}
