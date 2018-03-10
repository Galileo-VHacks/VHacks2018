//
//  Location.swift
//  VHacks
//
//  Created by Jack Frysinger on 3/9/18.
//  Copyright © 2018 VHacks. All rights reserved.
//

import Foundation
import MapKit

class Location {
    let location: CLLocationCoordinate2D
    let title: String
    let type: String
    var address: String?
    var cost: String?
    var checkins: [User]
    var ref: String?
    
    init(location: CLLocationCoordinate2D, title: String, type: String) {
        self.location = location
        self.title = title
        self.type = type
        self.checkins = []
    }
    
    func annotation() -> MKAnnotation {
        let annotation = MyPin()
        annotation.loc = self
        annotation.title = title
        annotation.coordinate = location
        return annotation
    }
    
    func annotationView() -> MKAnnotationView {
        let view = MKPinAnnotationView()
        view.annotation = annotation()
        view.canShowCallout = true
        view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        return view
    }
    
    func view() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "LocationDetailViewController") as! LocationDetailViewController
        controller.location = self
        return controller
    }
}

class MyPin: MKPointAnnotation {
    var loc : Location?
}
