//
//  ViewController.swift
//  Quotes
//
//  Created by Matteo Manferdini on 27/02/16.
//  Copyright © 2016 Pure Creek. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let dataSource: ContactDataSource
    
    required init?(coder aDecoder: NSCoder) {
        self.dataSource = ContactDataSource(contacts: AllData.shared.getFavotires())
        super.init(coder: aDecoder)
    }
    @IBAction func unFavorite(_ sender: Any) {
       let selected = tableView.indexPathForSelectedRow?.row
        let contact = dataSource.contacts[selected ?? 0]
        AllData.shared.unFavorite(unFavorite: contact)
        
        let alert = UIAlertController(title: "Unfavorited", message: "You have unfavorited \(contact.firstName)", preferredStyle: UIAlertController.Style.alert)
        
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        
        self.present(alert, animated: true, completion: nil)
    }
    
}

// MARK: UIViewController
extension FavoritesViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 113
        tableView.rowHeight = UITableView.automaticDimension
        tableView.dataSource = dataSource
        tableView.reloadData()
    }
}

