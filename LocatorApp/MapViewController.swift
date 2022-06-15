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
    @IBOutlet weak var backbtn: UIButton!
    weak var delegate: MapViewControllerDelegate?
    var locationDetails: CLLocationCoordinate2D?

    override func viewDidLoad() {
        super.viewDidLoad()
        mapSetUp()
        btnSetUp()
    }
    
    @IBAction func backBtn(_ sender: Any) {
        delegate?.someAction()
        navigationController?.popViewController(animated: true)
    }
}

extension MapViewController {
    func mapSetUp() {
        guard let locDetails = locationDetails else {return}
        let region = MKCoordinateRegion(center: locDetails, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        mapView.setRegion(region, animated: true)
        let myAnnotation: MKPointAnnotation = MKPointAnnotation()
        myAnnotation.coordinate = locDetails
        myAnnotation.title = "selected location"
        mapView.addAnnotation(myAnnotation)
    }
    
    func btnSetUp() {
        backbtn.layer.borderWidth = 1
        backbtn.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
    }
}
