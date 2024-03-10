//
//  Data + toJson.swift
//  IOS  Task
//
//  Created by Moustafa Gadallah on 29/08/1445 AH.
//

import UIKit

extension Data{
    func printJSON()
    {
        if let JSONString = String(data: self, encoding: String.Encoding.utf8)
        {
            print(JSONString)
        }
    }
}

