//
//  MapViewController.swift
//  LocatorApp
//
//  Created by Sukumar Anup Sukumaran on 15/06/2022.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var locationDetails: CLLocationCoordinate2D?

    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        guard let locDetails = locationDetails else {return}
        let region = MKCoordinateRegion(center: locDetails, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))

        mapView.setRegion(region, animated: true)
        
        // Drop a pin at user's Current Location
        let myAnnotation: MKPointAnnotation = MKPointAnnotation()
        myAnnotation.coordinate = locDetails //CLLocationCoordinate2DMake(21.282778, -157.829444);
        myAnnotation.title = "Current location"
        mapView.addAnnotation(myAnnotation)
    }
    
    
    @IBAction func backBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    


}


