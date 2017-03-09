//
//  MatchInfoViewController.swift
//  opendota
//
//  Created by Linh Hoang on 3/7/17.
//  Copyright © 2017 Linh Hoang. All rights reserved.
//

import Foundation
import UIKit

class MatchInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var mode: InMatchPlayerView = .overview
    var match: Match?
    var receivedMatch = false

    @IBOutlet weak var table: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        match?.getMatchInfo {
            self.receivedMatch = true
            self.table.reloadData()
        }
        let exitGestureDetector = UISwipeGestureRecognizer(target: self, action: #selector(exitDetail))
        exitGestureDetector.direction = UISwipeGestureRecognizerDirection.down
        self.view.addGestureRecognizer(exitGestureDetector)
        

    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {

            return "Radiant"
        } else {
            return "Dire"
        }
    }

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if section == 1 {
            view.tintColor = UIColor.red
            let header = view as! UITableViewHeaderFooterView
            header.textLabel?.textColor = UIColor.red
        } else {
            view.tintColor = UIColor.green
            let header = view as! UITableViewHeaderFooterView
            header.textLabel?.textColor = UIColor.green
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 35
        }
        return 20
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {


        switch mode {
        case .overview:
            let cell = table
                .dequeueReusableCell(withIdentifier: "overview", for: indexPath) as! OverviewMatchInfoCell
            if receivedMatch {
                var delta = 0
                if indexPath.section == 1 {
                    delta = 4
                }
                cell.configCell(with: (match?.players?[indexPath.row + delta])!)
            }
            if indexPath.row % 2 == 1 && indexPath.section == 0 {
                cell.backgroundColor = UIColor(red: 142/255, green: 183/255, blue: 139/255, alpha: 0.5)
            } else if indexPath.row % 2 == 1 && indexPath.section == 1 {
                cell.backgroundColor = UIColor(red: 211/255, green: 162/255, blue: 162/255, alpha: 0.5)
            }
            return cell
        default:
            return UITableViewCell()

        }
    }

    func exitDetail() {
        self.performSegue(withIdentifier: "matches", sender: nil)
    }


}
