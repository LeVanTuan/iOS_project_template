//
//  TopRatedMoviesInput.swift
//  iOSProjectTemplate
//
//  Created by Tuan LE on 1/12/18.
//  Copyright © 2018 Leo LE. All rights reserved.
//

import Foundation

class TopRatedMoviesInput: ListMoviesInput {
    
    init(page: Int, language: String? = nil, region: String? = nil) {
        let urlString = APIRequest.URLString.topRatedMovies
        let method = APIRequest.Method.topRatedMovies

        super.init(urlString: urlString, method: method, page: page,
                   language: language, region: region)
    }
}
