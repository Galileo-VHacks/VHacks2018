//
//  MapViewController.swift
//  VHacks
//
//  Created by Jack Frysinger on 3/9/18.
//  Copyright © 2018 VHacks. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mapView.delegate = self
        let loc = Location(location: CLLocationCoordinate2D(latitude: 41.902191, longitude: 12.461055), title: "Place", type: "thing")
        loc.address = "this address"
        loc.cost = "this cost"
        mapView.addAnnotation(loc.annotation())
        
        let loc2 = Location(location: CLLocationCoordinate2D(latitude: 41.302191, longitude: 12.061055), title: "the other place", type: "other type")
        loc2.address = "address2"
        loc2.cost = "cost2"
        mapView.addAnnotation(loc2.annotation())
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
            present(vc, animated: true, completion: nil)
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
