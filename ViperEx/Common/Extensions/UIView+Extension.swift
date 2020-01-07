//
//  UIView.swift
//  ViperEx
//
//  Created by Pedro Alvarez on 05/01/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func presentActivity() {
        let activity = UIActivityIndicatorView()
        activity.backgroundColor = .activityBackground
        activity.color = .secundary
        activity.startAnimating()
        
        addSubview(activity)
        
        activity.translatesAutoresizingMaskIntoConstraints = false
        activity.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 1.0).isActive = true
        activity.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 1.0).isActive = true
        activity.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1.0).isActive = true
        activity.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1.0).isActive = true
    }
    
    func stopActivity() {
        for view in subviews {
            if view is UIActivityIndicatorView {
                view.removeFromSuperview()
            }
        }
    }
}
