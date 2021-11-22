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
}

public enum RouteMethod {
  case push
  case present
}
