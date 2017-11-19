//
//  APIUrls.swift
//  iOSProjectTemplate
//
//  Created by Tuan LE on 11/1/17.
//  Copyright © 2017 Leo LE. All rights reserved.
//

import Foundation

struct APIUrl {
    private static let endPoint = "http://yelp.com"
    private static let apiVersion = "/api/v1"
    //Restaurant
    static let getRestaurant = endPoint + apiVersion + "/restaurants"
    
}
