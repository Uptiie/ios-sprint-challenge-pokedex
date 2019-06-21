//
//  APIController.swift
//  pokemon sprint
//
//  Created by Uptiie on 6/21/19.
//  Copyright © 2019 Walcenberg, Inc. All rights reserved.
//

import Foundation
import UIKit

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

enum NetworkError: Error {
    case noAuth
    case badAuth
    case otherError
    case badData
    case noDecode
}

class APIController {
    
    baseUrl = URL(string: "https://pokeapi.co/api/v2/evolution-chain/1/")!

}
