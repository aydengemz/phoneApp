//
//  Model.swift
//  phoneApp
//
//  Created by Ayden Xu on 11/23/18.
//  Copyright © 2018 Ayden Xu. All rights reserved.
//

import Foundation

struct Contact {
    let firstName: String
    let lastName: String
    let phone: String
    let favorite: Bool
    var email: String
    var notes: String
    
    init(firstName: String, phone: String) {
        self.firstName = firstName
        self.phone = phone
        self.lastName = ""
        self.favorite = false
        self.email = ""
        self.notes = ""
    }
    
    init(firstName: String, lastName: String, phone: String) {
        self.firstName = firstName
        self.phone = phone
        self.lastName = lastName
        self.favorite = false
         self.email = ""
        self.notes = ""
    }
    init(firstName: String, lastName: String, phone: String, favorite: Bool) {
        self.firstName = firstName
        self.phone = phone
        self.lastName = lastName
        self.favorite = favorite
         self.email = ""
        self.notes = ""
    }
    init(firstName: String, lastName: String, phone: String, favorite: Bool, email: String, notes: String) {
        self.firstName = firstName
        self.phone = phone
        self.lastName = lastName
        self.favorite = favorite
        self.email = email
        self.notes = notes
    }
    
}

struct Call {
    let from: String
    let when: Date
    let missed: Bool
    
    init(from: String, when: Date, missed: Bool){
        self.from = from
        self.when = when
        self.missed = missed
    }
    
}

