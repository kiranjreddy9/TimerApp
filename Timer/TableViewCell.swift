//
//  TableViewCell.swift
//  Timer
//
//  Created by Kiran on 12/2/16.
//  Copyright © 2016 Kiran. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var timerno: UILabel!
    @IBOutlet weak var firsttimer: UILabel!
    @IBOutlet weak var secondtimer: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
