//
//  TableViewCell.swift
//  Volunteer-Connect
//
//  Created by Akash Singhal on 12/25/15.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var phoneButton: UIButton!
    @IBOutlet weak var urlbutton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
