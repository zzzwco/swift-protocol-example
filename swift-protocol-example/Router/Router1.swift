//
//  Router1.swift
//  swift-protocol-example
//
//  Created by Bruce on 2021/12/24.
//

import UIKit

enum Router1 {
  case pageA
  case pageB(params: String)
}

extension Router1: Routable {
  
  var destination: UIViewController {
    switch self {
    case .pageA:
      return AController()
    case let .pageB(params):
      return BController(params: params)
    }
  }
}
