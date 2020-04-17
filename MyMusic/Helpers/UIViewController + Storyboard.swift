//
//  UIViewController + Storyboard.swift
//  MyMusic
//
//  Created by Роман Лабунский on 29/02/2020.
//  Copyright © 2020 Роман Лабунский. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    class func loadFromStoryboard<T : UIViewController>() -> T {
        let name = String(describing: T.self)
        let storyboard = UIStoryboard(name: name, bundle: nil)
        if let viewContoller = storyboard.instantiateInitialViewController() as? T {
            return viewContoller
        } else {
            fatalError("Error: No innitial view controller in \(name) storyboard")
        }
    }
}
