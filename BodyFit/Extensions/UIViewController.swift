//
//  UIViewController.swift
//  BodyFit
//
//  Created by Ahmad Shahir Abdul Satar on 7/25/21.
//

import Foundation
import UIKit

extension UIViewController {
    
    class func displaySpinner(onView : UIView) -> UIView {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: .large)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        return spinnerView
    }
    
    class func removeSpinner(spinner :UIView) {
        DispatchQueue.main.async {
            spinner.removeFromSuperview()
        }
    }
    
    func throwAlert(message: String) {
        let alertController = UIAlertController(title: NSLocalizedString(message,comment:""), message: NSLocalizedString("",comment:""), preferredStyle: .alert)
        let defaultAction = UIAlertAction(title:     NSLocalizedString("OK", comment: ""), style: .default)
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
