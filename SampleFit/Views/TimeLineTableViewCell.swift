//
//  TimeLineTableViewCell.swift
//  SampleFit
//
//  Created by Juan Pedro Lozano Baño on 11/7/18.
//  Copyright © 2018 Juan Pedro Lozano Baño. All rights reserved.
//

import UIKit

class TimeLineTableViewCell: UITableViewCell {
	
	@IBOutlet weak var timeLabel: UILabel!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var descriptionLabel: UILabel!
	@IBOutlet weak var iconImageView: UIImageView!
	
	var timeline: Timeline? {
		willSet {
			guard let newValue = newValue else { return }
			timeLabel.text = newValue.date
			titleLabel.text = newValue.type.description()
			descriptionLabel.text = newValue.details
			iconImageView.image = newValue.type.image()
		}
	}

	
	override func awakeFromNib() {
        super.awakeFromNib()
    }

	

}
