//
//  Utility.swift
//  opendota
//
//  Created by Linh Hoang on 3/5/17.
//  Copyright © 2017 Linh Hoang. All rights reserved.
//

import Foundation

extension Int {
    static func toTime(number: Int) -> String {
        var s = String(number)
        var f: String = ""
        let max = s.characters.count
        var count = 0
        for i in s.characters {
            f += String(i)
            if count > 0 && count % 2 == 1 && count != max - 1 {
                f += ":"
            }
            count += 1
        }
        return f
    }
}
