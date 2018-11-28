//
//  User.swift
//  TubesKelompokE
//
//  Created by Helga Eka on 18/11/18.
//  Copyright © 2018 kelompokE. All rights reserved.
//

import UIKit

class User: NSObject {

    var fullname: String!
    var email: String!
    var phone: String!
    var username: String!
    var password: String!
    
    init(json: [String: Any]) {
        self.fullname = json["name"] as? String ?? ""
        self.email = json["email"] as? String ?? ""
        self.phone = json["phone"] as? String ?? ""
        self.username = json["username"] as? String ?? ""
        self.password = json["password"] as? String ?? ""
    }
    
    func printData(){
        print(
            " name: ", self.fullname,
            " email : ", self.email,
            " phone : ", self.phone,
            " username : ", self.username,
            " password : ", self.password
        )
    }
    
}
