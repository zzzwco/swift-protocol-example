//
//  Router.swift
//  swift-protocol-example
//
//  Created by Bruce on 2021/11/22.
//

import Foundation
import UIKit

enum Router {
  case pageA
  case pageB(params: String)
}

extension Router: Routable {
  
  var detination: UIViewController {
    switch self {
    case .pageA:
      return AController()
    case let .pageB(params):
      return BController(params: params)
    }
  }
  
  var method: RouteMethod {
    switch self {
    case .pageA:
      return .present
    default:
      return .push
    }
  }
}
