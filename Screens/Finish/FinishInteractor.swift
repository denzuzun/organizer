//
//  FinishInteractor.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 11.06.2023.
//

import FirebaseAuth
import FirebaseDatabase
import Foundation

class FinishInteractor: FinishInteractorProtocol {
    var firebaseReference = Database.database().reference()
    
    func getData(completionHandler: @escaping (Result<EvaluationModel, FirebaseError>) -> Void) {
        guard let currentID = Auth.auth().currentUser?.uid else { return }
        firebaseReference.child("users").child(currentID).child("organizer").getData { error, snapshot in
            if let _ = error {
                completionHandler(.failure(.getDataError))
            } else {
                if snapshot!.exists() {
                    guard let data = snapshot?.value as? [String: Any] else { return }

                    guard let place = data["mekan"] as? [String: Any],
                          let feed = data["yemek"] as? [String: Any],
                          let drink = data["icecek"] as? [String: Any],
                          let cam = data["kam"] as? [String: Any]
                    else { return }

                    let model = EvaluationModel(place: place["tercih"] as! String, feed: feed["tercih"] as! String, drink: drink["tercih"] as! String, cam: cam["tercih"] as! String)
                    completionHandler(.success(model))
                }
            }
        }
    }
    
    func saveEvaluationData(model: EvaluationModel) {
        guard let currentID = Auth.auth().currentUser?.uid else { return }
        //firebaseReference.child("evaluation").child(currentID).setValue(model.asJSON)
        firebaseReference.child("evaluation").child(currentID).updateChildValues(model.asJSON)
    }
}
