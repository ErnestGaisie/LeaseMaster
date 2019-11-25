//
//  protocols.swift
//  LeaseMaster
//
//  Created by Isaac Annan on 07/11/2019.
//  Copyright © 2019 Qodehub. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

protocol ViewToPresenterProtocol: class{
    
    var view: PresenterToViewProtocol? {get set}
    var viewDummy: DummyPresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func StartFetchingProperties()
    func resetArticleList()
    func showPropertiesDetailViewController(navigationController:UINavigationController)
    func getArticleCount() -> Int

}

protocol PresenterToViewProtocol: class{
    func ShowProperties(propertyArray: Array<anotherDict>)
    func showError()
    func showLoaderView(_ status: Bool)
    
}

protocol DummyPresenterToViewProtocol: class{
    func ShowProperties(propertyArray: Array<anotherDict>)
  
}

protocol PresenterToRouterProtocol: class {
    static func createModule()-> LandingPageViewController
    func PushToPropertiesDetailView(navigationConroller:UINavigationController)
}

protocol PresenterToInteractorProtocol: class {
    var presenter:InteractorToPresenterProtocol? {get set}
    func FetchProperties()
    func getArticleCount() -> Int
    func resetArticleList()
     
}

protocol InteractorToPresenterProtocol: class {
    func PropertiesFetchedSuccess(propertyEntityArray:Array<anotherDict>)
    func PropertiesFetchFailed()
}
