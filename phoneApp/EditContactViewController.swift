//
//  AddContactViewController.swift
//  phoneApp
//
//  Created by Ayden Xu on 11/24/18.
//  Copyright © 2018 Ayden Xu. All rights reserved.
//

import UIKit

class EditContactViewController: UIViewController {
    
    @IBOutlet weak var editFirstNameField: UITextField!
    @IBOutlet weak var editLastNameField: UITextField!
    @IBOutlet weak var editPhoneNumberField: UITextField!
    @IBOutlet weak var editEmailField: UITextField!
    @IBOutlet weak var editNotesField: UITextField!
    
    var contact: Contact!
    
   
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Prepare in editContact")
    switch segue.identifier{
    case "EditContactSegue":
        let contact = Contact(firstName: editFirstNameField.text!, lastName: editLastNameField.text!, phone: editPhoneNumberField.text!, favorite: false, email: editEmailField.text!, notes: editNotesField.text!)
       // print(contact)
        AllData.shared.editContact(newContact: contact)
    case "DeleteContactSegue":
        
        let contact = Contact(firstName: editFirstNameField.text!, lastName: editLastNameField.text!, phone: editPhoneNumberField.text!, favorite: false, email: editEmailField.text!, notes: editNotesField.text!)
        
        AllData.shared.removeContact(deletedContact: contact)
    default:
        break
    }
    
}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(contact != nil){
            print(contact)
            editFirstNameField.text = contact.firstName
            editLastNameField.text = contact.lastName
            editPhoneNumberField.text = contact.phone
            editEmailField.text = contact.email
            editNotesField.text = contact.notes
        }
    }
    
    
}
