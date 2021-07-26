//
//  MainCoordinator.swift
//  BodyFit
//
//  Created by Ahmad Shahir Abdul Satar on 7/24/21.
//

import Foundation
import UIKit


// MARK: - Coordinator
protocol Coordinator {
    var navigationController: UINavigationController? { get set }
    func eventOccurred(with type: Event)
    func start()
    
}

protocol Coordinating {
    var coordinator: Coordinator? { get set}
}
