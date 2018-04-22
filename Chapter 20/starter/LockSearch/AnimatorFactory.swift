//
//  AnimatorFactory.swift
//  Widgets
//
//  Created by Christopher Lee on 22/4/18.
//  Copyright © 2018 Underplot ltd. All rights reserved.
//

import UIKit

class AnimatorFactory {
  static func scaleUp(view: UIView) -> UIViewPropertyAnimator {
    let scale = UIViewPropertyAnimator(duration: 0.33, curve: .easeIn)
    scale.addAnimations {
      view.alpha = 1.0
    }
    scale.addAnimations({
      view.transform = .identity
    }, delayFactor: 0.33)
    scale.addCompletion { _ in
      print("Ready")
    }
    return scale
  }
}
