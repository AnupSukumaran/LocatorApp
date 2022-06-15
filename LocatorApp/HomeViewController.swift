//
//  HomeViewController.swift
//  LocatorApp
//
//  Created by Sukumar Anup Sukumaran on 15/06/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var topTitle: UILabel!
    @IBOutlet weak var latTitle: UILabel!
    @IBOutlet weak var latTextField: UITextField!
    @IBOutlet weak var longTitle: UILabel!
    @IBOutlet weak var longTextField: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UITextField.connectFields(fields: [latTextField, longTextField])
        KeyBrd().regKBNotific(scrollView, 120)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    
    @IBAction func submitBtn(_ sender: UIButton) {
        
        guard let cntr = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MapViewController") as? MapViewController else {return}
        navigationItem.backBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: nil, action: nil)
        cntr.navigationItem.setHidesBackButton(true, animated: true)
        navigationController?.pushViewController(cntr, animated: true)
        
    }
    

}

extension UITextField {

    
    class func connectFields(fields:[UITextField]) -> Void {
        
        guard let last = fields.last else { return }
        
        for i in 0 ..< fields.count - 1 {
            fields[i].returnKeyType = .next
            fields[i].addTarget(fields[i+1], action: #selector(UIResponder.becomeFirstResponder), for: .editingDidEndOnExit)
        }
        
        last.returnKeyType = .done
        last.addTarget(last, action: #selector(UIResponder.resignFirstResponder), for: .editingDidEndOnExit)
    }
    
    //    and after you add this line of code to a viewcontroller:
    //    UITextField.connectFields(fields: [field1, field2, field3])
    
}
