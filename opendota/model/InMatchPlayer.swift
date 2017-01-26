//
//  InMatchPlayers.swift
//  opendota
//
//  Created by Linh Hoang on 1/25/17.
//  Copyright © 2017 Linh Hoang. All rights reserved.
//

import Foundation
import Gloss

struct InMatchPlayer: Decodable {
    let id: Int64?
    let player_slot: Int?
    let personaname: String?
    let assists: Int?
    let deaths: Int?
    let denies: Int?
    let gold: Int?
    let gold_per_min: Int?
    let hero_damage: Int?
    let hero_heal: Int?
    let hero_id: Int?
    let kills: Int?
    let last_hits:Int?
    let tower_damage: Int?
    let xp_per_min: Int?
    let obs_placed: Int?
    let sen_placed: Int?
    let total_gold: Int?
    let tower_kills: Int?

    init (json: JSON) {
        self.id = "account_id" <~~ json
        self.player_slot = "player_slot" <~~ json
        self.assists = "assists" <~~ json
        self.deaths = "deaths" <~~ json
        self.denies = "denies" <~~ json
        self.gold = "gold" <~~ json
        self.gold_per_min = "gold_per_min" <~~ json
        self.hero_damage = "hero_damage" <~~ json
        self.hero_heal = "hero_healing" <~~ json
        self.hero_id = "hero_id" <~~ json
        self.kills = "kills" <~~ json
        self.last_hits = "last_hits" <~~ json
        self.tower_damage = "tower_damage" <~~ json
        self.xp_per_min = "xp_per_min" <~~ json
        self.sen_placed = "sen_placed" <~~ json
        self.obs_placed = "obs_placed" <~~ json
        self.tower_kills = "tower_kills" <~~ json
        self.total_gold = "total_gold" <~~ json
        self.personaname = "personaname" <~~ json
    }



}
