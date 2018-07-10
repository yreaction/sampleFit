//
//  RaceListViewController.swift
//  SampleFit
//
//  Created by Juan Pedro Lozano Baño on 10/7/18.
//  Copyright © 2018 Juan Pedro Lozano Baño. All rights reserved.
//

import Foundation
import RxSwift
import RxDataSources
import UIKit

func getUsers() -> Observable<[SectionModel<String, Race>]> {
	
	return Observable.create { (observer) -> Disposable in
		let races = [Race(user: User(profileImageURL: ""), title: "Some awesome place", time: "13:30", peopleCount: 8, distance: 32)]
		let section = [SectionModel(model:"", items: races)]
		observer.onNext(section)
		observer.onCompleted()
		return Disposables.create {}
	}
	
}
