//
//  AllCallsViewController.swift
//  phoneApp
//
//  Created by Ayden Xu on 12/8/18.
//  Copyright © 2018 Ayden Xu. All rights reserved.
//

import UIKit

class AllCallsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var dataSource: AllCallsDataSource
    
    required init?(coder aDecoder: NSCoder) {
        self.dataSource = AllCallsDataSource(calls: AllData.shared.getCalls())
        super.init(coder: aDecoder)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dataSource = AllCallsDataSource(calls: AllData.shared.getCalls())
        tableView.dataSource = dataSource
        tableView.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
        case "DisplayCallDetailSegue":
            if let contactDetailViewController = segue.destination as? ContactDetailViewController,
                let selectedIndex = tableView.indexPathForSelectedRow?.row {
                let call = dataSource.calls[selectedIndex]
                let firstName = call.from
                let contacts = AllData.shared.getContacts()
                var found = 0
                if let i = contacts.firstIndex(where: { $0.firstName == firstName }) {
                    print(i)
                    found = i
                   
                }
                //let contact = dataSource.contacts[selectedIndex]
                contactDetailViewController.contact = contacts[found]
                //contactsViewController.stateController = stateController
            }
        default:
            break
        }
    }


}
