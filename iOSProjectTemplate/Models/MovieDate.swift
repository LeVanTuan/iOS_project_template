//
//  MovieDate.swift
//  iOSProjectTemplate
//
//  Created by Tuan LE on 1/12/18.
//  Copyright © 2018 Leo LE. All rights reserved.
//

import Foundation
import ObjectMapper

struct MovieDate: Mappable {
    
    var maximum: String = ""
    var minimum: String = ""
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        self.maximum <- map["maximum"]
        self.minimum <- map["minimum"]
    }
}
