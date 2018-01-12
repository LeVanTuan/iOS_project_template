//
//  StringExtensions.swift
//  iOSProjectTemplate
//
//  Created by Tuan LE on 1/12/18.
//  Copyright © 2018 Leo LE. All rights reserved.
//

import Foundation

extension String {
    var notificationName: Notification.Name {
        return Notification.Name(rawValue: self)
    }
}
