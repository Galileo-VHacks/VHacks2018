//
//  MapViewController.swift
//  VHacks
//
//  Created by Jack Frysinger on 3/9/18.
//  Copyright © 2018 VHacks. All rights reserved.
//

import UIKit
import MapKit
import SwiftyJSON

class MapViewController: UIViewController, MKMapViewDelegate {
    
    var type = "shelter"

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mapView.delegate = self
//        let loc = Location(location: CLLocationCoordinate2D(latitude: 41.902191, longitude: 12.461055), title: "Place", type: "thing")
//        loc.address = "this address"
//        loc.cost = "this cost"
//        mapView.addAnnotation(loc.annotation())
//        
//        let loc2 = Location(location: CLLocationCoordinate2D(latitude: 41.302191, longitude: 12.061055), title: "the other place", type: "other type")
//        loc2.address = "address2"
//        loc2.cost = "cost2"
//        mapView.addAnnotation(loc2.annotation())
        
        
        if type == "shelter" {
            DataHandler().shelterList {response in
                let json = JSON(response.data).dictionary
                if let d = json?["data"]?.array {
                    for shelter in d {
                        let loc = Location(location: CLLocationCoordinate2D(latitude: shelter["location"].dictionary!["lat"]!.double!, longitude: (shelter["location"].dictionary!["long"]?.double!)!), title: shelter["name"].string!, type: "shelter")
                        loc.ref = shelter["reference_code"].string!
                        self.mapView.addAnnotation(loc.annotation())
                    }
                }
            }
        }
        
        if type == "pantry" {
            DataHandler().pantryList {response in
                let json = JSON(response.data).dictionary
                if let d = json?["data"]?.array {
                    for shelter in d {
                        let loc = Location(location: CLLocationCoordinate2D(latitude: shelter["location"].dictionary!["lat"]!.double!, longitude: (shelter["location"].dictionary!["long"]?.double!)!), title: shelter["name"].string!, type: "pantry")
                        loc.ref = shelter["reference_code"].string!
                        self.mapView.addAnnotation(loc.annotation())
                    }
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let location = CLLocation(latitude: 41.902191, longitude: 12.461055)
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let ann = annotation as! MyPin
        if let l = ann.loc {
            return l.annotationView()
        }
        
        return nil
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let pin = view.annotation as! MyPin
        if let l = pin.loc {
            let vc = l.view()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
