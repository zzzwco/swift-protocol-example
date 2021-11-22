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
  
  func route(to target: Routable) {
    switch target.method {
    case .push:
      UIApplication.navigationController?.pushViewController(target.detination, animated: true)
    case .present:
      UIApplication.topViewController?.present(target.detination, animated: true, completion: nil)
    }
  }
}

enum TestRouter {
  case pageA
  case pageB(params: String)
}

extension TestRouter: Routable {
  
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
