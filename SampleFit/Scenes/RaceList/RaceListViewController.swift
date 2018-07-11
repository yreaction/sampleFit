//
//  RaceListViewController.swift
//  SampleFit
//
//  Created by Juan Pedro Lozano Baño on 10/7/18.
//  Copyright © 2018 Juan Pedro Lozano Baño. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class RaceListViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	
	let viewModel = RaceListViewModel()
	let disposeBag = DisposeBag()
	let reuseIdentifier = "\(RaceTableViewCell.self)"
	
	override func viewDidLoad() {
        super.viewDidLoad()
		let navigationBackBtn = UIBarButtonItem(image: #imageLiteral(resourceName: "Back"), style: .plain, target: self, action: nil)
		let navigationSearchBtn = UIBarButtonItem(image: #imageLiteral(resourceName: "Search"), style: .plain, target: self, action: nil)
		self.navigationItem.leftBarButtonItem = navigationBackBtn
		self.navigationItem.rightBarButtonItem = navigationSearchBtn
		
		let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, Race
			>>(configureCell: {
				_, tableView, indexPath, race in
				let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier, for: indexPath) as! RaceTableViewCell
				cell.tag = indexPath.row
				cell.race = race
				return cell
				
			})
		
		viewModel.getRaces().bind(to: tableView.rx.items(dataSource: dataSource)).disposed(by: disposeBag)
    }
}
