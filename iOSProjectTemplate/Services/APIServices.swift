//
//  APIServices.swift
//  iOSProjectTemplate
//
//  Created by Tuan LE on 11/1/17.
//  Copyright © 2017 Leo LE. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import RxSwift

typealias JSONDictionary = [String: Any]

class APIServices {
    func request<T: Mappable>(_ input: APIBasicInput) -> Observable<T> {
        return request(input)
            .map{ json -> T in
                if let t = T(JSON: json) {
                    return t
                }
                throw APIError()
            }
            .observeOn(MainScheduler.instance)
            .shareReplay(1)
    }
    
    fileprivate func request(_ input: APIBasicInput) -> Observable<JSONDictionary> {
        let manager = Alamofire.SessionManager.default
        let _ = manager.rx.request(
            input.urlString,
            method: input.method,
            parameters: input.params,
            encoding: input.encoding,
            headers: input.h)
    }
}
