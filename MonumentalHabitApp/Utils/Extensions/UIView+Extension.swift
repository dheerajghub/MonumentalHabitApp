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
    
    func tapFeedBack(){
        let tap = UILongPressGestureRecognizer(target: self, action: #selector(tapHandler))
        tap.minimumPressDuration = 0
        self.addGestureRecognizer(tap)
    }
    
    @objc func tapHandler(gesture: UITapGestureRecognizer) {
            
        // there are seven possible events which must be handled

        if gesture.state == .began {
            ism_animate(self, transform: CGAffineTransform.identity.scaledBy(x: 0.95, y: 0.95))
            print("BEGAN")
            return
        }
        
        if gesture.state == .changed {
            print("CHANGED")
            ism_animate(self, transform: .identity)
            return
        }
        
        if gesture.state == .cancelled {
            print("CANCELLED")
            ism_animate(self, transform: .identity)
            return
        }
        
        if gesture.state == .ended {
            print("ENDED")
            ism_animate(self, transform: .identity)
            return
        }
        
    }
    
    private func ism_animate(_ view: UIView, transform: CGAffineTransform) {
        UIView.animate(withDuration: 0.4,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 3,
                       options: [.curveEaseInOut],
                       animations: {
                        view.transform = transform
            }, completion: nil)
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
