//
//  ViewController.swift
//  Quotes
//
//  Created by Matteo Manferdini on 27/02/16.
//  Copyright © 2016 Pure Creek. All rights reserved.
//

import UIKit

class AllContactsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBAction func dismissContact(_ segue: UIStoryboardSegue) {}
    @IBAction func addContact(_ segue: UIStoryboardSegue) {}
    @IBAction func editContact(_ segue: UIStoryboardSegue) {}
    @IBAction func deleteContact(_ segue: UIStoryboardSegue) {}
  
    
    fileprivate var dataSource: AllContactDataSource
    
    required init?(coder aDecoder: NSCoder) {
        self.dataSource = AllContactDataSource(contacts: AllData.shared.getContacts())
        super.init(coder: aDecoder)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
        case "DisplayDetailSegue":
            if let contactDetailViewController = segue.destination as? ContactDetailViewController,
                let selectedIndex = tableView.indexPathForSelectedRow?.row {
                let contact = dataSource.contacts[selectedIndex]
                contactDetailViewController.contact = contact
                //contactsViewController.stateController = stateController
            }
        default:
            break
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dataSource = AllContactDataSource(contacts: AllData.shared.getContacts())
        tableView.dataSource = dataSource
        tableView.reloadData()
    }
}









/*
class AllContactsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBAction func dismissContact(_ segue: UIStoryboardSegue) {}
    @IBAction func saveContact(_ segue: UIStoryboardSegue) {}
    var dataSource: AllContactDataSource
    
   required init?(coder aDecoder: NSCoder) {
        //self.dataSource = AllContactDataSource(contacts: AllData.shared.getContacts())
       super.init(coder: aDecoder)
    }
  
}

// MARK: UIViewController
extension AllContactsViewController {
    
   /* override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 113
        tableView.rowHeight = UITableView.automaticDimension
        tableView.dataSource = dataSource
        tableView.reloadData()
    } */
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dataSource = AllContactDataSource(contacts: AllData.shared.getContacts())
        tableView.dataSource = dataSource
        tableView.reloadData()
    }
}

*/
