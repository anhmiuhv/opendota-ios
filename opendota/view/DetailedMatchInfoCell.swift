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
    @IBOutlet weak var accountName: UILabel!


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
        if (player.personaname != nil) {
            accountName.text = String(describing: player.personaname!)
        } else {
            accountName.text = "Anonymous"
        }
    }

}

class OverviewMatchInfoCell: DetailedMatchInfoCell {

    @IBOutlet weak var kill: UILabel!
    @IBOutlet weak var death: UILabel!
    @IBOutlet weak var assist: UILabel!
    @IBOutlet weak var networth: UILabel!
    override func configCell(with player: InMatchPlayer) {
        super.configCell(with: player)
        kill.text = String(describing: player.kills!)
        death.text = String(describing: player.deaths!)
        assist.text = String(describing: player.assists!)
        networth.text = String(describing: Int.toNetWorth(number: player.total_gold!))

    }
}

class FarmMatchInfoCell: DetailedMatchInfoCell {
    @IBOutlet weak var lasthit: UILabel!
    @IBOutlet weak var gpm: UILabel!
    override func configCell(with player: InMatchPlayer) {
        super.configCell(with: player)
        let deny = player.denies! == 0 ? "-" : String(player.denies!)
        lasthit.text = "\(player.last_hits!)/\(deny)"
        gpm.text = "\(player.gold_per_min!)/\(player.xp_per_min!)"
    }
}

class DamageMatchInfoCell: DetailedMatchInfoCell {
    @IBOutlet weak var damage: UILabel!
    @IBOutlet weak var building: UILabel!
    @IBOutlet weak var heal: UILabel!
    override func configCell(with player: InMatchPlayer){
        super.configCell(with: player)
        damage.text = Int.toDamage(number: player.hero_damage!)
        heal.text = Int.toDamage(number: player.hero_heal!)
        building.text = Int.toDamage(number: player.tower_damage!)

    }
}


