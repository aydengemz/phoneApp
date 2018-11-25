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

