//
//  LoginViewController.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 10.06.2023.
//

import UIKit

class LoginViewController: UIViewController, LoginViewProtocol {
    @IBOutlet var emailLabel: UILabel!

    @IBOutlet var forgotPasswordView: UIView!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!

    var presenter: LoginPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.tintColor = UIColor(named: "yellow")
        forgotPasswordView.isHidden = true
    }

    @IBAction func didTapLogIn(_ sender: Any) {
        guard let email = emailTextField.text,
              let password = passwordTextField.text else {
            return
        }

        presenter?.checkUserState(email: email, password: password)
    }

    @IBAction func didTapSignIn(_ sender: Any) {
        presenter?.navigateToSignIn()
    }

    @IBAction func didTapForgotPassword(_ sender: Any) {
        UIView.animate(withDuration: 0.3) { [self] in
            forgotPasswordView.isHidden = false
            emailTextField.layer.opacity = 0.3
            passwordTextField.layer.opacity = 0.3
            emailLabel.layer.opacity = 0.3
        }
    }
    
    
    @IBAction func didTapSendButton(_ sender: Any) {
        UIView.animate(withDuration: 0.3) { [self] in
            forgotPasswordView.isHidden = true
            emailTextField.layer.opacity = 1
            passwordTextField.layer.opacity = 1
            emailLabel.layer.opacity = 1
        }
    }
    
}
