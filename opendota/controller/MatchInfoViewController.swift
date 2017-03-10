//
//  MatchInfoViewController.swift
//  opendota
//
//  Created by Linh Hoang on 3/7/17.
//  Copyright © 2017 Linh Hoang. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

class MatchInfoViewController: UIViewController {
    var mode: InMatchPlayerView = .overview {
        didSet {
            self.tableDelegate.mode = self.mode
        }
    }
    var match: Match?
    @IBOutlet weak var duration: UILabel!
    @IBOutlet weak var dire: UILabel!
    @IBOutlet weak var radiant: UILabel!
    var tableDelegate = InMatchPlayerTableDelegate()
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var buttons: UIStackView!

    @IBOutlet var v: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.table.delegate = tableDelegate
        self.table.dataSource = tableDelegate
        match?.getMatchInfo {
            self.tableDelegate.receivedMatch = true
            self.tableDelegate.match = self.match
            self.table.reloadData()
            self.duration.text = Int.toTime(number: (self.match?.duration!)!)
            self.dire.text = "\((self.match?.dire_score!)!)"
            self.radiant.text = "\((self.match?.radiant_score!)!)"
            if self.match!.radiant_win! {
                self.radiant.text! += "🏆"
            } else {
                self.dire.text! += "🏆"
            }

        }
        
        let exitGestureDetector = UISwipeGestureRecognizer(target: self, action: #selector(exitDetail))
        exitGestureDetector.direction = .down
        self.v.addGestureRecognizer(exitGestureDetector)

        let graph = UISwipeGestureRecognizer(target: self, action: #selector(showGraph))
        graph.direction = .left
        self.v.addGestureRecognizer(graph)

        buttons.arrangedSubviews[0].layer.borderWidth = 1
        buttons.arrangedSubviews[0].layer.borderColor = UIColor.white.cgColor
    }

    func exitDetail() {
        self.performSegue(withIdentifier: "matches", sender: nil)
    }

    func showGraph() {
        self.performSegue(withIdentifier: "graph", sender: nil)
    }
    
    @IBAction func changeMode(_ sender: UIButton) {
        for b in buttons.arrangedSubviews {
            b.layer.borderWidth = 0
        }

        switch sender.tag {
        case 4:
            self.mode = .overview
        case 3:
            self.mode = .item
        case 2:
            self.mode = .damage
        case 1:
            self.mode = .farm
        default:
            return
        }

        sender.layer.borderWidth = 1
        sender.layer.borderColor = UIColor.white.cgColor
        self.table.reloadData()
    }

    @IBAction func changeSide(unwindSegue: UIStoryboardSegue){
        
    }
    
    var trans = SlideOutDelegate()
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "graph" {
            segue.destination.modalPresentationStyle = .custom
            segue.destination.transitioningDelegate = trans
        }
        
    }


}
