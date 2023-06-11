//
//  SigninInteractor.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 10.06.2023.
//

import FirebaseAuth
import FirebaseDatabase
import Foundation

class SigninInteractor: SigninInteractorProtocol {
    let firebaseReference = Database.database().reference()

    func saveUser(model: UserModel) {
        Auth.auth().createUser(withEmail: model.email, password: model.password) { _, error in
            if error != nil {
                print(error!)
            } else {
                guard let currentID = Auth.auth().currentUser?.uid else {
                    print("id is nil")
                    return }
                Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { _ in
                    print("user id \(currentID)")
                    self.firebaseReference.child("users").child(currentID).child("info").setValue(model.asJson) { error, _ in
                        if error != nil {
                            print(error!)
                        }
                    }
                }
            }
        }
    }
}
