//
//  FinishEntity.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 11.06.2023.
//

import Foundation


struct EvaluationModel{
    var place: String?
    var feed: String?
    var drink: String?
    var cam: String?
    
    
    var asJSON: [String: Any] {
        return ["mekan":place,"yemek":feed,"icecek":drink,"kam":cam]
    }
    
}
