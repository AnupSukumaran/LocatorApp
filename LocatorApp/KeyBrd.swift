//
//  KeyBrd.swift
//  EV Quiz
//
//  Created by Anup Sukumaran on 03/10/18.
//  Copyright © 2018 WIS. All rights reserved.
//

import UIKit

class KeyBrd {
    
    var increasedInset_Height: CGFloat = 120
    
    func regKBNotific(_ scrollView: UIScrollView, _ inset_Height: CGFloat){
        
        increasedInset_Height = inset_Height
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { (notification) in
        
                self.keyBrdWasShown_V2(notification as NSNotification, scrollView)
            
     
        }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { (notification) in
            
                self.keyBrdWillBeHidden_V2(notification as NSNotification, scrollView)
            
        }
        
    }
    
    
    private func keyBrdWasShown_V2(_ notification: NSNotification,_ scrollView: UIScrollView) {
        
        let info: NSDictionary = notification.userInfo! as NSDictionary
        guard let keyBrd = (info[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.size else {return}
        
        
        scrollView.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyBrd.height + increasedInset_Height, right: 0.0)
        
        
    }
    
    private func keyBrdWillBeHidden_V2(_ notification: NSNotification, _ scrollView: UIScrollView ) {
        
        let info: NSDictionary = notification.userInfo! as NSDictionary
        guard let keyBrd = (info[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.size else {return}
        scrollView.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: -keyBrd.height, right: 0.0)
         scrollView.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        
    }
    
    func deregisterKBNotific(){
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
 
    
}
