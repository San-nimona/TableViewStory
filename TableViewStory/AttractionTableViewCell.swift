//
//  AttractionTableViewCell.swift
//  TableViewStory
//
//  Created by katu on 11/09/2024.
//

import UIKit

class AttractionTableViewCell: UITableViewCell {

    @IBOutlet weak var attractionLabel: UILabel!
    @IBOutlet weak var attractionImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
