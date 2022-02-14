//
//  Encodable.swift
//  FEEcommerce
//
//  Created by baohoang on 11/02/2022.
//

import Foundation

struct JSON {
    static let encoder = JSONEncoder()
    static let decoder = JSONDecoder()
}

extension Encodable{
    func toDict() -> [String:Any]{
        var result = Dictionary<String,Any>()
        do{
            result = try JSONSerialization.jsonObject(with: JSON.encoder.encode(self)) as? [String:Any] ?? [:]
        }
        catch{
            print(error)
        }
        return result
    }
}
