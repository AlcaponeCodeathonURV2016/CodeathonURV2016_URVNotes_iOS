//
//  ApuntTableViewCell.swift
//  URVNotes
//
//  Created by Oscar Blanco Castan on 13/2/16.
//  Copyright © 2016 Alcapone. All rights reserved.
//

import UIKit

class ApuntTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var likesCounterLabel: UILabel!
    @IBOutlet weak var dislikesCounterLabel: UILabel!
    @IBOutlet weak var apuntImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func layoutSubviews() {
        self.apuntImage.layer.cornerRadius = self.apuntImage.bounds.width * 0.5
        self.apuntImage.clipsToBounds = true
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
