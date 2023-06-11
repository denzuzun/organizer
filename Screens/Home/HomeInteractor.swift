//
//  HomeInteractor.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 9.06.2023.
//

import FirebaseAuth
import FirebaseDatabase
import Foundation

class HomeInteractor: HomeInteractorProtocol {
    var currentUserID = Auth.auth().currentUser?.uid

    let firebaseRef = Database.database().reference()

    func saveData(model: HomeModel) {
        firebaseRef.child("users").child(currentUserID!).child("organizer").updateChildValues(
            ["concept": model.cooncept,
             "budget": model.budget,
             "personNumber": model.personNumber,
             "date": model.date]
        )
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
        }catch{
            print("didnt logout")
        }
    }
}
