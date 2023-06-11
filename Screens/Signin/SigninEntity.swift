//
//  SigninEntity.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 10.06.2023.
//

import Foundation

struct UserModel{
    var nameSurname: String
    var email: String
    var password: String
    
    
    
    var asJson: [String: Any] {
        return ["nameSurname":nameSurname,"email":email,"password":password]
    }
    
    
}



enum LogInError: Error{
    case timout
    case error
}
