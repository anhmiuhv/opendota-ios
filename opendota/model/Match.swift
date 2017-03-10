//
//  Match.swift
//  opendota
//
//  Created by Linh Hoang on 1/1/17.
//  Copyright © 2017 Linh Hoang. All rights reserved.
//

import Foundation
import Gloss
import Alamofire

class Match {
    let info: MatchInfo? = nil
    let id: Int64
    init (id: Int64){
        self.id = id

    }

    var players: [InMatchPlayer]?
    var radiant_gold_adv: [Int]?
    var radiant_xp_adv:[Int]?
    var duration: Int?
    var radiant_score: Int?
    var dire_score: Int?
    var radiant_win: Bool?

    func getMatchInfo(completion: @escaping () -> Void){
        Alamofire.request("https://api.opendota.com/api/matches/\(id)", method: .get).responseJSON {
            response in

            if let json = response.result.value as? JSON{
                self.players = "players" <~~ json
                self.radiant_gold_adv = "radiant_gold_adv" <~~ json
                self.radiant_xp_adv = "radiant_xp_adv" <~~ json
                self.duration = "duration" <~~ json
                self.radiant_score = "radiant_score" <~~ json
                self.dire_score = "dire_score" <~~ json
                self.radiant_win = "radiant_win" <~~ json

                completion()

            }

        }

    }

    
}
