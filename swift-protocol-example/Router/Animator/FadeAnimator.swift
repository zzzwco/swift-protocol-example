//
//  FadeAnimator.swift
//  swift-protocol-example
//
//  Created by Bruce on 2021/12/23.
//

import UIKit

final class FadeAnimator: NSObject, Animator {
  
  var duration: TimeInterval = 0.25
  
  init(duration: TimeInterval = 0.25) {
    self.duration = duration
  }
  
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    duration
  }
  
  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    guard let toView = transitionContext.view(forKey: .to) else { return }
    let containerView = transitionContext.containerView
    containerView.addSubview(toView)
    
    toView.alpha = 0
    UIView.animate(withDuration: duration) {
      toView.alpha = 1.0
    } completion: { _ in
      transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
    }
  }

}
