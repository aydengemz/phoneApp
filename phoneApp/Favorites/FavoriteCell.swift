//
//  QuoteCell.swift
//  Quotes
//
//  Created by Matteo Manferdini on 27/02/16.
//  Copyright © 2016 Pure Creek. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {
@IBOutlet weak var firstNameLabel: UILabel!
@IBOutlet weak var lastNameLabel: UILabel!
    
    
    var firstName: String? {
        didSet {
            firstNameLabel.text = firstName
        }
    }
    
    var lastName: String? {
        didSet {
            lastNameLabel.text = lastName
        }
    }
}
