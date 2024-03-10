//
//  CoffeListService.swift
//  IOS  Task
//
//  Created by Moustafa Gadallah on 29/08/1445 AH.
//

import Foundation


class CoffeListService {
    
    // MARK: - Get Coffe List
    
    func getCoffeList(response: @escaping (APIResponseModel) -> Void) {
        let url = Appurl.BaseUrl + Endpoint.CoffeList
        API.shared.request(url: url, onComplete: response)
        
    }
    
    
}
    
