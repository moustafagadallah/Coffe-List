//
//  CoffeItem.swift
//  IOS  Task
//
//  Created by Moustafa Gadallah on 29/08/1445 AH.
//

import Foundation

struct CoffeItem : Codable{
    let title, description: String?
    let ingredients: [String]?
    let image: String?
    let id: Int?
}

enum APIResponseModel {
    
    case success([CoffeItem]?)
    case failure(APIError)

    
}






