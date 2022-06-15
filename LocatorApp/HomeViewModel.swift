//
//  HomeViewModel.swift
//  LocatorApp
//
//  Created by Sukumar Anup Sukumaran on 15/06/2022.
//

import UIKit

class HomeViewModel {
    
    var topTitleLabelHandler: ((String) -> Void)?
    
    
    func checkLatLongVals(latStr: String?, longStr: String?) -> (state: Bool, lat: Double?, long: Double?) {
        guard let latStr = latStr, let longStr = longStr, let latdou = Double(latStr), let longDou = Double(longStr) else {
            return (false, nil, nil)}
        
        return (true, latdou, longDou)
    }

}


extension HomeViewModel: MapViewControllerDelegate {
    
    func someAction() {
        topTitleLabelHandler?("Enter new latitude & Longitude below")
//        topTitle.text = "Enter new latitude & Longitude below"
    }

    
}
