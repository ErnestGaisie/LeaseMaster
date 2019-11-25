//
//  PropertyRouter.swift
//  LeaseMaster
//
//  Created by Isaac Annan on 07/11/2019.
//  Copyright © 2019 Qodehub. All rights reserved.
//

import Foundation
import UIKit

class PropertyRouter: PresenterToRouterProtocol {
    static func createModule() -> LandingPageViewController {
        
        let view = mainstoryboard.instantiateViewController(withIdentifier: "HomeModuleStoryboard") as! LandingPageViewController
        
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = PropertyPresenter()
        
        let interactor: PresenterToInteractorProtocol = PropertyInteractor()
        
        let router: PresenterToRouterProtocol = PropertyRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        
        
        return view

    }
    
    
    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name: "HomeModuleStoryboard", bundle: Bundle.main)
    }
    
    
    func PushToPropertiesDetailView(navigationConroller: UINavigationController) {
        
    }
    
}
