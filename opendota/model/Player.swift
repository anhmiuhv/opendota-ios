//
//  Player.swift
//  opendota
//
//  Created by Linh Hoang on 1/1/17.
//  Copyright © 2017 Linh Hoang. All rights reserved.
//

import Foundation
import Alamofire
import Gloss

class Player {
    let id: Int64
    var win: Int? = 0
    var lose: Int? = 0
    var mmr: String? = ""
    var partyMMR: String? = ""
    var winrate: Double {
        if (win == nil) || (lose == nil) {
            return 0
        }
        return Double(win!) / Double(win! + lose!) * 100
    }
    var profile: Profile?

    init(id: Int64) {
        self.id = id
    }

    func getWinLose(completion: @escaping () -> Void){
        Alamofire.request("https://api.opendota.com/api/players/\(self.id)/wl", method: .get).responseJSON {
            response in

            if let json = response.result.value as? JSON{
                self.win = "win" <~~ json
                self.lose = "lose" <~~ json

            }
            completion()
        }
    }

    func getMMR(completion: @escaping () -> Void){
        Alamofire.request("https://api.opendota.com/api/players/\(self.id)", method: .get).responseJSON {
            response in

            if let json = response.result.value as? JSON{
                self.mmr = "solo_competitive_rank" <~~ json
                self.partyMMR = "competitive_rank" <~~ json
                self.profile = "profile" <~~ json

            }
            completion()
        }
    }

    func getRecentMatches(limit to: Int, offset by: Int = 0, filter: MatchFilter? = nil, completion: @escaping ([MatchInfo]) -> Void){
        let parameter: Parameters = ["limit": to, "offset": by]
        var matches: [MatchInfo] = []
        Alamofire.request("https://api.opendota.com/api/players/\(self.id)/matches", method: .get, parameters: parameter).responseJSON { response in

            if let json = response.result.value as? [Any] {
                for element in json {
                    if let match = element as? [String: AnyObject]{
                        matches.append(MatchInfo(json: match))
                    }
                }
            }
            completion(matches)
        }

    }

    func getAllMatches(completion: @escaping ([MatchInfo]) -> Void) {
        var matches: [MatchInfo] = []
        Alamofire.request("https://api.opendota.com/api/players/\(self.id)/matches", method: .get).responseJSON { response in

            if let json = response.result.value as? [Any] {
                for element in json {
                    if let match = element as? [String: AnyObject]{
                        matches.append(MatchInfo(json: match))
                    }
                }
            }
            completion(matches)
        }

    }


}

struct Profile: Decodable {
    var personName: String?
    var avatarURl: String?
    init?(json: JSON){
        personName = "personaname" <~~ json
        avatarURl = "avatarfull" <~~ json
    }
}
