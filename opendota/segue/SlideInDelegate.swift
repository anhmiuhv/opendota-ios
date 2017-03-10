//
//  SlideInDelegate.swift
//  opendota
//
//  Created by Linh Hoang on 3/9/17.
//  Copyright © 2017 Linh Hoang. All rights reserved.
//

import UIKit


class SlideOutDelegate: NSObject, UIViewControllerTransitioningDelegate {
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SlideInAnimator()
    }

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SlideOutAnimator()
    }
}
