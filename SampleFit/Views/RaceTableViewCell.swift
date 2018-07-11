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
	@IBOutlet weak var distanceLabel: UILabel!
	@IBOutlet weak var usersView: UIView!
	@IBOutlet weak var profileImageView: UIImageView!
	@IBOutlet weak var timeLabel: UILabel!
	@IBOutlet weak var usersCountLabel: UILabel!
	@IBOutlet weak var distanceView: UIView!
	@IBOutlet weak var backgroundImageView: UIImageView!
	
	var race: Race? {
		willSet {
			guard let newValue = newValue else { return }
			titleLabel.text = newValue.title
			backgroundImageView.kf.setImage(with: newValue.imageUrl)
			distanceLabel.text = ("\(newValue.distance) KM")
			usersCountLabel.text = ("\(newValue.userCount)")
			timeLabel.text = newValue.time
			
		}
	}

    override func awakeFromNib() {
        super.awakeFromNib()
		usersView.layer.cornerRadius = 4
		distanceView.layer.cornerRadius = 4
		profileImageView.layer.borderColor = UIColor.white.cgColor
		profileImageView.layer.borderWidth = 2.5
		profileImageView.layer.cornerRadius = profileImageView.frame.size.width/2
    }
}
