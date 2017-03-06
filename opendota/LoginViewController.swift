//
//  LoginViewController.swift
//  opendota
//
//  Created by Linh Hoang on 1/4/17.
//  Copyright © 2017 Linh Hoang. All rights reserved.
//

import UIKit
import Alamofire
class LoginViewController: UIViewController {
    var id: Int64?
    override func viewDidLoad(){

        let settings = UserDefaults.standard
        if let id = settings.string(forKey: "name_preference") {
            self.id = Int64(id)

            let player = Player(id: self.id!)
            player.getAllMatches {
                matches in
                if matches.count > 0 {
                    self.performSegue(withIdentifier: "accessfromSetting", sender: nil)
                }
            }
        }


    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "accessfromSetting" {
            if let viewcontroller = segue.destination as? MatchViewController {
                viewcontroller.id = self.id!
            }
        }
    }
}
