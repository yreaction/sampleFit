//
//  TimeLine.swift
//  SampleFit
//
//  Created by Juan Pedro Lozano Baño on 11/7/18.
//  Copyright © 2018 Juan Pedro Lozano Baño. All rights reserved.
//

import Foundation
import UIKit

enum TimelineType {
	case Train
	case Bus
	case Airplane
	
	func image() -> UIImage {
		switch self {
		case .Airplane:
			return #imageLiteral(resourceName: "ICO_Plane")
		case .Train:
			return #imageLiteral(resourceName: "ICO_Train")
		case .Bus:
			return #imageLiteral(resourceName: "ICO_Bus")
		}
		
	}
	
	func description() -> String {
		switch self {
		case .Airplane:
			return "Airplane"
		case .Train:
			return "Train"
		case .Bus:
			return "Bus"
		}
	}
}

struct Timeline {
	let type: TimelineType
	let date: String
	let details: String
}
