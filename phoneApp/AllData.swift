//
//  AllData.swift
//  phoneApp
//
//  Created by Ayden Xu on 11/23/18.
//  Copyright © 2018 Ayden Xu. All rights reserved.
//

import Foundation

public class AllData {
    
    static let shared = AllData()
    
    var contacts: [Contact]
    var favorites: [Contact]

    private init() {
        contacts = [
            Contact(firstName: "Albert",lastName: "Einstein", phone: "(919)-333-3333)"),
            Contact(firstName: "Alber",lastName: "Einn", phone: "(919)-323-3333)", favorite: true),
            Contact(firstName: "Aert",lastName: "Etein", phone: "(919)-321-3333)", favorite: true),
            Contact(firstName: "Bob",lastName: "Smith", phone: "(919)-333-3563)"),
            Contact(firstName: "Lexi",lastName: "old", phone: "(919)-333-3246)"),
            
        ]
        //print(contacts)
        
        favorites = contacts.filter({ (aContact) -> Bool in
            aContact.favorite == true
        })
        
        //print(favorites)
        
    }
    
    func getContacts() -> [Contact] {
        return contacts
    }
    
    func getFavotires() -> [Contact] {
        return favorites
    }
    
    func addContact(newContact: Contact) {
        print("Item Added")
        contacts.append(newContact)
        //print(contacts)
    }
    func editContact(newContact: Contact) {
        print("Item edit")
        if let i = contacts.firstIndex(where: { $0.lastName == newContact.lastName }) {
            print(i)
            contacts.remove(at: i)
            contacts.append(newContact)
        }
        
    }
   /* func removeContact(removedContact: Contact) {
        contacts.append(newContact)
    }
 */
}
