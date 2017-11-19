//
//  APIError.swift
//  iOSProjectTemplate
//
//  Created by Tuan LE on 11/1/17.
//  Copyright © 2017 Leo LE. All rights reserved.
//

import Foundation
import ObjectMapper

enum APIError: Error {
    
    case unknown(statusCode: Int)
    case invalidData(data: JSONDictionary)
    case serverError(error: YelpError)
    case noStatusCode
    
    var description: String {
        switch self {
        case .unknown(let code):
            return "Unkown \(code)"
        case .invalidData(_):
            return "Invalid response data"
        case .serverError(let error):
            return error.text
        default:
            return String(describing: self)
        }
    }
}

enum YelpErrorKey: String {
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
    

}

class YelpError: NSObject, Mappable {
    
    var id: YelpErrorKey = .internalError
    var text: String = ""
    var field: String = ""
    
    override init() {
        
    }
    
    init(id: YelpErrorKey) {
        self.id = id
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        text <- map["text"]
        field <- map["field"]
    }
}


