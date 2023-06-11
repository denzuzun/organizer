//
//  TableViewCell.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 9.06.2023.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var dataImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setCellData(data: [String]) {
        dataImage.image = UIImage(named: data[0])
        priceLabel.text = data[1]
        nameLabel.text = data[0]
    }
}
