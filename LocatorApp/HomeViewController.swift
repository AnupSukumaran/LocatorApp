//
//  HomeViewController.swift
//  LocatorApp
//
//  Created by Sukumar Anup Sukumaran on 15/06/2022.
//

import UIKit
import CoreLocation
import SASCustomAlert

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var topTitle: UILabel!
    @IBOutlet weak var latTitle: UILabel!
    @IBOutlet weak var latTextField: UITextField!
    @IBOutlet weak var longTitle: UILabel!
    @IBOutlet weak var longTextField: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    
    var viewModel: HomeViewModel! {
        didSet {
            setHandlers()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        latTextField.text = "51.478558225295565"
//        longTextField.text = "-3.1767163043570044"
        UITextField.connectFields(fields: [latTextField, longTextField])
        KeyBrd().regKBNotific(scrollView, 120)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    
    @IBAction func submitBtn(_ sender: UIButton) {
        self.view.endEditing(true)
        callMapView()
    }
    

}

extension HomeViewController {
    func setHandlers() {
        
    }
    
    func callMapView() {
        
        guard let cntr = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MapViewController") as? MapViewController else {return}
        navigationItem.backBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: nil, action: nil)
        cntr.navigationItem.setHidesBackButton(true, animated: true)
        
        let valTups = viewModel.checkLatLongVals(latStr: latTextField.text, longStr: longTextField.text)
        
        guard valTups.state, let latVal = valTups.lat, let longVal = valTups.long
        else {
            UIAlertController.showAlert(title: "Error", message: "Lat and long value errors", buttonTitle: "OK", selfClass: self)
            return
        }
        
        cntr.delegate = self
        cntr.locationDetails = CLLocationCoordinate2D(latitude: latVal, longitude: longVal)
        navigationController?.pushViewController(cntr, animated: true)
    }
    
}



extension HomeViewController: MapViewControllerDelegate {
    
    func someAction() {
        topTitle.text = "Enter new latitude & Longitude below"
    }

    
}
