//
//  SlideInAnimator.swift
//  opendota
//
//  Created by Linh Hoang on 3/6/17.
//  Copyright © 2017 Linh Hoang. All rights reserved.
//

import Foundation
import UIKit

class SlideInController:UIPercentDrivenInteractiveTransition {
    var interactionInProgress = false
    private var shouldCompleteTransition = false
    private weak var viewController: UIViewController!

    func wireToViewController(viewController: UIViewController!) {
        self.viewController = viewController
        prepareGestureRecognizerInView(view: viewController.view)
    }

    private func prepareGestureRecognizerInView(view: UIView) {
        let gesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handleGesture))
        gesture.edges = UIRectEdge.left
        view.addGestureRecognizer(gesture)
    }

    func handleGesture(gestureRecognizer: UIScreenEdgePanGestureRecognizer) {
        let controller = viewController as! MatchViewController
        // 1
        let translation = gestureRecognizer.translation(in: gestureRecognizer.view!.superview!)
        var progress = (translation.x / 300)
        progress = CGFloat(fminf(fmaxf(Float(progress), 0.0), 1.0))

        switch gestureRecognizer.state {

        case .began:
            // 2
            interactionInProgress = true
            controller.performSegue(withIdentifier: "option", sender: self)

        case .changed:
            // 3
            shouldCompleteTransition = progress > 0.5
            update(progress)

        case .cancelled:
            // 4
            interactionInProgress = false
            cancel()

        case .ended:
            // 5
            interactionInProgress = false
            
            if !shouldCompleteTransition {
                cancel()
            } else {
                finish()
            }
            
        default:
            print("Unsupported")
        }
    }
}
