//
//  QuoteCell.swift
//  Quotes
//
//  Created by Matteo Manferdini on 27/02/16.
//  Copyright © 2016 Pure Creek. All rights reserved.
//

import UIKit

class AllContactCell: UITableViewCell {
    @IBOutlet weak var contactFirstNameLabel: UILabel!
    @IBOutlet weak var contactLastNameLabel: UILabel!
    
    
    var firstName: String? {
        didSet {
            contactFirstNameLabel.text = firstName
        }
    }
    
    var lastName: String? {
        didSet {
            contactLastNameLabel.text = lastName
        }
    }
}
