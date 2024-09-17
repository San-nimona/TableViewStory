//
//  AttractionDetailViewController.swift
//  TableViewStory
//
//  Created by katu on 16/09/2024.
//

import UIKit
import WebKit

class AttractionDetailViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    
    var webSite: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let address = webSite,
                let webURL = URL(string: address) {
                let urlRequest = URLRequest(url: webURL)
                webView.load(urlRequest)
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
