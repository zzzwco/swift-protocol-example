//
//  DefaultTransition.swift
//  swift-protocol-example
//
//  Created by Bruce on 2021/12/23.
//

import UIKit

extension DefaultTrasition {
  
  enum Style {
    case push
    case present
  }
}

final class DefaultTrasition: Transition {
  
  var animated: Bool = true
  var animator: Animator? = nil
  var style: Style
  
  private weak var fromVc: UIViewController?
  private weak var toVc: UIViewController?
  
  private var navigationController: UINavigationController? {
    if fromVc != nil {
      return fromVc!.navigationController
    }
    return UIApplication.navigationController
  }
  
  private var presentingController: UIViewController? {
    if fromVc != nil {
      return fromVc!
    }
    return UIApplication.topController()
  }
  
  private var presentedController: UIViewController? {
    if toVc != nil {
      return toVc!
    }
    return UIApplication.topController()
  }
  
  init(style: Style, animated: Bool = true) {
    self.style = style
    self.animated = animated
  }
  
  func open(_ viewController: UIViewController, fromVc: UIViewController?, completion: (() -> Void)?) {
    self.fromVc = fromVc
    switch style {
    case .push:
      CATransaction.begin()
      CATransaction.setCompletionBlock(completion)
      navigationController?.pushViewController(viewController, animated: animated)
      CATransaction.commit()
    case .present:
      presentingController?.present(viewController, animated: true, completion: completion)
    }
  }
  
  func close(_ viewController: UIViewController?, completion: (() -> Void)?) {
    switch style {
    case .push:
      CATransaction.begin()
      CATransaction.setCompletionBlock(completion)
      navigationController?.popViewController(animated: animated)
      CATransaction.commit()
    case .present:
      presentedController?.dismiss(animated: animated, completion: completion)
    }
  }
}

extension Transition where Self == DefaultTrasition {
  
  static func automatic(_ style: DefaultTrasition.Style, animated: Bool = true) -> Self {
    Self(style: style, animated: animated)
  }
}
