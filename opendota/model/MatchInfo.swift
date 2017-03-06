//
//  MatchInfo.swift
//  opendota
//
//  Created by Linh Hoang on 1/2/17.
//  Copyright © 2017 Linh Hoang. All rights reserved.
//

import Foundation
import Gloss

struct MatchInfo: Decodable {
    let id: Int64?
    let playerSlot: Int?
    let radiantWin: Bool?
    let duration: Int?
    let gameMode: Int?
    let lobbyType: Int?
    let playerHeroID: Int64?
    let startTime: Int64?
    let version: Int?
    let kill: Int?
    let death: Int?
    let assist: Int?

    var win: Bool {
        return (radiantWin! && playerSlot! < 100) || !(radiantWin! || playerSlot! < 100)
    }

    init(json: JSON){

        self.id = "match_id" <~~ json
        self.playerSlot = "player_slot" <~~ json
        self.radiantWin = "radiant_win" <~~ json
        self.duration = "duration" <~~ json
        self.gameMode = "game_mode" <~~ json
        self.lobbyType = "lobby_type" <~~ json
        self.playerHeroID = "hero_id" <~~ json
        self.startTime = "start_time" <~~ json
        self.kill = "kills" <~~ json
        self.version = "version" <~~ json
        self.death = "deaths" <~~ json
        self.assist = "assists" <~~ json
    }
    
    
    
}
