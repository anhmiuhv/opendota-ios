//
//  Items.swift
//  opendota
//
//  Created by Linh Hoang on 1/26/17.
//  Copyright © 2017 Linh Hoang. All rights reserved.
//

import Foundation

//
//  Heroes.swift
//  opendota
//
//  Created by Linh Hoang on 1/1/17.
//  Copyright © 2017 Linh Hoang. All rights reserved.
//

import Foundation
import Gloss



class Items {
    static let info = Items()
    var list: [Int: Item] = [:]
    private init (){
        let path = Bundle.main.url(forResource: "items", withExtension: "json")
        let path_list = Bundle.main.url(forResource:"list_items", withExtension: "txt")
        do {
            let data = try Data.init(contentsOf: path!)
            let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: AnyObject]
            var l: [Item] = []
            let text = try String(contentsOf: path_list!)
            let list1 = text.components(separatedBy: "\n")
            for i in list1 {
                if let item = json[i] as? [String: AnyObject] {
                    l.append(Item(json: item)!)
                }
            }
            for item in l {
                list[item.id] = item
            }
        } catch {
            list = [:]
        }


    }

    static func getImageIconName(using id: Int) -> String{

        if let t = info.list[id]?.imageName {
            return t
        } else {
            return ""
        }

    }
}

struct Item: Decodable {
    let id: Int
    let name: String
    var imageName: String


    init?(json: JSON){
        guard let id: Int = "id" <~~ json, let name: String = "dname" <~~ json, let imageName: String = "img" <~~ json else {
            return nil
        }
        self.id = id
        self.name = name
        let range = imageName.range(of: "/", options: .backwards)!
        self.imageName = imageName.substring(from: range.upperBound)
        self.imageName = self.imageName.substring(to: self.imageName.index(self.imageName.endIndex, offsetBy: -2))
        
    }
}

