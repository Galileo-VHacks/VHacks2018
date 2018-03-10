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
    let host = "192.168.200.247"
    
    let paths = ["login": "/api/user/login", "register": "/api/user/register", "logout": "/api/user/logout", "activityList": "/api/activity", "user": "/api/user", "shelterList": "/api/organization/shelter", "pantryList": "/api/organization/pantry", "checkin": "/api/transaction"]
    let methods : [String : HTTPMethod] = ["login": .post, "register": .post, "logout": .get, "activityList": .get, "user": .get, "shelterList": .get, "pantryList": .get, "checkin": .post]
    
    func callBody(api: String, parameters: Parameters, callback: @escaping (DataResponse<Any>) -> Void) {
        var url = URLComponents()
        url.host = host
        url.port = 8000
        url.scheme = "http"
        url.path = paths[api]!
        Alamofire.request(url, method: methods[api]!, parameters: parameters, encoding: JSONEncoding.default).responseJSON(completionHandler: callback)
    }
    
    func callNoBody(api: String, callback: @escaping (DataResponse<Any>) -> Void) {
        var url = URLComponents()
        url.host = host
        url.port = 8000
        url.scheme = "http"
        url.path = paths[api]!
        Alamofire.request(url, method: methods[api]!).responseJSON(completionHandler: callback)
    }
    
    func login(email: String, password: String, callback: @escaping (DataResponse<Any>) -> Void) {
        callBody(api: "login", parameters: ["email":email, "password":password], callback: callback)
    }
    
    func register(email: String, password: String, callback: @escaping (DataResponse<Any>) -> Void) {
        callBody(api: "register", parameters: ["email":email, "password":password], callback: callback)
    }
    
    func logout(callback: @escaping (DataResponse<Any>) -> Void) {
        callNoBody(api: "logout", callback: callback)
    }
    
    func activityList(callback: @escaping (DataResponse<Any>) -> Void) {
        callNoBody(api: "activityList", callback: callback)
    }
    
    func user(callback: @escaping (DataResponse<Any>) -> Void) {
        callNoBody(api: "user", callback: callback)
    }
    
    func shelterList(callback: @escaping (DataResponse<Any>) -> Void) {
        callNoBody(api: "shelterList", callback: callback)
    }
    
    func pantryList(callback: @escaping (DataResponse<Any>) -> Void) {
        callNoBody(api: "pantryList", callback: callback)
    }
    
    func checkin(wallet: String, callback: @escaping (DataResponse<Any>) -> Void) {
        callBody(api: "checkin", parameters: ["to": wallet], callback: callback)
    }
}
