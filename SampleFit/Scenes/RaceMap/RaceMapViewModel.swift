//
//  RaceMapViewModel.swift
//  SampleFit
//
//  Created by Juan Pedro Lozano Baño on 11/7/18.
//  Copyright © 2018 Juan Pedro Lozano Baño. All rights reserved.
//

import Foundation
import RxSwift
import RxDataSources

class RaceMapViewModel: NSObject {
	
	let race: Race
	
	init(race: Race) {
		self.race = race
	}
	
	func getRaceTimeline() -> Observable<[SectionModel<String, Timeline>]> {
		
		return Observable.create { (observer) -> Disposable in
			let timelineItems = [
				Timeline(type: .Bus, date: "18:30", details: "Lorem ipsum dolor sit amet, in veritus prodesset qui. Vis in liber aliquando, an vim prima primis invidunt."),
				Timeline(type: .Train, date: "20:30", details: "Lorem ipsum dolor sit amet, in veritus prodesset qui. Vis in liber aliquando, an vim prima primis invidunt."),
				Timeline(type: .Airplane, date: "20:20", details: "Lorem ipsum dolor sit amet, in veritus prodesset qui. Vis in liber aliquando, an vim prima primis invidunt."),
				Timeline(type: .Train, date: "18:30", details: "Lorem ipsum dolor sit amet, in veritus prodesset qui. Vis in liber aliquando, an vim prima primis invidunt.")
			]
			
			let section = [SectionModel(model:"", items: timelineItems)]
			observer.onNext(section)
			observer.onCompleted()
			return Disposables.create {}
		}
		
	}
}
