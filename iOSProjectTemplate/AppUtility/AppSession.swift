//
//  AppSession.swift
//  iOSProjectTemplate
//
//  Created by Leo LE on 11/19/17.
//  Copyright © 2017 Leo LE. All rights reserved.
//

import Foundation

class AppSession {
    
    static let shared = AppSession()
    
    public func setToken(newValue: String?) {
        UserDefaults.standard.set(newValue, forKey: AppUtility.AppKeys.accessToken)
        UserDefaults.standard.synchronize()
    }
    
    public func getAccessToken() -> String? {
        return UserDefaults.standard.value(forKey: AppUtility.AppKeys.accessToken) as? String
    }
    
}
