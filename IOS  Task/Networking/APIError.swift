//
//  APIError.swift
//  IOS  Task
//
//  Created by Moustafa Gadallah on 29/08/1445 AH.
//

import Foundation
import Alamofire
enum APIError: Error {
    
    case noInternetConnection
    case unKnownError
    case parseError
    case timeOut
    case AFError(AFError)
   
}
