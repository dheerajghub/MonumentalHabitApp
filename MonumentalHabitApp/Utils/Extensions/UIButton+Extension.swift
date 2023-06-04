//
//  UIButton+Extension.swift
//  MonumentalHabitApp
//
//  Created by Dheeraj Kumar Sharma on 03/06/23.
//

import UIKit

extension UIButton {
    
    func hapticFeedback() {
        addTarget(self, action: #selector(ism_animateDown), for: [.touchDown, .touchDragEnter])
        addTarget(self, action: #selector(ism_animateUp), for: [.touchDragExit, .touchCancel, .touchUpInside, .touchUpOutside])
    }
    
    @objc private func ism_animateDown(sender: UIButton) {
            ism_animate(sender, transform: CGAffineTransform.identity.scaledBy(x: 0.95, y: 0.95))
    }
    
    @objc private func ism_animateUp(sender: UIButton) {
        ism_animate(sender, transform: .identity)
    }
    
    private func ism_animate(_ button: UIButton, transform: CGAffineTransform) {
        UIView.animate(withDuration: 0.4,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 3,
                       options: [.curveEaseInOut],
                       animations: {
                        button.transform = transform
            }, completion: nil)
    }
    
}
