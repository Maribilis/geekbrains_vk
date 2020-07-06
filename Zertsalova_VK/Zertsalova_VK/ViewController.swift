//
//  ViewController.swift
//  Zertsalova_VK
//
//  Created by Natalia Zertsalova on 06.07.2020.
//  Copyright © 2020 Natalia Zertsalova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var VKLogo: UIImageView!
    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        login.layer.cornerRadius = 8 //закруглила края
    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
// создает уведомление, когда клава показана
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShown(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        // создает уведомление, когда клава скрыта
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let tapGuesture = UITapGestureRecognizer (target: self, action: #selector(hideKeyboard))
        scrollView.addGestureRecognizer(tapGuesture)

    }
    
    @objc func keyboardWillShown(notification: Notification) {
           let info = notification.userInfo! as NSDictionary
           let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size

         let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0)

        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets

}
    @objc func keyboardWillHide(notification: Notification) {
    scrollView.contentInset = UIEdgeInsets.zero
    scrollView.scrollIndicatorInsets = UIEdgeInsets.zero
}
override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
// удаляем себя из списка нотификации о клаве
    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    //функция скрыть клаву
    @objc func hideKeyboard () {
        scrollView.endEditing(true)
    }
    
    @IBAction func enter(_ sender: UIButton) {
        guard let loginText = login.text else {return}
        guard let passText = password.text else {return}

        if loginText == "admin", passText == "12345" {
            print("Вход выполнен")
        }
        else {
            print("Логин или пароль не верный")
        }
    }
    
}
