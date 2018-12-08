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
    var calls: [Call]

    private init() {
        contacts = [
            Contact(firstName: "Albert",lastName: "Einstein", phone: "(919)-333-3333)", favorite: false, email: "ayddfsa@gmail.com", notes: "This person doesn't have a good email."),
            Contact(firstName: "Alber",lastName: "Einn", phone: "(919)-323-3333)", favorite: true),
            Contact(firstName: "Aert",lastName: "Etein", phone: "(919)-321-3333)", favorite: true),
            Contact(firstName: "Bob",lastName: "Smith", phone: "(919)-333-3563)"),
            Contact(firstName: "Lexi",lastName: "old", phone: "(919)-333-3246)", favorite: false, email: "thisisnotaemail@gmail.com", notes: "OK"),
            
        ]
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        //let someDateTime = formatter.date(from: "2016/10/08 22:31")
        
        calls = [
            Call(from: "Me", when: formatter.date(from: "2017/12/13 12:14")!, missed: false),
            Call(from: "You", when: formatter.date(from: "2018/11/19 22:22")!, missed: true),
            Call(from: "Bob", when: formatter.date(from: "2004/3/18 1:10")!, missed: false)
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
    func removeContact(deletedContact: Contact) {
        print("Item delete")
        if let i = contacts.firstIndex(where: { $0.lastName == deletedContact.lastName }) {
            print(i)
            contacts.remove(at: i)
        }
        
    }
    func getCalls() -> [Call] {
        return calls
    }
   /* func removeContact(removedContact: Contact) {
        contacts.append(newContact)
    }
 */
}
