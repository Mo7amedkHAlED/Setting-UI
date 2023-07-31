//
//  TableViewCell.swift
//  Layout View
//
//  Created by Mohamed Khaled Gomaa on 31/07/2023.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var images: UIImageView!
    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        label.font = .boldSystemFont(ofSize: 16)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
