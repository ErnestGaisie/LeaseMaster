//
//  PropertyPresenter.swift
//  LeaseMaster
//
//  Created by Isaac Annan on 07/11/2019.
//  Copyright © 2019 Qodehub. All rights reserved.
//

import Foundation
import ObjectMapper


import Foundation
import UIKit

class PropertyPresenter:ViewToPresenterProtocol {
    func getArticleCount() -> Int {
        (self.interactor?.getArticleCount())!
    }
    
    
    
    
    var view: PresenterToViewProtocol? 
    var viewDummy: DummyPresenterToViewProtocol?
    var interactor: PresenterToInteractorProtocol?
    
    var router: PresenterToRouterProtocol?
    
   
    func StartFetchingProperties() {
        interactor?.FetchProperties()
//        print("========================this is good**************************")
    }
    
    func resetArticleList() {
    self.interactor?.resetArticleList()
    }
    
    func showPropertiesDetailViewController(navigationController: UINavigationController) {
        
    }
    

}

extension PropertyPresenter: InteractorToPresenterProtocol{
 
    func PropertiesFetchedSuccess(propertyEntityArray: Array<anotherDict>) {
        view?.ShowProperties(propertyArray: propertyEntityArray)
        viewDummy?.ShowProperties(propertyArray: propertyEntityArray)
        print("============aaaaaaaahhhhhhhhhh..................")
       
    }
    
    func PropertiesFetchFailed() {
        view?.showError()
    }
    
   
    
    
    
}
