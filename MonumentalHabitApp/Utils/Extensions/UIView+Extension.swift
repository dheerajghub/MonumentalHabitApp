//
//  UIView+Extension.swift
//  MonumentalHabitApp
//
//  Created by Dheeraj Kumar Sharma on 27/05/23.
//

import UIKit

extension UIView {
    
    func pin(to superView: UIView){
       translatesAutoresizingMaskIntoConstraints = false
       topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
       leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
       bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
       trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
   }
    
}


extension UIStackView {
    
    func removeFully(view: UIView) {
        removeArrangedSubview(view)
        view.removeFromSuperview()
    }
    
    func removeFullyAllArrangedSubviews() {
        arrangedSubviews.forEach { (view) in
            removeFully(view: view)
        }
    }
    
}
