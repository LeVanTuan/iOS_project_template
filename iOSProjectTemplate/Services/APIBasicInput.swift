//
//  APIBasicInput.swift
//  iOSProjectTemplate
//
//  Created by Tuan LE on 11/1/17.
//  Copyright © 2017 Leo LE. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire

class APIBasicInput: Mappable {
    
    var herders: [String: Any]
    var urlString: String
    var method: Alamofire.HTTPMethod
    var encoding: Alamofire.ParameterEncoding
    var parameters: [String: Any]?
    
    init(urlString: String, method: Alamofire.HTTPMethod, parameters: [String: Any]?, isUseAccessToken: Bool = true) {
        self.urlString = urlString
        self.method = method
        self.parameters = parameters
        self.encoding = method == .get ? URLEncoding.default : JSONEncoding.default
        self.herders = method == .get ? ["Content-Type": "application/x-www-form-urlencoded"] :
            ["Content-Type": "application/json"]
        if isUseAccessToken {
            herders["Authorization"] = "Bearer "
        }
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
    }
}
