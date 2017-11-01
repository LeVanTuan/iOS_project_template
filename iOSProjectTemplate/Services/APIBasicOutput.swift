//
//  APIBasicOutput.swift
//  iOSProjectTemplate
//
//  Created by Tuan LE on 11/1/17.
//  Copyright © 2017 Leo LE. All rights reserved.
//

import Foundation
import ObjectMapper

class APIBasicOutput:  Mappable {
    
    var error: APIError?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        error <- map["error"]
    }
}
