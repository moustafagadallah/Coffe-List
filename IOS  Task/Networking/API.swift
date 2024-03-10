//
//  API.swift
//  IOS  Task
//
//  Created by Moustafa Gadallah on 29/08/1445 AH.
//

import UIKit
import Alamofire

typealias APIResponseModelComplete = (_ result: APIResponseModel) -> Void


class API {
    
    static let shared = API()
    private init() {}

    func request(url: String?,  onComplete: @escaping APIResponseModelComplete) {
        AF.request(url ?? "").responseString { responseData in
            do {
                if let response = responseData.data , response.count > 0 , responseData.response?.statusCode == 200 {
                    switch responseData.result {
                    case .success(_):
                        do {

                            let coffeItems = try JSONDecoder().decode([CoffeItem].self, from: responseData.data!)
                            onComplete(.success(coffeItems))
                            
                        } catch let jsonErr {
                            print("Error serializing json:", jsonErr)
                        }
                    case .failure(let value):
                    
                        onComplete(.failure(.AFError(value)))
                        
                    }
                }
                
            }
        }
        
        
        
    }
    
    
}
    
 
