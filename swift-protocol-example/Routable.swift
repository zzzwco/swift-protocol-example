//
//  Routable.swift
//  swift-protocol-example
//
//  Created by Bruce on 2021/11/22.
//

import Foundation
import UIKit

public protocol Routable {
  
  var detination: UIViewController { get }
  
  var method: RouteMethod { get }
  
  func route()
}

public extension Routable {
  
  func route() {
    switch self.method {
    case .push:
      UIApplication.navigationController?.pushViewController(self.detination, animated: true)
    case .present:
      UIApplication.topViewController?.present(self.detination, animated: true, completion: nil)
    }
  }
}

public enum RouteMethod {
  case push
  case present
}
