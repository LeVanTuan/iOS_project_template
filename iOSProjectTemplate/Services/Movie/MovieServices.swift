//
//  MovieServices.swift
//  iOSProjectTemplate
//
//  Created by Tuan LE on 1/12/18.
//  Copyright © 2018 Leo LE. All rights reserved.
//

import Foundation
import RxSwift

class MovieServices: APIServices {

    func getNowPlayingMovies(input: ListMoviesInput) -> Observable<ListMoviesOutput> {
        return request(input)
    }
}
