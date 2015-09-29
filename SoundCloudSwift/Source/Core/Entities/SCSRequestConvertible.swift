//
//  SCSRequestConvertible.swift
//  SoundCloudSwift
//
//  Created by David Chavez on 9/29/15.
//  Copyright © 2015 SugarTeam. All rights reserved.
//

import Foundation
import Alamofire

/// Request creation struct
struct SCSRequestConvertible {
    
    // MARK: - Attributes
    
    private var path: String
    private var parameters: [String: AnyObject]
    private var method: Alamofire.Method
    
    
    // MARK: - Constructors
    
    /**
    Initializes a SCSRequestConvertible object
    - Parameters:
        - path: The URL string representation of the base path
        - parameters: The dictionary representation of the query parameters
        - method: The HTTP request method _GET, POST, PUT, DELETE_
    - Returns: An SCSRequestConvertible object initialized with given parameters
    */
    init(path: String, parameters: [String: AnyObject], method: Alamofire.Method = .GET) {
        self.path = path
        self.parameters = parameters
        self.method = method
    }
    
    
    // MARK: - Interface
    
    /// Generates the proper NSURLRequest from the current object
    func request() -> NSURLRequest {
        var request = NSMutableURLRequest(URL: NSURL(string: path)!)
        let enconding = ParameterEncoding.URLEncodedInURL
        (request, _) = enconding.encode(request, parameters: parameters)
        return request
    }
}