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
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}

extension OptionViewController: UIViewControllerTransitioningDelegate {
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self.slideoutAnimator
    }
}
