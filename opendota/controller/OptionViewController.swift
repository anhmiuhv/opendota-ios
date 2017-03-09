//
//  OptionViewController.swift
//  opendota
//
//  Created by Linh Hoang on 3/6/17.
//  Copyright © 2017 Linh Hoang. All rights reserved.
//

import UIKit

class OptionViewController: UIViewController {

    let slideoutAnimator = SlideOutAnimator()

    override func viewDidLoad() {
        super.viewDidLoad()        
    }

}

extension OptionViewController: UIViewControllerTransitioningDelegate {
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self.slideoutAnimator
    }
}
