//
//  UserCell.swift
//  LoginTest
//
//  Created by Im100ruv on 23/02/18.
//  Copyright © 2018 Im100ruv. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    
    // Outlets
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var firstnameLbl: UILabel!
    @IBOutlet weak var lastnameLbl: UILabel!
    @IBOutlet weak var ageLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
