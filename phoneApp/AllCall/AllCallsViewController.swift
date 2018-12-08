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


}
