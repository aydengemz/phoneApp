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
    
    var contact: Contact!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameLabel.text = contact.firstName
        lastNameLabel.text = contact.lastName
        phoneLabel.text = contact.phone
  
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
             print(contact)
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
