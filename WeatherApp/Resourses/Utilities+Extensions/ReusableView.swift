//
//  ReusableView.swift
//  WeatherApp
//
//  Created by Mac User on 9/3/21.
//

import UIKit

protocol ReusableView : AnyObject {
    static var reuseIdentifier: String { get }
    static var nib: UINib { get }
}

extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: reuseIdentifier, bundle: nil)
    }
}
