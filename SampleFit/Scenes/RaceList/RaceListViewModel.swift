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

class RaceListViewModel: NSObject {
	
	func getRaces() -> Observable<[SectionModel<String, Race>]> {
		
		return Observable.create { (observer) -> Disposable in
			let races = [
				Race(user: User(profileImageURL: ""), title: "Some awesome place", time: "1d 12h", userCount: Int(arc4random_uniform(99) + 1)
					, distance: Int(arc4random_uniform(99) + 1), imageUrl: (URL(string: "https://picsum.photos/800/600") ?? nil)!),
				Race(user: User(profileImageURL: ""), title: "Some awesome place", time: "4d 12h", userCount: 0, distance: Int(arc4random_uniform(99) + 1), imageUrl: (URL(string: "https://picsum.photos/500/600") ?? nil)!),
				Race(user: User(profileImageURL: ""), title: "Some awesome place", time: "13:30", userCount: Int(arc4random_uniform(99) + 1), distance:0, imageUrl: (URL(string: "https://picsum.photos/700/600") ?? nil)!),
				Race(user: User(profileImageURL: ""), title: "Some awesome place", time: "13:30", userCount: Int(arc4random_uniform(99) + 1), distance: Int(arc4random_uniform(99) + 1), imageUrl: (URL(string: "https://picsum.photos/900/600") ?? nil)!)
			]
			
			let section = [SectionModel(model:"", items: races)]
			observer.onNext(section)
			observer.onCompleted()
			return Disposables.create {}
		}
		
	}
}
