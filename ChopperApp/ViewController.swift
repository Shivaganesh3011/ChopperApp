//
//  ViewController.swift
//  ChopperApp
//
//  Created by Shiva Ganesh on 18/04/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPasswordToggle()
    }
    func setupPasswordToggle() {
        let toggleButton = UIButton(type: .custom)
        toggleButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        toggleButton.tintColor = .gray
        toggleButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        toggleButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        passwordTextField.rightView = toggleButton
        passwordTextField.rightViewMode = .always
    }
    @objc func togglePasswordVisibility(_ sender: UIButton) {
        passwordTextField.isSecureTextEntry.toggle()
        
        let imageName = passwordTextField.isSecureTextEntry ? "eye.slash.fill" : "eye.fill"
        sender.setImage(UIImage(systemName: imageName), for: .normal)
    }


}
