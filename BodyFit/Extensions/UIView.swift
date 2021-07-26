//
//  File.swift
//  BodyFit
//
//  Created by Ahmad Shahir Abdul Satar on 7/25/21.
//

import Foundation
import UIKit


    extension UIView {
        func anchor(top: NSLayoutYAxisAnchor?, paddingTop: CGFloat, bottom: NSLayoutYAxisAnchor?, paddingBottom: CGFloat, left: NSLayoutXAxisAnchor?, paddingLeft: CGFloat, right: NSLayoutXAxisAnchor?, paddingRight: CGFloat, width: CGFloat, height: CGFloat) {
            translatesAutoresizingMaskIntoConstraints = false
            if let top = top {
                topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
            }
            if let bottom = bottom {
                bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
            }
            if let right = right {
                rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
            }
            if let left = left {
                leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
            }
            if width != 0 {
                widthAnchor.constraint(equalToConstant: width).isActive = true
            }
            if height != 0 {
                heightAnchor.constraint(equalToConstant: height).isActive = true
            }
        }
        
        func anchor(centerYAnchor: NSLayoutYAxisAnchor?, centerXAnchor: NSLayoutXAxisAnchor?, width: CGFloat?, height: CGFloat?) {
                translatesAutoresizingMaskIntoConstraints = false
            if let centerY = centerYAnchor {
                self.centerYAnchor.constraint(equalTo: centerY).isActive = true
            }
            
            if let centerX = centerXAnchor {
                self.centerXAnchor.constraint(equalTo: centerX).isActive = true
            }
            if let width = width {
                self.widthAnchor.constraint(equalToConstant: width).isActive = true
            }
            if let height = height {
                self.heightAnchor.constraint(equalToConstant: height).isActive = true
            }
                
        }
    
        
       
        

    }


