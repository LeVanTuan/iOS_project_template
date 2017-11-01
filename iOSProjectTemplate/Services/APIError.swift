//
//  APIError.swift
//  iOSProjectTemplate
//
//  Created by Tuan LE on 11/1/17.
//  Copyright © 2017 Leo LE. All rights reserved.
//

import Foundation
import ObjectMapper

enum APIErrorKey: String {
    case internalError = "INTERNAL_ERROR"
    case exceededReqs = "EXCEEDED_REQS"
    case missingParameter = "MISSING_PARAMETER"
    case invalidParameter = "INVALID_PARAMETER"
    case invalidSignature = "INVALID_SIGNATURE"
    case invalidCredentials = "INVALID_CREDENTIALS"
    case invalidOauthCredentials = "INVALID_OAUTH_CREDENTIALS"
    case invalidOauthUser = "INVALID_OAUTH_USER"
    case accountUnconfirmed = "ACCOUNT_UNCONFIRMED"
    case passwordTooLong = "PASSWORD_TOO_LONG"
    case unavailableForLocation = "UNAVAILABLE_FOR_LOCATION"
    case areaTooLarge = "AREA_TOO_LARGE"
    case multipleLocations = "MULTIPLE_LOCATIONS"
    case businessUnavailable = "BUSINESS_UNAVAILABLE"
    
    case invalidData = "INVALID_DATA"
}

class APIError: Error, Mappable {
    
    var id: APIErrorKey = .invalidData
    var text: String = ""
    var field: String = ""
    
    init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        text <- map["text"]
        field <- map["field"]
    }
    
    
}
