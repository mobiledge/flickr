//
//  Utilities.swift
//  FlickrClient
//
//  Created by Rabin Joshi on 2024-02-21.
//

import Foundation

public var isLoggingEnabled = true
public func log(_ items: String?...) {
    guard isLoggingEnabled else {
        return
    }
    debugPrint(items)
}

public func error(_ description: String) -> Error {
    return NSError(domain: "AppErrorDomain", code: 1, userInfo: [NSLocalizedDescriptionKey: description])
}
