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

class APIBasicInput {
    
    var herders: [String: String] = [:]
    var urlString: String = ""
    var method: Alamofire.HTTPMethod = .get
    var encoding: Alamofire.ParameterEncoding = URLEncoding.default
    var parameters: [String: Any]?
    
    init(urlString: String, method: Alamofire.HTTPMethod, parameters: [String: Any]?,
         isUseApiKey: Bool = true, isUseAccessToken: Bool = false) {
        
        self.urlString = urlString
        self.method = method
        self.parameters = parameters
        self.encoding = method == .get ? URLEncoding.default : JSONEncoding.default
        self.herders = method == .get ? ["Content-Type": "application/x-www-form-urlencoded"] :
            ["Content-Type": "application/json"]
        
        if isUseApiKey {
            let apiKey = AppSession.shared.getApiKey()
            if parameters == nil {
                self.parameters = [:]
            }
            self.parameters?["api_key"] = apiKey
        }
        if isUseAccessToken, let accessToken = AppSession.shared.getAccessToken() {
            self.herders["Authorization"] = "Bearer " + accessToken
        }
    }
}
