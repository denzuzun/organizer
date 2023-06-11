//
//  ProfileEntity.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 11.06.2023.
//

import Foundation

struct OrganizeModel {
    var budget: String
    var concept: String
    var date: String
    var personNumber: String
    var place: String
    var feed: String
    var drink: String
    var cam: String?
}


enum FirebaseError: Error{
    case timeOut
    case getDataError
}
