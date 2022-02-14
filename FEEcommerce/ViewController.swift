//
//  ViewController.swift
//  FEEcommerce
//
//  Created by Pham Hung on 2/11/22.
//

import UIKit
import Firebase
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        API.shared.getSingleData(collection: "users", id: "WFzyWjezwPK3tJVwR19d", modelData: User.self){ test in
            switch test {
            case .success(let user):
                print(user)
            case .failure(let err):
                print(err)
            }
        }
//        API.shared.getAllData(collection: "users",modelData: User.self){ test in
//            switch test {
//            case .success(let users):
//                resultss = users
////                print(resultss)
//            case .failure(let err):
//                print(err)
//            }
//        }
//        API.shared.addData(collection: "users", data: User(last: "Bảo", first: "Hoàng", born: 1999).toDict())
//         Do any additional setup after loading the view.
//        var ref: DocumentReference? = nil
//
//        ref = AppDelegate.shared.db?.collection("users").addDocument(data: [
//            "first": "Ada wong",
//            "last": "Lovelace",
//            "born": 1815,
//        ]) { err in
//            if let err = err {
//                print("Error adding document: \(err)")
//            } else {
//                print("Document added with ID: \(ref!.documentID)")
//            }
//        }
        
    }


}

