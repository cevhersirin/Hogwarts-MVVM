//
//  LoadingProtocol.swift
//  Hogwarts-MVVM
//
//  Created by Cevher Şirin on 17.02.2024.
//

public protocol LoadingProtocol {
    func presentLoading()
    func dismissLoading()
}

public extension LoadingProtocol where Self: UIViewController {
    
    func presentLoading() {
        self.view.endEditing(true)
        let window = UIApplication.shared.windows.first
        window?.startBlockingActivityIndicator()
    }
    
    func dismissLoading() {
        let window = UIApplication.shared.windows.first
        window?.stopBlockingActivityIndicator()
    }
    
}
