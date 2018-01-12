//
//  ListMoviesInput.swift
//  iOSProjectTemplate
//
//  Created by Tuan LE on 1/12/18.
//  Copyright © 2018 Leo LE. All rights reserved.
//

import Foundation
import Alamofire

class ListMoviesInput: APIBasicInput {
    
    init(urlString: String, method: Alamofire.HTTPMethod, page: Int,
         language: String? = nil, region: String? = nil) {
        
        var params: [String: Any] = [
            "page": page
        ]
        params["language"] = language
        params["region"] = region
        
        super.init(urlString: urlString, method: method, parameters: params)
    }
    
}
