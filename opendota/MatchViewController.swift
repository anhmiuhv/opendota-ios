//
//  ViewController.swift
//  opendota
//
//  Created by Linh Hoang on 1/1/17.
//  Copyright © 2017 Linh Hoang. All rights reserved.
//

import UIKit

class MatchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var table: UITableView!

    let heroes = Heroes.info
    var matches: [MatchInfo] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        debugPrint(heroes.list.count)
        let player = Player(id: 191771962)
        player.getRecentMatches(limit: 10){
            matches in
            self.matches = matches
            self.table.reloadData()
        }
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //Mark: -- UITableViewDelegate and DataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matches.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table
            .dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MatchInfoCell
        cell.configCell(with: matches[indexPath.row])
        return cell
    }

}

