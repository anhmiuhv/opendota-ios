//
//  MatchInfoCell.swift
//  opendota
//
//  Created by Linh Hoang on 1/2/17.
//  Copyright © 2017 Linh Hoang. All rights reserved.
//

import UIKit

class MatchInfoCell: UITableViewCell {

    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var heroIcon: UIImageView!
    @IBOutlet weak var kill: UILabel!
    @IBOutlet weak var death: UILabel!
    @IBOutlet weak var assist: UILabel!

    @IBOutlet weak var mode: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configCell(with info: MatchInfo){
        if (info.win){
            result.text = "Win"
            result.textColor = UIColor.green
        } else {
            result.text = "Loss"
            result.textColor = UIColor.red
        }
        kill.text = String(info.kill!)
        death.text = String(info.death!)
        assist.text = String(info.assist!)
        if let mode = GameMode(rawValue: info.gameMode!){
            switch mode {
            case .allPick:
                self.mode.text = "All Pick"
            case .allRandom:
                self.mode.text = "All Random"
            case .captainMode:
                self.mode.text = "Captain Mode"
            case .randomDraft:
                self.mode.text = "Random Draft"
            case .singleDraft:
                self.mode.text = "Single Draft"
            case .midOnly:
                self.mode.text = "Mid Only"
            case .custom:
                self.mode.text = "Custom Game"
            case .rankedAllPick:
                self.mode.text = "Ranked All Pick"
            case .mid1v1:
                self.mode.text = "Mid 1v1"
            default:
                self.mode.text = "Unknown"
            }
        }
        let name = Heroes.getImageIconName(using: Int(info.playerHeroID!))
        let imageIcon = UIImage(named: name)
        heroIcon.image = imageIcon

    }

}
