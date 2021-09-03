//
//  Router.swift
//  WeatherApp
//
//  Created by Mac User on 9/3/21.
//

import UIKit

public protocol Router: AnyObject {
    func present(_ viewController: UIViewController, animated: Bool)
    func present(_ viewController: UIViewController,
                 animated: Bool,
                 onDismissed: (() -> Void)?)
    func dismiss(animated: Bool)
}

extension Router {
    public func present(_ viewController: UIViewController,
                        animated: Bool) {
        present(viewController, animated: animated, onDismissed: nil)
    }
}
