//
//  FiveViewController.swift
//  UIKit2
//
//  Created by Евгений Кухаренко on 15.07.2022.
//

import UIKit

class FiveViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // stock
        createLeftBarButtonItem()
        // switch
        createRightBarButtonItem()
    }
    
    //MARK: - Method
    
    func createRightBarButtonItem() {
        // switch
        let switchSimple = UISwitch()
        switchSimple.isOn = true
        switchSimple.addTarget(self,
                               action: #selector(switchIsChange),
                               for: .valueChanged)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: switchSimple)
    }
    
    func createLeftBarButtonItem() {
        // stock
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close,
                                                                 target: self,
                                                                 action: #selector(leftButtonUp))
    }
    
    func createSegmented() {
        // segmented control
        let items = ["up", "down"]
        let segmentController = UISegmentedControl(items: items)
        segmentController.isMomentary = true
        segmentController.addTarget(self,
                                    action: #selector(segmentControllerTapped),
                                    for: .valueChanged)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: segmentController)
    }
    
    @objc func segmentControllerTapped(param: UISegmentedControl) {
        switch param.selectedSegmentIndex {
        case 0:
            print("up")
        case 1:
            print("down")
        default:
            break
        }
    }
    
    fileprivate func extractedFunc(_ param: UISwitch) {
        if param.isOn {
            print("ON")
        } else {
            print("OFF")
        }
    }
    
    @objc func switchIsChange(param: UISwitch) {
        extractedFunc(param)
    }
    
    @objc func leftButtonUp(param: UIBarButtonItem) {
        print("add click")
    }
    
    @objc func rightButton(param: UIBarButtonItem) {
        print("add click")
    }
    
    fileprivate func createImageTitleView() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        //  чтобы не растягивалась по краям
        imageView.contentMode = .scaleAspectFit
        
        let image = UIImage(named: "apple")
        imageView.image = image
        self.navigationItem.titleView = imageView
    }
}
