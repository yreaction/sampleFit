//
//  RaceMapViewController.swift
//  SampleFit
//
//  Created by Juan Pedro Lozano Baño on 11/7/18.
//  Copyright © 2018 Juan Pedro Lozano Baño. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources
import RxCocoa

class RaceMapViewController: UIViewController {
	
	var race: Race?
	@IBOutlet weak var mapView: UIView!
	@IBOutlet weak var mapPinImageView: UIImageView!
	@IBOutlet weak var profileLocationLabel: UILabel!
	@IBOutlet weak var profileNameLabel: UILabel!
	@IBOutlet weak var distanceLabel: UILabel!
	@IBOutlet weak var timeLabel: UILabel!
	@IBOutlet weak var caloriesLabel: UILabel!
	
	@IBOutlet weak var tableView: UITableView!
	var viewModel: RaceMapViewModel?
	
	let disposeBag = DisposeBag()
	let reuseIdentifier = "\(TimeLineTableViewCell.self)"

	
	override func viewDidLoad() {
        super.viewDidLoad()
		guard let race = self.race else {fatalError()}
		viewModel = RaceMapViewModel(race: race)
		setUp()
    }
	
	fileprivate func setUp() {
		guard let race = self.race , let user = self.race?.user else { fatalError()}
		self.profileNameLabel.text = user.fullName
		self.profileLocationLabel.text = user.location
		self.distanceLabel.text = "\(race.distance)"
		self.caloriesLabel.text = "\(race.calories)"
		self.timeLabel.text = race.time
		let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, Timeline
			>>(configureCell: {
				_, tableView, indexPath, timeline in
				let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier, for: indexPath) as! TimeLineTableViewCell
				cell.tag = indexPath.row
				cell.timeline = timeline
				return cell
				
			})
		
		viewModel?.getRaceTimeline().bind(to: tableView.rx.items(dataSource: dataSource)).disposed(by: disposeBag)
	}
}
