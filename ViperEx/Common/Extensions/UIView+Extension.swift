//
//  UIView.swift
//  ViperEx
//
//  Created by Pedro Alvarez on 05/01/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

extension UIView {
    
    func presentActivity() {
        let activity = UIActivityIndicatorView()
        activity.backgroundColor = .activityBackground
        activity.color = .secundary
        activity.startAnimating()
        
        addSubview(activity)
        
        activity.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func stopActivity() {
        for view in subviews {
            if view is UIActivityIndicatorView {
                view.removeFromSuperview()
            }
        }
    }
}
