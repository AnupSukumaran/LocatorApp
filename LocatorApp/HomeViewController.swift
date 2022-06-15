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
        UITextField.connectFields(fields: [latTextField, longTextField])
        KeyBrd().regKBNotific(scrollView, 120)
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
        viewModel.topTitleLabelHandler = { [weak self] titleVal in
            guard let ctrn = self else {return}
            ctrn.topTitle.text = titleVal
        }
    }
    
    func callMapView() {
        
        guard let cntr = UIStoryboard(name: "Main",
                                      bundle: Bundle.main)
            .instantiateViewController(withIdentifier: "MapViewController") as? MapViewController else {return}
        navigationItem.backBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: nil, action: nil)
        cntr.navigationItem.setHidesBackButton(true, animated: true)
        let valTups = viewModel.checkLatLongVals(latStr: latTextField.text, longStr: longTextField.text)
        guard valTups.state,
                let latVal = valTups.lat,
                let longVal = valTups.long
        else {
            UIAlertController.showAlert(title: "Error",
                                        message: "Lat and long value errors",
                                        buttonTitle: "OK", selfClass: self)
            return
        }
        
        cntr.delegate = viewModel
        cntr.locationDetails = CLLocationCoordinate2D(latitude: latVal, longitude: longVal)
        navigationController?.pushViewController(cntr, animated: true)
    }
    
}

