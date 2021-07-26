//
//  MainCoordinator.swift
//  BodyFit
//
//  Created by Ahmad Shahir Abdul Satar on 7/24/21.
//

import Foundation
import UIKit


class MainCoordinator: Coordinator {    
    var navigationController: UINavigationController?
    
    func eventOccurred(with type: Event) {
        switch type {
        case .loggedIn:
            var vc: UIViewController & Coordinating = SecondViewController()
            vc.coordinator = self
            navigationController?.pushViewController(vc, animated: true)
        case .loggedOut:
            var vc: UIViewController & Coordinating = LoginViewController()
            vc.coordinator = self
            navigationController?.pushViewController(vc, animated: true)
        case .signUp:
            var vc: UIViewController & Coordinating = SignUpViewController()
            vc.coordinator = self
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func start() {
        //switch between login state
        //if logged in -> TabBarView
        //if not logged in -> show login/sign up view
        var vc : UIViewController & Coordinating = LoginViewController()
        vc.coordinator = self
        navigationController?.setViewControllers([vc], animated: false)
    }
    
    
}
