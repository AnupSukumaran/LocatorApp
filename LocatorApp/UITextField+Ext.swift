//
//  UITextField+Ext.swift
//  LocatorApp
//
//  Created by Sukumar Anup Sukumaran on 15/06/2022.
//

import UIKit

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
    
    
}
