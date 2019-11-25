//
//  PropertyInteractor.swift
//  LeaseMaster
//
//  Created by Isaac Annan on 07/11/2019.
//  Copyright © 2019 Qodehub. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import SwiftyJSON

//
//class PropertyInteractor: PresenterToInteractorProtocol{
//    var presenter: InteractorToPresenterProtocol?
//
//    var someArray: Array<PropertyEntity>?
//
//    func FetchProperties() {
//        Alamofire.request(APIConstants.Properties_JSON_URL)
////          .responseJSON { response in
//////            print(response.result.value)
////
////            if(response.response?.statusCode == 200){
////                if let json = response.result.value as? Dictionary<String, AnyObject> {
////                    if let innerDict = json["data"] {
////                        if let anotherDict = innerDict["data"] {
////                            print("biscuit")
////                        print(anotherDict)
////                    }
////                    }
////            }
////        }
////        }
//    .responseObject
//            {
//                (response: DataResponse<PropertyEntity>) in
//                let propertyDetails = response.result.value
//                print("Agahooooooooooooooooo")
//
//                if let prop = propertyDetails!.data{
//                    print("grey")
//
//                    print(prop)
//                    if let prop2 = prop.data{
//                        print("=======ike======")
//                        print(prop2)
//
//                        for i in 0 ..< prop2.count {
//
//
//                            print(prop2[i].images)
//                            if let theImages = prop2[i].images{
//                                for i in 0 ..< theImages.count {
//                                     print(theImages[i].path)
//                                }
//
//
//
//                            }
//                        }
//                    }
//
//
//
//                    }
////                    else{
////                     self.presenter?.PropertiesFetchFailed()
////                    }
//                    }
//                }
//
//
//
//
//        }
//



class PropertyInteractor: PresenterToInteractorProtocol{
    
    
    
    var presenter: InteractorToPresenterProtocol?
    
     var properties = [anotherDict]()
    
    
    func FetchProperties() {
        Alamofire.request(APIConstants.Properties_JSON_URL).responseJSON { response in
            
            if(response.response?.statusCode == 200){
                if let json = response.result.value as AnyObject? {
                    let arrayResponse = json["data"] as! NSDictionary
                    let innerResponse = arrayResponse["data"] as! NSArray
//                    print("*********Papa Lasiiiiiiiisii**********")
//                    //print(arrayResponse)
//                    for i in 0 ..< innerResponse.count {
//                        print(innerResponse[i])
//                            
//                        }
                    let saveJSON = JSON(arrayResponse)
//                    print("///////////////anything_goes/////////////////")
//                    print(saveJSON)
                    
//                    if let list = Mapper<FNArticle>().mapArray(JSONObject:sJSONObj.dictionaryObject?["articles"]!) {
//                        self.articleList = list
//                    }
                    if let arrayobject = Mapper<anotherDict>().mapArray(JSONObject:saveJSON.dictionaryObject?["data"]!){
                    self.properties = arrayobject
                        
                    self.presenter?.PropertiesFetchedSuccess(propertyEntityArray: arrayobject)
                    }
//                        print("=================Seriously================")
//                    print(self.properties[12].id)
                    
//
//                    print("==========Agya Koo===========")
////                    print(arrayObject)
//                    print(self.properties.count)
                    
                   
                }
            }
            else {
                self.presenter?.PropertiesFetchFailed()
            }
        }
        
        
    }
    
    func getArticleCount() -> Int {
        return self.properties.count
       }
    
    func resetArticleList() {
        self.properties = []
    }
}
