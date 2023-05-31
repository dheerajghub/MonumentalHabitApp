//
//  others.swift
//  MonumentalHabitApp
//
//  Created by Dheeraj Kumar Sharma on 30/05/23.
//

import UIKit

struct windowConstant {
    
    private static let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
    
    static var getTopPadding: CGFloat {
        return window?.safeAreaInsets.top ?? 0
    }
    
    static var getBottomPadding: CGFloat {
        return window?.safeAreaInsets.bottom ?? 0
    }
    
}
