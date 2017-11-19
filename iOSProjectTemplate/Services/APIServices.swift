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
import RxAlamofire

typealias JSONDictionary = [String: Any]

class APIServices {
    func request<T: Mappable>(_ input: APIBasicInput) -> Observable<T> {
        return request(input)
            .map{ json -> T in
                if let t = T(JSON: json) {
                    return t
                }
                throw APIError.invalidData(data: json)
            }
            .observeOn(MainScheduler.instance)
            .shareReplay(1)
    }
    
    fileprivate func request(_ input: APIBasicInput) -> Observable<JSONDictionary> {
        let manager = Alamofire.SessionManager.default
        let urlRequest = manager.rx.request(input.method,
                                            input.urlString,
                                            parameters: input.parameters,
                                            encoding: input.encoding,
                                            headers: input.herders)
            .do(onNext: {(_) in
                DispatchQueue.main.async {
                    UIApplication.shared.isNetworkActivityIndicatorVisible = true
                }
            })
            .flatMapLatest { dataRequest -> Observable<DataResponse<Any>> in
                return dataRequest.rx.responseJSON()
            }
            .do(onNext: { (_) in
                DispatchQueue.main.async {
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                }
            }, onError: { (_) in
                DispatchQueue.main.async {
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                }
            })
            .map { dataResponse -> JSONDictionary in
                return try self.processDataResponse(dataResponse)
            }
            return urlRequest
    }
    
    fileprivate func processDataResponse(_ response: DataResponse<Any>) throws -> JSONDictionary {
        var error: Error
        
        switch response.result {
        case .success(let value):
            if let statusCode = response.response?.statusCode {
                switch statusCode {
                case 200..<300:
                    if let resultData = value as? JSONDictionary {
                        return resultData
                    } else {
                        return JSONDictionary()
                    }
                default:
                    if let map = value as? Mappable, let error = YelpError(JSON: map) {
                        error =
                    } else {
                        
                    }
                }
            } else {
                error = APIError.noStatusCode
            }
        case .failure(let value):
            error = value
        }
        throw error
    }
}
