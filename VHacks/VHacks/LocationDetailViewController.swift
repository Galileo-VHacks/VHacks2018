//
//  LocationDetailViewController.swift
//  VHacks
//
//  Created by Jack Frysinger on 3/9/18.
//  Copyright © 2018 VHacks. All rights reserved.
//

import UIKit
import SwiftyJSON

class LocationDetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    
    var location: Location?
    var user: User?
    var ref: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let l = location {
            nameLabel.text = l.title
            addressLabel.text = l.address
            costLabel.text = l.cost
            ref = l.ref
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func checkIn(_ sender: Any) {
        // PAY
        //user.pay(l.cost)
        if let r = ref {
            DataHandler().checkin(wallet: r) {response in
                if let bal = JSON(response.data).dictionary?["data"]?.dictionary?["balance"]?.int {
                    let c = UIAlertController(title: "Checkin successful", message: "New balance: \(bal)", preferredStyle: UIAlertControllerStyle.alert)
                    c.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: {(action: UIAlertAction) in c.dismiss(animated: true, completion: nil)}))
                    self.present(c, animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
