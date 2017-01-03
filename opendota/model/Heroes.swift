//
//  Heroes.swift
//  opendota
//
//  Created by Linh Hoang on 1/1/17.
//  Copyright © 2017 Linh Hoang. All rights reserved.
//

import Foundation
import Gloss

class Heroes {
    static let info = Heroes()
    var list: [Hero] = []
    private init (){
        let path = Bundle.main.url(forResource: "heroes", withExtension: "json")
        do {
            let data = try Data.init(contentsOf: path!)
            let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: AnyObject]

            for i in 1...114 {
                if let hero = json[String(i)] as? [String: AnyObject] {
                    list.append(Hero(json: hero)!)
                }
            }
        } catch {
            list = []
        }


    }

    static func getImageIconName(using id: Int) -> String{
        let id = id > 23 ? id - 2 : id - 1
        return info.list[id].imageName
    }
}

struct Hero: Decodable {
    let id: Int
    let name: String
    let localizedName: String
    let imageName: String


    init?(json: JSON){
        guard let id: Int = "id" <~~ json, let name: String = "name" <~~ json, let localizedName:String = "localized_name" <~~ json, let imageName: String = "img" <~~ json else {
            return nil
        }
        self.id = id
        self.name = name
        self.localizedName = localizedName
        let range = imageName.range(of: "/", options: .backwards)!
        self.imageName = imageName.substring(from: range.upperBound)

    }
}

