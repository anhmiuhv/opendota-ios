//
//  SlideInAnimator.swift
//  opendota
//
//  Created by Linh Hoang on 3/6/17.
//  Copyright © 2017 Linh Hoang. All rights reserved.
//

import Foundation
import UIKit

class SlideInAnimator: NSObject, UIViewControllerAnimatedTransitioning{
    var destinationFrame = CGRect.zero

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),

            let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) else {
                return
        }
        let containerView = transitionContext.containerView
        
        let duration = transitionDuration(using: transitionContext)
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        let snapshot = toVC.view.snapshotView(afterScreenUpdates: true)
        snapshot?.frame = CGRect(x: -screenWidth, y: 0.0, width: screenWidth, height: screenHeight)
        containerView.addSubview(toVC.view)
        toVC.view.isHidden=true
        containerView.addSubview(snapshot!)
        UIView.animate(withDuration: duration, animations: {
            snapshot!.frame = snapshot!.frame.offsetBy(dx:screenWidth, dy: 0.0)
            fromVC.view.frame = fromVC.view.frame.offsetBy(dx: screenWidth, dy: 0.0)
        }, completion: {(Finished) -> Void in
            toVC.view.isHidden = false
            snapshot?.removeFromSuperview()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
        )
    }
}
