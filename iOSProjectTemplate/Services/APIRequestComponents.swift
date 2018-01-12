//
//  APIRequestComponents.swift
//  iOSProjectTemplate
//
//  Created by Tuan LE on 11/1/17.
//  Copyright © 2017 Leo LE. All rights reserved.
//

import UIKit
import Alamofire

struct APIEndPoint {
    private enum Host: String {
        case dev = "https://api.themoviedb.org"
        case staging = "https://staging.api.themoviedb.org" //example
        case production = "https://production.api.themoviedb.org" //example
    }
    
    private static let version = "/3"
    
    static let endPoint = Host.dev.rawValue + version
}

struct APIRequest {
    //MARK: Url String
    struct URLString {
        
        //account
        static let nowPlayingMovies = APIEndPoint.endPoint + "/movie/now_playing"
        static let popularMovies = APIEndPoint.endPoint + "/movie/popular"
        static let topRatedMovies = APIEndPoint.endPoint + "/movie/top_rated"
        static let upcomingMovies = APIEndPoint.endPoint + "/movie/upcoming"
        
    }
    
    //MARK: Method
    struct Method {
        //account
        static let nowPlayingMovies = Alamofire.HTTPMethod.get
        static let popularMovies = Alamofire.HTTPMethod.get
        static let topRatedMovies = Alamofire.HTTPMethod.get
        static let upcomingMovies = Alamofire.HTTPMethod.get
    }
}
