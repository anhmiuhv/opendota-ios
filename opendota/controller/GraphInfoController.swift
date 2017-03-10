//
//  GraphInfoController.swift
//  opendota
//
//  Created by Linh Hoang on 3/9/17.
//  Copyright © 2017 Linh Hoang. All rights reserved.
//

import UIKit

class GraphInfoController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let exitGestureDetector = UISwipeGestureRecognizer(target: self, action: #selector(exitDetail))
        exitGestureDetector.direction = .down
        self.view.addGestureRecognizer(exitGestureDetector)

        let previous = UISwipeGestureRecognizer(target: self, action: #selector(previousGraph))
        previous.direction = .left
        self.view.addGestureRecognizer(previous)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func previousGraph(){
        self.performSegue(withIdentifier: "previous", sender: nil)
    }
    
    func exitDetail() {

        self.performSegue(withIdentifier: "matches", sender: nil)
    }
  
}
