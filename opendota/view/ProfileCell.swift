//
//  ProfileCell.swift
//  opendota
//
//  Created by Linh Hoang on 1/3/17.
//  Copyright © 2017 Linh Hoang. All rights reserved.
//

import UIKit
import Alamofire

class ProfileCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var win: UILabel!
    @IBOutlet weak var lost: UILabel!
    @IBOutlet weak var winrate: UILabel!

    @IBOutlet weak var mmr: UILabel!
    @IBOutlet weak var avatar: UIImageView!

    @IBOutlet weak var partymmr: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    func configCellForWinLose(with player: Player){
        win.text = String(player.win!)
        lost.text = String(player.lose!)
        winrate.text =  String(format: "%.2f" ,player.winrate) + "%"

    }

    func configCellForMMR(with player: Player){
        name.text = player.profile!.personName!
        mmr.text = player.mmr
        partymmr.text = player.partyMMR
        Alamofire.download(player.profile!.avatarURl!).responseData { response in
            
            if let data = response.result.value {
                self.avatar.image = UIImage(data: data)
                self.setNeedsDisplay()
            }
        }
    }
}
