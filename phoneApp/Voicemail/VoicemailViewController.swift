//
//  VoicemailViewController.swift
//  phoneApp
//
//  Created by Ayden Xu on 12/9/18.
//  Copyright © 2018 Ayden Xu. All rights reserved.
//

import UIKit
import AVFoundation

class VoicemailViewController: UIViewController {
    
    @IBOutlet weak var tableView1: UITableView!
    
    let dataSource: AllVoicemailsDataSource
    
    required init?(coder aDecoder: NSCoder) {
        self.dataSource = AllVoicemailsDataSource(calls: AllData.shared.getVoicemails())
        super.init(coder: aDecoder)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
        case "VoicemailSegue":
            if let voicemailDetailViewController = segue.destination as? VoicemailDetailViewController,
                let selectedIndex = tableView1.indexPathForSelectedRow?.row {
                let call = dataSource.calls[selectedIndex]
                voicemailDetailViewController.call = call
                
                //contactsViewController.stateController = stateController
            }
        default:
            break
        }
    }
    
}
extension VoicemailViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView1.estimatedRowHeight = 113
        tableView1.rowHeight = UITableView.automaticDimension
        tableView1.dataSource = dataSource
        tableView1.reloadData()
    }
 
    
}
