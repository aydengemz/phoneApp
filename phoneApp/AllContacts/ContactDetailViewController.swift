//
//  ContactDetailViewController.swift
//  phoneApp
//
//  Created by Ayden Xu on 11/24/18.
//  Copyright © 2018 Ayden Xu. All rights reserved.
//

import UIKit

class ContactDetailViewController: UITableViewController {
 
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var notesLabel: UILabel!
    
    var contact: Contact!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameLabel.text = contact.firstName
        lastNameLabel.text = contact.lastName
        phoneLabel.text = contact.phone
        emailLabel.text = contact.email
        notesLabel.text = contact.notes
    }
    
    
    @IBAction func addFavorite(_ sender: Any) {
        let contact = Contact(firstName: firstNameLabel.text!, lastName: lastNameLabel.text!, phone: phoneLabel.text!, favorite: false, email: emailLabel.text!, notes: notesLabel.text!)
        AllData.shared.addFavorite(newFavorite: contact)
        
        let alert = UIAlertController(title: "Favorited!", message: "You have favorited \(contact.firstName)!", preferredStyle: UIAlertController.Style.alert)
        
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        
        self.present(alert, animated: true, completion: nil)
    }
    
  /*
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        
        switch segue.identifier! {
        case "EditContactSegue":
             print("Prepare in ContactDetail")
             print(contact)
            if let editContactViewController = segue.destination as? EditContactViewController {
                //let contact = dataSource.contacts[selectedIndex]
                editContactViewController.contact = contact
                print(editContactViewController.contact)
                //contactsViewController.stateController = stateController
            }
        default:
            break
        }
    }
 */
 
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
        case "EditContactSegue":
            print("Prepare in ContactDetail")
           
            //if let editContactViewController = segue.destination as? EditContactViewController {
             if let navViewController = segue.destination as? UINavigationController {
           //  print(contact)
                //let contact = dataSource.contacts[selectedIndex]
                let a = navViewController.topViewController as! EditContactViewController
                a.contact = contact
                //contactsViewController.stateController = stateController
            }
            
        default:
            break
        }
    } 
    
}
