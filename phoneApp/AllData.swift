//
//  AllData.swift
//  phoneApp
//
//  Created by Ayden Xu on 11/23/18.
//  Copyright © 2018 Ayden Xu. All rights reserved.
//

import Foundation

public extension FileManager {
    static var documentDirectoryUrl: URL{
        return `default`.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
}
public class AllData {
    
    static let shared = AllData()
    
    var contacts: [Contact] = []
    var favorites: [Contact] = []
    var calls: [Call] = []
    var hasVM: [Call] = []
    //let contactsURL1 = Bundle.main.url(forResource: "Contact", withExtension: "plist")
    let contactsURL = FileManager.documentDirectoryUrl.appendingPathComponent("Contact").appendingPathExtension("plist")
    let callsURL1 = Bundle.main.url(forResource: "Call", withExtension: "plist")
    let callsURL = FileManager.documentDirectoryUrl.appendingPathComponent("Call").appendingPathExtension("plist")


    private init() {
        
        //let contactsURL = Bundle.main.url(forResource: "Contact", withExtension: "plist")
        //var contacts: [Contact]?
        
        if let data = try? Data(contentsOf: contactsURL) {
            print(data)
            let decoder = PropertyListDecoder()
            contacts = try! decoder.decode([Contact].self, from: data)
            print(contacts)
        }
        if let data2 = try? Data(contentsOf: callsURL1!) {
            print(data2)
            let decoder = PropertyListDecoder()
            calls = try! decoder.decode([Call].self, from: data2)
            print(calls)
            //saveToCallPlist(calls: calls)
        }
        
        
    /*    contacts = [
            Contact(firstName: "Albert",lastName: "Einstein", phone: "(919)-333-3333)", favorite: false, email: "ayddfsa@gmail.com", notes: "This person doesn't have a good email."),
            Contact(firstName: "Alber",lastName: "Einn", phone: "(919)-323-3333)", favorite: true),
            Contact(firstName: "Aert",lastName: "Etein", phone: "(919)-321-3333)", favorite: true),
            Contact(firstName: "Bob",lastName: "Smith", phone: "(919)-333-3563)"),
            Contact(firstName: "Lexi",lastName: "old", phone: "(919)-333-3246)", favorite: false, email: "thisisnotaemail@gmail.com", notes: "OK"),
            
        ]
        */
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        //let someDateTime = formatter.date(from: "2016/10/08 22:31")
        
      /*  calls = [
            
            Call(from: "Albert", when: formatter.date(from: "2017/12/13 12:14")!, missed: false),
            Call(from: "Aert", when: formatter.date(from: "2018/11/19 22:22")!, missed: true),
            Call(from: "Bob", when: formatter.date(from: "2004/3/18 1:10")!, missed: false, hasVM: true, recordingName: "Bob"),
            Call(from: "Albertoe", when: formatter.date(from: "2011/8/1 14:56")!, missed: false, hasVM: true, recordingName: "Albertoe"),
        ] */
        
        hasVM = calls.filter({ (aCall) -> Bool in
            aCall.hasVM == true
        })
        
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
    
    func saveToContactPlist(contacts: [Contact]) {
        do{
            let plistEncoder = PropertyListEncoder()
            //plistEncoder.outputFormat = .xml
            let plistData = try plistEncoder.encode(contacts)
            print(plistData)
            
            //let contactsURL = Bundle.main.url(forResource: "Contact", withExtension: "plist")
            try plistData.write(to: contactsURL)
            //print(contacts)
        } catch{ print(error) }
    }
    
    func saveToCallPlist(calls: [Call]) {
        do{
            let plistEncoder = PropertyListEncoder()
            //plistEncoder.outputFormat = .xml
            let plistData = try plistEncoder.encode(calls)
            print(plistData)
            
            //let contactsURL = Bundle.main.url(forResource: "Contact", withExtension: "plist")
            try plistData.write(to: callsURL)
            //print(contacts)
        } catch{ print(error) }
    }
    
    
    
    
    func addContact(newContact: Contact) {
        print("Item Added")
        contacts.append(newContact)
        saveToContactPlist(contacts: contacts)
    }
    
    
    func editContact(newContact: Contact) {
        print("Item edit")
        if let i = contacts.firstIndex(where: { $0.lastName == newContact.lastName }) {
            print(i)
            contacts.remove(at: i)
            contacts.append(newContact)
            saveToContactPlist(contacts: contacts)
        }
        
    }
    func removeContact(deletedContact: Contact) {
        print("Item delete")
        if let i = contacts.firstIndex(where: { $0.lastName == deletedContact.lastName }) {
            print(i)
            contacts.remove(at: i)
            saveToContactPlist(contacts: contacts)
        }
        
    }
    func getCalls() -> [Call] {
        return calls
    }
    func getVoicemails() -> [Call] {
        return hasVM
    }
    
   /* func removeContact(removedContact: Contact) {
        contacts.append(newContact)
    }
 */
}

