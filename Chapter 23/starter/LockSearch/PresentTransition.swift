//
//  PresentTransition.swift
//  Widgets
//
//  Created by Christopher Lee on 24/4/18.
//  Copyright © 2018 Underplot ltd. All rights reserved.
//

import UIKit

class PresentTransition: NSObject, UIViewControllerAnimatedTransitioning {
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return 0.75
  }
  
  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    transitionAnimator(using: transitionContext).startAnimation()
  }
  
  func transitionAnimator(using transitionContext: UIViewControllerContextTransitioning) -> UIViewImplicitlyAnimating {
    let duration = transitionDuration(using: transitionContext)
    let container = transitionContext.containerView
    let to = transitionContext.view(forKey: .to)!
    
    container.addSubview(to)
    to.transform = CGAffineTransform(scaleX: 1.33, y: 1.33).concatenating(CGAffineTransform(translationX: 0.0, y: 200))
    to.alpha = 0
    
    let animator = UIViewPropertyAnimator(duration: duration, curve: .easeOut)
    animator.addAnimations ({
      to.transform = CGAffineTransform(translationX: 0.0, y: 100)
    }, delayFactor: 0.15)
    
    animator.addAnimations({
      to.alpha = 1.0
    }, delayFactor: 0.5)
    
    animator.addCompletion { _ in
      transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
    }
    
    return animator
  }
}
