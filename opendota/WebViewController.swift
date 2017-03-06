//
//  WebViewController.swift
//  opendota
//
//  Created by Linh Hoang on 1/4/17.
//  Copyright © 2017 Linh Hoang. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView?
    let pat = "https:\\/\\/www.opendota.com\\/players\\/\\d*"
    var regex: NSRegularExpression?
    override func loadView() {
        super.loadView()

        self.webView = WKWebView()
        self.webView?.navigationDelegate = self
        self.view = self.webView!

    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let url = NSURL(string:"https://api.opendota.com/login")
        let req = NSURLRequest(url:url as! URL)
        self.webView!.load(req as URLRequest)
        regex = try! NSRegularExpression(pattern: pat, options: [])

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    var playerid: Int64 = 0

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        let url = webView.url!.absoluteString
        if regex?.matches(in: url, range: NSRange(location: 0,
                                                  length: (url.characters.count))).count != 0 {
            let range = url.range(of: "/", options: .backwards)!
            self.playerid = Int64(url.substring(from: range.upperBound))!

            self.performSegue(withIdentifier: "getID", sender: nil)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "getID"{
            if let viewcontroller = segue.destination as? MatchViewController {
                viewcontroller.id = playerid
                UserDefaults.standard.set(self.playerid, forKey: "name_preference")
            }
        }
    }

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */

}
