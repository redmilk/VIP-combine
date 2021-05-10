//
//  ContentCoordinator.swift
//  VIPexample
//
//  Created by Admin on 10.05.2021.
//

import Foundation
import UIKit.UIViewController
import Combine

final class ContentCoordinator: Coordinatable {
    
    private var window: UIWindow
    private var configurator: ContentConfigurator!
    private let showAuth = PassthroughSubject<Void, Never>()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    var showAuthPublisher: AnyPublisher<Void, Never> {
        showAuth.first().eraseToAnyPublisher()
    }
    
    func start() {
        let controller = ContentViewController()
        let interactor = ContentInteractor()
        let presenter = ContentPresenter(coordinator: self)
        configurator = ContentConfigurator(
            interactor: interactor,
            presenter: presenter,
            controller: controller
        )
        var subscriptions = Set<AnyCancellable>()
        configurator.bindModuleLayers(controller: controller, subscriptions: &subscriptions)
        
        let navigation = UINavigationController(rootViewController: controller)
        navigation.hidesBarsOnSwipe = true
        navigation.modalPresentationStyle = .fullScreen
        window.rootViewController = navigation
        window.makeKeyAndVisible()
    }
    
    func end() {
        showAuth.send(())
    }
}
