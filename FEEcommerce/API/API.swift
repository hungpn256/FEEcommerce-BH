//
//  API.swift
//  FEEcommerce
//
//  Created by Pham Hung on 2/11/22.
//

import Foundation
import Firebase
import SwiftUI

enum APIerr:Error{
    case SingleDataErr
}

class API{
    static let shared = API()
    let db = AppDelegate.shared.db
    
    func returnArrDocument<T:Decodable>(querysnapshot:QuerySnapshot,model:T.Type) -> [T]{
        var arr:[T] = []
        for document in querysnapshot.documents {
            do {
                var data = document.data()
                data["id"] = document.documentID
                let json = try JSONSerialization.data(withJSONObject: data)
                let decoded = try JSON.decoder.decode(model, from: json)
                arr.append(decoded)
            } catch {
                print(error)
            }
        }
        return arr
    }
    
    func getAllData<T:Decodable>(collection:String,modelData:T.Type, completion:@escaping (Result<[T],Error>) -> Void){
        db?.collection(collection).getDocuments() {[weak self] (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                completion(.failure(err))
            } else {
                let results:[T] = self?.returnArrDocument(querysnapshot: querySnapshot!,model:modelData) ?? []
                DispatchQueue.main.async {
                    completion(.success(results))
                }
            }
        }
    }
    
    func getSingleData<T:Decodable>(collection:String,id:String,modelData:T.Type,completion:@escaping (Result<T,Error>) -> Void){
        db?.collection(collection).document(id).getDocument{(document,err) in
            guard let document = document, document.exists else{
                print("Can't get single data")
                completion(.failure(APIerr.SingleDataErr))
                return
            }
            var result = [String:Any]()
            do{
                if var data = document.data(){
                    data["id"] = document.documentID
                    result = data
                }
                let json = try JSONSerialization.data(withJSONObject: result)
                let decoded = try JSON.decoder.decode(modelData, from: json)
                print(decoded,"decode")
                DispatchQueue.main.async {
                    completion(.success(decoded))
                }
            }
            catch{
                print(error)
            }
        }
    }
    
    
    
    func addData(collection:String,data:[String:Any]){
        var ref: DocumentReference? = nil
        ref = db?.collection(collection).addDocument(data: data) {
            err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    print("Document added with ID: \(ref!.documentID)")
                }
        }
    }
    
    func delData(collection:String,id:String){
        db?.collection(collection).document(id).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully remove item with id \(id)!")
            }
        }
    }
    
    func updateData(collection:String,id:String,data:[String:Any]){
        db?.collection(collection).document(id).setData(data, merge: true){
            err in
                if let err = err {
                    print("Error update document: \(err)")
                } else {
                    print("Document update successfully")
                }
        }
    }
    
}
