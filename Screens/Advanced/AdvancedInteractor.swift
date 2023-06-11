//
//  AdvancedInteractor.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 9.06.2023.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth


class AdvancedInteractor: AdvancedInteractorProtocol{
    var currentUserID = Auth.auth().currentUser?.uid
    
    let firebaseRef = Database.database().reference()
    
    
    func savePlace(data: [String]){
        let placeRef = firebaseRef.child("users").child(currentUserID!).child("organizer").child("mekan")
        
        
        placeRef.setValue(["tercih":data[0]])
    }
    func saveFeed(data: [String]){
        let placeRef = firebaseRef.child("users").child(currentUserID!).child("organizer").child("yemek")
        
        placeRef.setValue(["tercih":data[0]])
    }
    func saveDrink(data: [String]){
        let placeRef = firebaseRef.child("users").child(currentUserID!).child("organizer").child("icecek")
        
        placeRef.setValue(["tercih":data[0]])
    }
    func saveCam(data: [String]){
        let placeRef = firebaseRef.child("users").child(currentUserID!).child("organizer").child("kam")
        
        placeRef.setValue(["tercih":data[0]])
    }
}
