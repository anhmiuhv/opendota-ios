//
//  Player.swift
//  opendota
//
//  Created by Linh Hoang on 1/1/17.
//  Copyright © 2017 Linh Hoang. All rights reserved.
//

import Foundation
import Alamofire

class Player {
    let id: Int64
    var win: Int = 0
    var lose: Int = 0
    var mmr: String = ""
    var partyMMR: String = ""
    var winrate: Double {
        return Double(win) / Double(win + lose) * 100
    }
    init(id: Int64) {
        self.id = id
    }

    func setUpPlayer(){
        Alamofire.request(<#T##url: URLConvertible##URLConvertible#>)
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
}
