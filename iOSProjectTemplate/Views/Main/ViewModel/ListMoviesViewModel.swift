//
//  ListMoviesViewModel.swift
//  iOSProjectTemplate
//
//  Created by Tuan LE on 1/12/18.
//  Copyright © 2018 Leo LE. All rights reserved.
//

import Foundation

protocol ListMoviesViewModel: class {
    
    var movies: [Movie] { get set}
    var currentPage: Int { get set }
    var movieServices: MovieServices { get }
    
    func numberOfSection() -> Int
    func movieAtIndexPath(_ indexPath: IndexPath) -> Movie?
    
    func getListMovies()
}

extension ListMoviesViewModel {
    
    var movieServices: MovieServices {
        return MovieServices()
    }
    
    func numberofSection() -> Int {
        return movies.count
    }
    
    func movieAtIndexPath(_ indexPath: IndexPath) -> Movie? {
        if indexPath.row < movies.count {
            return movies[indexPath.row]
        }
        return nil
    }
    
    func getListMovies() {
        
    }
}
