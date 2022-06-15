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
        // Set initial location in Honolulu
//        let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
//        mapView.centerToLocation(initialLocation)
        
        let center = CLLocationCoordinate2D(latitude: 21.282778, longitude: -157.829444)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))

        mapView.setRegion(region, animated: true)
        
        // Drop a pin at user's Current Location
        let myAnnotation: MKPointAnnotation = MKPointAnnotation()
        myAnnotation.coordinate = CLLocationCoordinate2DMake(21.282778, -157.829444);
        myAnnotation.title = "Current location"
        mapView.addAnnotation(myAnnotation)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//private extension MKMapView {
//  func centerToLocation(_ location: CLLocation, regionRadius: CLLocationDistance = 1000) {
//    let coordinateRegion = MKCoordinateRegion(
//      center: location.coordinate,
//      latitudinalMeters: regionRadius,
//      longitudinalMeters: regionRadius)
//    setRegion(coordinateRegion, animated: true)
//  }
//}
//
//extension MapViewController: MKMapViewDelegate {
//  func mapView(
//    _ mapView: MKMapView,
//    annotationView view: MKAnnotationView,
//    calloutAccessoryControlTapped control: UIControl
//  ) {
//    guard let artwork = view.annotation as? Artwork else {
//      return
//    }
//
//    let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
//    artwork.mapItem?.openInMaps(launchOptions: launchOptions)
//  }
//}
