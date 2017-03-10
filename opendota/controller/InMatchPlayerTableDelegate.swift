//
//  InMatchPlayerTableDelegate.swift
//  opendota
//
//  Created by Linh Hoang on 3/9/17.
//  Copyright © 2017 Linh Hoang. All rights reserved.
//

import UIKit

class InMatchPlayerTableDelegate: NSObject, UITableViewDelegate, UITableViewDataSource {

    var mode: InMatchPlayerView = .overview
    var receivedMatch = false
    var match: Match?

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

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 27
        }
        return 57
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
        return 6
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: DetailedMatchInfoCell
        if indexPath.row == 0 {
            var cell: UITableViewCell
            switch mode {
            case .overview:
                cell = tableView
                    .dequeueReusableCell(withIdentifier: "overview-header", for: indexPath)
            case .farm:
                cell=tableView.dequeueReusableCell(withIdentifier: "farm-header", for: indexPath)

            case .damage:
                cell = tableView.dequeueReusableCell(withIdentifier: "damage-header", for: indexPath)
            default:
                return UITableViewCell()

            }
            return cell

        }

        switch mode {
        case .overview:
            cell = tableView
                .dequeueReusableCell(withIdentifier: "overview", for: indexPath) as! OverviewMatchInfoCell
        case .farm:
            cell=tableView.dequeueReusableCell(withIdentifier: "farm", for: indexPath) as! FarmMatchInfoCell

        case .damage:
            cell = tableView.dequeueReusableCell(withIdentifier: "damage", for: indexPath) as! DamageMatchInfoCell
        default:
            return UITableViewCell()

        }
        if receivedMatch {
            var delta = 0
            if indexPath.section == 1 {
                delta = 5
            }
            cell.configCell(with: (match?.players?[indexPath.row - 1 + delta])!)
        }
        if indexPath.row % 2 == 1 && indexPath.section == 0 {
            cell.backgroundColor = UIColor(red: 142/255, green: 183/255, blue: 139/255, alpha: 0.2)
        } else if indexPath.row % 2 == 1 && indexPath.section == 1 {
            cell.backgroundColor = UIColor(red: 211/255, green: 162/255, blue: 162/255, alpha: 0.2)
        }
        return cell

    }

    

}
