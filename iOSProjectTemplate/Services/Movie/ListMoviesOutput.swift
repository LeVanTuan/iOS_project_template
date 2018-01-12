//
//  ListMoviesOutput.swift
//  iOSProjectTemplate
//
//  Created by Tuan LE on 1/12/18.
//  Copyright © 2018 Leo LE. All rights reserved.
//

import Foundation
import ObjectMapper

class ListMoviesOutput: APIBasicOutput {
    
    var page: Int = 0
    var results: [Movie] = []
    var dates: MovieDate?
    var totalPages: Int = 0
    var totalResults: Int = 0
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        page <- map["page"]
        results <- map["results"]
        dates <- map["dates"]
        totalPages <- map["total_pages"]
        totalResults <- map["total_results"]
    }
}
