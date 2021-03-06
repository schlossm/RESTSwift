//
//  RESTGETRequest.swift
//  RESTSwift
//
//  Created by Michael Schloss on 12/8/17.
//  Copyright © 2017 Michael Schloss. All rights reserved.
//

import Foundation

/**
 A GET request
 
 Allows for the specification of URI key-value pairs
 */
public protocol RESTGETRequest : RESTRequest
{
    ///A dictionary specifying URI key-value pairs.  Defaults to `nil`
    var queryParameters : [String : String]? { get }
}

/**
 Convenience GET request that denotes a single object should be expected from the specified endpoint
 */
public protocol RESTSingleObjectRequest : RESTGETRequest { }

public extension RESTGETRequest
{
    var queryParameters : [String: String]? { return nil }
}

extension RESTGETRequest
{
    var queryItems : [URLQueryItem]
    {
        return (queryParameters ?? [:]).map { URLQueryItem(name: $0, value: $1) }
    }
}
