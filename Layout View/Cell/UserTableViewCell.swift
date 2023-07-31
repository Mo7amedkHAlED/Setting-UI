//
//  UserTableViewCell.swift
//  Layout View
//
//  Created by Mohamed Khaled Gomaa on 31/07/2023.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var image2: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
