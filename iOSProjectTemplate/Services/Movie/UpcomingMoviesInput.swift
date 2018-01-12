//
//  UpcomingMoviesInput.swift
//  iOSProjectTemplate
//
//  Created by Tuan LE on 1/12/18.
//  Copyright © 2018 Leo LE. All rights reserved.
//

import Foundation

class UpcomingMoviesInput: ListMoviesInput {
    
    init(page: Int, language: String? = nil, region: String? = nil) {
        let urlString = APIRequest.URLString.upcomingMovies
        let method = APIRequest.Method.upcomingMovies
        
        super.init(urlString: urlString, method: method,page: page,
                   language: language, region: region)
    }
}
