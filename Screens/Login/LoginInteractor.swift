//
//  LoginInteractor.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 10.06.2023.
//

import Foundation
import FirebaseAuth

class LoginInteractor: LoginInteractorProtocol{
 
    func checkUserState(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password)
    }
}
