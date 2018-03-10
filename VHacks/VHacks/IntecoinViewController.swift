//
//  IntecoinViewController.swift
//  VHacks
//
//  Created by Jack Frysinger on 3/9/18.
//  Copyright © 2018 VHacks. All rights reserved.
//

import UIKit
import SwiftyJSON

class IntecoinViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    var balance: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        DataHandler().user {response in
            let json = JSON(response.data)
            if let d = json["data"].dictionary {
                self.balance = d["balance"]?.int
            }
            self.performSelector(onMainThread: #selector(self.updateUI), with: nil, waitUntilDone: true)
        }
        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        if let b = balance {
            label.text = "\(b) ITC"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let s = sender as? UIButton {
            if let d = segue.destination as? IntecoinDetailViewController {
                // d.label.text = s.restorationIdentifier
            }
        }
        segue.perform()
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
