//
//  LoginViewController.swift
//  VHacks
//
//  Created by Abha Vedula on 3/9/18.
//  Copyright © 2018 VHacks. All rights reserved.
//

import UIKit
import SwiftyJSON

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var username: String!
    var password: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginUser(_ sender: Any) {
        let h = DataHandler()
        h.login(email: "email@email.com", password: "password", callback: {response in
            let cookie = response.response?.allHeaderFields as! [String: String]
            let url = response.request?.url
            let cookies = HTTPCookie.cookies(withResponseHeaderFields: cookie, for: url!)
            let j = JSON(response.data)
            h.activityList(callback: {response1 in
                let m = JSON(response1.data)
                print(m)
            })
        })
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
