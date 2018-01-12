//
//  NowPlayingMoviesInput.swift
//  iOSProjectTemplate
//
//  Created by Tuan LE on 1/12/18.
//  Copyright © 2018 Leo LE. All rights reserved.
//

import Foundation

class NowPlayingMoviesInput: ListMoviesInput {
    
    init(page: Int, language: String? = nil, region: String? = nil) {
        let urlString = APIRequest.URLString.nowPlayingMovies
        let method = APIRequest.Method.nowPlayingMovies
        
        super.init(urlString: urlString, method: method, page: page,
                   language: language, region: region)
    }
}
