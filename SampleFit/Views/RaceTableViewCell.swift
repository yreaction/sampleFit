//
//  RaceTableViewCell.swift
//  SampleFit
//
//  Created by Juan Pedro Lozano Baño on 10/7/18.
//  Copyright © 2018 Juan Pedro Lozano Baño. All rights reserved.
//

import UIKit
import Kingfisher

class RaceTableViewCell: UITableViewCell {

	@IBOutlet weak var titleLabel: UILabel!
	
	@IBOutlet weak var backgroundImageView: UIImageView!
	var race: Race? {
		willSet {
			titleLabel.text = race?.title ?? "Awesome Place"
			backgroundImageView.kf.setImage(with: newValue?.imageUrl)
			
		}
	}

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
