//
//  Router.swift
//  swift-protocol-example
//
//  Created by Bruce on 2021/11/18.
//

import Foundation
import UIKit

protocol Routing {
  associatedtype T: RouteDestinatable
  func route(to destination: T)
}

protocol RouteDestinatable {}

enum RouteType: RouteDestinatable {
  case pageA
  case pageB(params: String)
}

class Router: Routing {
  static let shared = Router()
  
  func route(to destination: RouteType) {
    var vc: UIViewController!
    switch destination {
    case .pageA:
      vc = AController()
    case let .pageB(params):
      vc = BController(params: params)
    }
    UIApplication.navigationController?.pushViewController(vc, animated: true)
  }
}
