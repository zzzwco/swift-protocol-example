//
//  Router.swift
//  swift-protocol-example
//
//  Created by Bruce on 2021/11/22.
//

import Foundation
import UIKit

class Router {
  
  static let shared = Router()
  
  func open(_ target: Routable, transition: Transition,
            fromVc: UIViewController? = nil, completion: (() -> Void)? = nil) {
    transition.open(target.destination, fromVc: fromVc, completion: completion)
  }
  
  func close(_ viewController: UIViewController?, transition: Transition,
             completion: (() -> Void)? = nil) {
    transition.close(viewController, completion: completion)
  }
}
