//
//  ThreeViewController.swift
//  UIKit2
//
//  Created by Евгений Кухаренко on 14.07.2022.
//

import UIKit

class ThreeViewController: UIViewController, UITextFieldDelegate {
    
    var buttonShare = UIButton()
    var textField = UITextField()
    var activityViewController: UIActivityViewController? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        self.createButton()
        self.createTextField()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.perform(#selector(goBack), with: nil, afterDelay: 3.0)
    }
    
    //MARK: - Method
    
    func createTextField() {
        self.textField.frame = CGRect(x: 0, y: 0, width: 280, height: 30)
        self.textField.center = self.view.center
        self.textField.borderStyle = .roundedRect
        self.textField.placeholder = "Enter text to share"
        self.textField.delegate = self
        self.view.addSubview(self.textField)
    }
    
    func createButton() {
        self.buttonShare = UIButton(type: .system)
        self.buttonShare.frame = CGRect(x: 50, y: 350, width: 200, height: 45)
        self.buttonShare.backgroundColor = .red
        self.buttonShare.setTitle("Share", for: .normal)
        self.buttonShare.addTarget(self, action: #selector(handleShare), for: .touchUpInside)
        self.view.addSubview(self.buttonShare)
    }
    
    @objc func handleShare(paramSender: Any) {
        let text = self.textField.text
        if text?.count == 0 {
            let message = "first input text"
            let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "ok", style: .cancel, handler: nil)
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
        }
        self.activityViewController = UIActivityViewController(activityItems: [self.textField.text ?? "nil"], applicationActivities: nil)
        self.present(self.activityViewController!, animated: true, completion: nil)
    }
    // MARK: - UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.textField.resignFirstResponder()
        return true
    }
    
    @objc func goBack() {
//        self.navigationController?.popViewController(animated: true)
        // получаем текущий массив контроллеров
        var currentControllerArray = self.navigationController?.viewControllers
        //удалим последний контроллер
        currentControllerArray?.removeLast()
        //присвоим
        if let newController = currentControllerArray {
            self.navigationController?.viewControllers = newController
        }
    }
}
