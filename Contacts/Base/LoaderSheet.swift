//
//  LoaderSheet.swift
//  Contacts
//
//  Created by Виталий Сероштанов on 02.12.2020.
//

import Foundation
import UIKit
class LoaderSheet: NSObject {
    
    static let sharedInstance = LoaderSheet()
    private let activityIndicator = UIActivityIndicatorView()
    
    private func setupLoader(_ color: UIColor = .gray) {
        removeLoader()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .whiteLarge
        activityIndicator.color = color
    }
    
    func showLoader(_ color: UIColor = .gray) {
        setupLoader(color)
        
        let appDel = UIApplication.shared.delegate as! AppDelegate
        let holdingView = appDel.window!.rootViewController!.view!
        
        DispatchQueue.main.async {
            self.activityIndicator.center = holdingView.center
            self.activityIndicator.startAnimating()
            holdingView.addSubview(self.activityIndicator)
            UIApplication.shared.beginIgnoringInteractionEvents()
        }
    }
    
    func removeLoader(){
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.removeFromSuperview()
            UIApplication.shared.endIgnoringInteractionEvents()
        }
    }
}
