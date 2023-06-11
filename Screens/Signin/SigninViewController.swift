//
//  SigninViewController.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 10.06.2023.
//

import UIKit

class SigninViewController: UIViewController, SigninViewProtocol {
    @IBOutlet var nameSurnameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!

    @IBOutlet weak var title1Label: UILabel!
    
    @IBOutlet weak var title2Label: UILabel!
    
    var presenter: SigninPresenterProtocol?

    @IBOutlet var viewTopConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

        nameSurnameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @IBAction func didTapSignIn(_ sender: Any) {
        guard let nameSurname = nameSurnameTextField.text,
              let email = emailTextField.text,
              let password = passwordTextField.text else {
            return
        }

        presenter?.saveUser(nameSurname: nameSurname, email: email, password: password)
    }

    @objc func keyboardWillHide(sender: NSNotification) {
        DispatchQueue.main.async { [self] in
            title1Label.layer.opacity = 1.0
            title2Label.layer.opacity = 1.0
            viewTopConstraint.constant = 30
        }
    }

    @objc func keyboardWillShow(sender: NSNotification) {
        DispatchQueue.main.async { [self] in
            title1Label.layer.opacity = 0.0
            title2Label.layer.opacity = 0.0
            viewTopConstraint.constant = -100
        }
    }
}

extension SigninViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        textField.returnKeyType = .done
        return true
    }
}
