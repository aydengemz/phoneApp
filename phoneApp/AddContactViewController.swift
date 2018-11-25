//
//  AddContactViewController.swift
//  phoneApp
//
//  Created by Ayden Xu on 11/24/18.
//  Copyright © 2018 Ayden Xu. All rights reserved.
//

import UIKit

class AddContactViewController: UIViewController {
    
    @IBOutlet weak var firstNameField: UITextField!
    
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var phoneNumberField: UITextField!
    
    var contact: Contact!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Prepare in addContact")
        guard segue.identifier == "AddContactSegue" else {
            return
        }
        let contact = Contact(firstName: firstNameField.text!, lastName: lastNameField.text!, phone: phoneNumberField.text!)
        
        AllData.shared.addContact(newContact: contact)
        
    }
   

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(contact != nil){
           // print(contact)
        firstNameField.text = contact.firstName
        lastNameField.text = contact.lastName
        phoneNumberField.text = contact.phone
        }
    }
            
   
}
