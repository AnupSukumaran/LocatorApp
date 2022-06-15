//
//  MapViewController.swift
//  LocatorApp
//
//  Created by Sukumar Anup Sukumaran on 15/06/2022.
//

import UIKit
import MapKit

protocol MapViewControllerDelegate: AnyObject {
    func someAction()
}

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    weak var delegate: MapViewControllerDelegate?
    
    var locationDetails: CLLocationCoordinate2D?

    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        guard let locDetails = locationDetails else {return}
        let region = MKCoordinateRegion(center: locDetails, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))

        mapView.setRegion(region, animated: true)
       
        let myAnnotation: MKPointAnnotation = MKPointAnnotation()
        myAnnotation.coordinate = locDetails
        myAnnotation.title = "selected location"
        mapView.addAnnotation(myAnnotation)
    }
    
    
    @IBAction func backBtn(_ sender: Any) {
        delegate?.someAction()
        navigationController?.popViewController(animated: true)
        
    }
    


}


