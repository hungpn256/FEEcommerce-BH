//
//  AppDelegate.swift
//  FEEcommerce
//
//  Created by Pham Hung on 2/11/22.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var db: Firestore?
    var window: UIWindow?
    static var shared: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    var data: DataDelegate?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        data = DataDelegate()
        FirebaseApp.configure()
        db = Firestore.firestore()
        if let uid = UserDefaults.standard.string(forKey: "uid"){
            API.shared.getSingleData(collection: "users", id: uid, modelData: UserGET.self) { result in
                switch result {
                case .failure(_):
                    self.createLoginView()
                case .success(let user):
                    self.data?.user = user
                }
            }
            self.createLoginView()
        }else{
            print(123)
            self.createLoginView()
        }
        window?.makeKeyAndVisible()
        return true
    }
    
    func createLoginView(){
        window?.rootViewController = UINavigationController(rootViewController: HomeViewController())
    }
}

