//
//  DetailedMatchInfoCell.swift
//  opendota
//
//  Created by Linh Hoang on 3/7/17.
//  Copyright © 2017 Linh Hoang. All rights reserved.
//

import UIKit

class DetailedMatchInfoCell: UITableViewCell {

    var player: InMatchPlayer?
    let heroes = Heroes.info
    @IBOutlet weak var heroAvatar: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {

    }

    func configCell(with player: InMatchPlayer){
        self.player = player
        let name = Heroes.getImageIconName(using: Int(player.hero_id!))
        let imageIcon = UIImage(named: name)
        heroAvatar.image = imageIcon
    }

}

class OverviewMatchInfoCell: DetailedMatchInfoCell {

    @IBOutlet weak var kill: UILabel!
    @IBOutlet weak var death: UILabel!
    @IBOutlet weak var assist: UILabel!
    @IBOutlet weak var networth: UILabel!
    @IBOutlet weak var accountName: UILabel!
    override func configCell(with player: InMatchPlayer) {
        super.configCell(with: player)
        kill.text = String(describing: player.kills!)
        death.text = String(describing: player.deaths!)
        assist.text = String(describing: player.assists!)
        if (player.personaname != nil) {
            accountName.text = String(describing: player.personaname!)
        } else {
            accountName.text = "Anonymous"
        }
        networth.text = String(describing: Int.toNetWorth(number: player.total_gold!))

    }
}


