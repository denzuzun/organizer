//
//  ProfileInteractor.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 11.06.2023.
//

import FirebaseAuth
import FirebaseDatabase
import Foundation

class ProfileInteractor: ProfileInteractorProtocol {
    var firebaseReference = Database.database().reference()

    func getOrganizeData(completionHandler: @escaping (Result<OrganizeModel, FirebaseError>) -> Void) {
        guard let currentID = Auth.auth().currentUser?.uid else { return }
        firebaseReference.child("users").child(currentID).child("organizer").getData { error, snapshot in
            if let _ = error {
                completionHandler(.failure(.getDataError))
            } else {
                if snapshot!.exists() {
                    guard let data = snapshot?.value as? [String: Any] else { return }

                    guard let budget = data["budget"] as? String,
                          let concept = data["concept"] as? String,
                          let date = data["date"] as? String,
                          let personNumber = data["personNumber"] as? String,
                          let place = data["mekan"] as? [String: Any],
                          let feed = data["yemek"] as? [String: Any],
                          let drink = data["icecek"] as? [String: Any],
                          let cam = data["kam"] as? [String: Any]
                    else { return }

                    let model = OrganizeModel(budget: budget, concept: concept, date: date, personNumber: personNumber, place: place["tercih"] as! String, feed: feed["tercih"] as! String, drink: drink["tercih"] as! String, cam: cam["tercih"] as! String)
                    completionHandler(.success(model))
                }
            }
        }
    }
}
