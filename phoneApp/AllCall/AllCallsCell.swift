//
//  AllCallsCell.swift
//  phoneApp
//
//  Created by Ayden Xu on 12/8/18.
//  Copyright © 2018 Ayden Xu. All rights reserved.
//

import UIKit

class AllCallsCell: UITableViewCell {
    @IBOutlet weak var fromLabel: UILabel!
    
    @IBOutlet weak var whenLabel: UILabel!
    
    var from: String? {
        didSet {
            fromLabel.text = from
        }
    }
    
    var when: String? {
        didSet {
            whenLabel.text = when
        }
    }

}
