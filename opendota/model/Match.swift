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

    func getMatchInfo(completion: @escaping () -> Void){
        Alamofire.request("https://api.opendota.com/api/matches/\(id)", method: .get).responseJSON {
            response in

            if let json = response.result.value as? JSON{
                self.players = "players" <~~ json
                completion()

            }

        }

    }

    
}
