//
//  DataHandler.swift
//  VHacks
//
//  Created by Jack Frysinger on 3/9/18.
//  Copyright © 2018 VHacks. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class DataHandler {
    let session = URLSession.shared
    let host = "localhost:8000"
    
    let paths = ["login": "/api/user/login", "register": "/api/user/register", "logout": "/api/user/logout", "activityList": "/api/activity"]
    let methods : [String : HTTPMethod] = ["login": .post, "register": .post, "logout": .get, "activityList": .get]
    
    func callBody(api: String, parameters: Parameters, callback: @escaping (DataResponse<Any>) -> Void) {
        var url = URLComponents()
        url.host = host
        url.path = paths[api]!
        Alamofire.request(url, method: methods[api]!, parameters: parameters, encoding: JSONEncoding.default).responseJSON(completionHandler: callback)
    }
    
    func login(email: String, password: String, callback: @escaping (DataResponse<Any>) -> Void) {
        callBody(api: "login", parameters: ["email":email, "password":password], callback: callback)
    }
    
    func register(email: String, password: String, callback: @escaping (DataResponse<Any>) -> Void) {
        callBody(api: "register", parameters: ["email":email, "password":password], callback: callback)
    }
}
