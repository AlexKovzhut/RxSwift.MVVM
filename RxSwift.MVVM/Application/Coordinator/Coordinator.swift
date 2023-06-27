//
//  Coordinator.swift
//  RxSwift.MVVM
//
//  Created by Alexander Kovzhut on 26.06.2023.
//

import UIKit

protocol Coordinator: AnyObject {
    
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}

class MainCoordinator: NSCoder, Coordinator, UINavigationControllerDelegate {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
            navigationController.delegate = self
            login()
        }
        
        func login() {
            let child = PrincipalCoordinator(navigationController: navigationController)
            child.parentCoordinator = self
            childCoordinators.append(child)
            child.start()
        }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() where coordinator === child {
            childCoordinators.remove(at: index)
        }
    }
    
}

class PrincipalCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    weak var parentCoordinator: MainCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        login()
    }
    
    func login() {
        let navigatorController = ViewController()
        navigatorController.coordinator = self
        navigationController.pushViewController(navigatorController, animated: true)
    }
    
}
