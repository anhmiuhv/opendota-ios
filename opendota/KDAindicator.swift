//
//  KDAindicator.swift
//  opendota
//
//  Created by Linh Hoang on 1/4/17.
//  Copyright © 2017 Linh Hoang. All rights reserved.
//

import UIKit
import simd
class KDAindicator: UIView {

    var kill = 1.0
    var death = 0.0
    var assist = 0.0

    func normalized(){
        let sum = kill + death + assist
        kill = kill / sum
        death = death / sum
        assist = assist / sum
    }

    override func draw(_ rect: CGRect) {
        let killRect = CGRect(x: 0.0, y: 0.0 ,width: frame.width * CGFloat(kill), height: frame.height)
        let deathRect = CGRect(x: killRect.width, y: 0.5, width: frame.width * CGFloat(death), height: frame.height )
        let assistRect = CGRect(x: killRect.width + deathRect.width, y: 0, width: frame.width * CGFloat(assist), height: frame.height)
        var first = UIBezierPath(rect: killRect)
        UIColor.green.setFill()
        first.fill()
        first = UIBezierPath(rect: deathRect)
        UIColor.red.setFill()
        first.fill()
        first = UIBezierPath(rect: assistRect)
        UIColor.gray.setFill()
        first.fill()

    }


}
