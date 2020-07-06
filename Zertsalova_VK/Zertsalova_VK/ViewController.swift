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

    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
// создает нотификацию, когда клава показана
        print("привет")
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShown(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)

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

    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
}
}
