//
//  FourViewController.swift
//  UIKit2
//
//  Created by Евгений Кухаренко on 15.07.2022.
//

import UIKit

class FourViewController: UIViewController {
    
    var displaySecondButton = UIButton()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "FourViewController"
        // Do any additional setup after loading the view.
        self.displaySecondButton = UIButton(type: .system)
        self.displaySecondButton.setTitle("Second", for: .normal)
        self.displaySecondButton.sizeToFit()
        self.displaySecondButton.center = self.view.center
        self.displaySecondButton.addTarget(self, action: #selector(performDisplaySecondVC), for: .touchUpInside)
        self.view.addSubview(displaySecondButton)
    }
    
    @objc func performDisplaySecondVC(parameterSender: Any) {
        let secondVC = ThreeViewController()
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
}
