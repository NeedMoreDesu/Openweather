//
//  HelpVC.swift
//  Openweather
//
//  Created by Oleksii Horishnii on 4/27/18.
//  Copyright © 2018 Oleksii Horishnii. All rights reserved.
//

import UIKit
import WebKit

class HelpVC: UIViewController {
    //MARK:- public
    public class func create() -> HelpVC {
        let `self` = Utils.createVC(storyboardId: "Help", vcId: "HelpVC") as HelpVC
        return self
    }

    //MARK:- outlets
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Help"
        
        let htmlPath = Bundle.main.path(forResource: "Help", ofType: "html")
        let url = URL(fileURLWithPath: htmlPath!, isDirectory: false)
        webView.loadFileURL(url, allowingReadAccessTo: url)
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
