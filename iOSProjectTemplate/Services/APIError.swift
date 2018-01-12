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
    case serverError(error: ServerError)
    case noStatusCode
    
    var description: String {
        switch self {
        case .unknown(let code):
            return "Unkown \(code)"
        case .invalidData(_):
            return "Invalid response data"
        case .serverError(let error):
            return error.statusMessage
        default:
            return String(describing: self)
        }
    }
}

class ServerError: NSObject, Mappable {
    
    var statusCode: Int = 0
    var statusMessage: String = ""
    var success: Bool = false
    
    override init() {
        
    }
    
    required convenience init?(map: Map) {
        self.init()
        
    }
    
    func mapping(map: Map) {
        statusCode <- map["status_code"]
        statusMessage <- map["status_message"]
        success <- map["success"]
    }
}


