////
////  PropertyEntity.swift
////  LeaseMaster
////
////  Created by Isaac Annan on 07/11/2019.
////  Copyright © 2019 Qodehub. All rights reserved.
////
//
import Foundation
import ObjectMapper


//
//class PropertyEntity: Mappable {
//
//    internal var id: Int?
//    internal var userid: Int?
//    internal var propertyid: Int?
//    internal var cityid: Int?
//    internal var name: String?
//    internal var slug: String?
//    internal var price: String?
//    internal var description: String?
//    internal var meta: String?
//    internal var published: Int?
//    internal var created: String?
//    internal var updated: String?
//////    internal var images: Array<AnyObject>?
//////    internal var type: Array<Any>?
////
//////
//////    internal var id: Int?
//////    internal var name: String?
//////    internal var price: String?
////     // var message: String?
////
////
//    required init?(map: Map) {
//        mapping(map: map)
//    }
////
//    func mapping(map: Map) {
//        id <- map["id"]
//        userid <- map["user_id"]
//        propertyid <- map["property_type_id"]
//        //cityid <- map["city_id"]
//        name <- map["name"]
//        slug <- map["slug"]
//        price <- map["price"]
//        description <- map["description"]
//        meta <- map["meta"]
//        published <- map["is_published"]
//        created <- map["created_at"]
//        updated <- map["updated_at"]
////        images <- map["images"]
////        type <- map["type"]
//
////        id <- map["data.id"]
////        name <- map["data.name"]
////        price <- map["data.price"]
////        message <- map["message"]
//
//
//    }
//
//}


//class PropertyEntity: Mappable, CustomStringConvertible{
//    var description: String {
//        return "\(self.data)"
//    }
//
//
//
//    var status: Int?
//    var success: Bool?
//    var message: String?
//    var data: innerDict?
//
//
//    required init?(map: Map) {
//           mapping(map: map)
//       }
//
//    func mapping(map: Map) {
//           status <- map["status"]
//         success <- map["success"]
//         message <- map["message"]
//         data <- map["data"]
//       }
//}
//
//class innerDict: Mappable{
//    var current_page: Int?
//    var data: [anotherDict]?
//
//    required init?(map: Map) {
//
//         }
//
//      func mapping(map: Map) {
//        current_page <- map["current_page"]
//           data <- map["data"]
//         }
//}
//
//class anotherDict: Mappable
//{
//
//    var id: Int?
//    var name: String?
//    var price: String?
//    var meta: String?
//    var images: [ImagesDetails]?
//    var city: CityDetails?
//    var type: TypeDetails?
//
//    required init?(map: Map) {
//
//            }
//
//         func mapping(map: Map) {
//                id <- map["id"]
//              name <- map["name"]
//            price <- map["price"]
//             meta <- map["meta"]
//            images <- map["images"]
//              city <- map["city"]
//            }
//
//}
//
//class ImagesDetails: Mappable
//{
//
//
//    var property_id: Int?
//    var name: String?
//    var description: String?
//    var path: String?
//
//    required init?(map: Map) {
//                mapping(map: map)
//            }
//
//         func mapping(map: Map) {
//                property_id <- map["property_id"]
//              name <- map["name"]
//            description <- map["description"]
//            path <- map["path"]
//            }
//
//}
//
//class CityDetails: Mappable
//{
//
//
//    var region_id: Int?
//    var name: String?
//
//
//    required init?(map: Map) {
//                mapping(map: map)
//            }
//
//         func mapping(map: Map) {
//                region_id <- map["region_id"]
//              name <- map["name"]
//
//            }
//
//}
//
//class TypeDetails: Mappable
//{
//
//
//    var property_category_id: Int?
//    var name: String?
//    var slug: String?
//
//
//    required init?(map: Map) {
//
//            }
//
//         func mapping(map: Map) {
//            property_category_id <- map["property_category_id"]
//            name <- map["name"]
//            slug <- map["slug"]
//
//            }
//
//}

class PropertyEntity: Mappable{
   
    
   
    
    var status: Int?
    var success: Bool?
    var message: String?
    var data: innerDict?

    
    required init?(map: Map) {
           mapping(map: map)
       }
       
    func mapping(map: Map) {
           status <- map["status"]
         success <- map["success"]
         message <- map["message"]
         data <- map["data"]
       }
}

class innerDict: Mappable{
    var current_page: Int?
    var data: anotherDict?
    
    required init?(map: Map) {
       
         }
         
      func mapping(map: Map) {
        current_page <- map["current_page"]
           data <- map["data"]
         }
}

class anotherDict: Mappable
{
    
    var id: Int?
    var name: String?
    var price: String?
    var meta: String?
    var images: [ImagesDetails]?
    var city: CityDetails?
    var type: TypeDetails?
    
    required init?(map: Map) {
               mapping(map: map)
            }
            
         func mapping(map: Map) {
                id <- map["id"]
              name <- map["name"]
            price <- map["price"]
             meta <- map["meta"]
            images <- map["images"]
              city <- map["city"]
            }
    
}

class ImagesDetails: Mappable
{
   
    
    var property_id: Int?
    var public_id: String?
    var url: String?
    var description: String?
    var path: String?
   
    
    required init?(map: Map) {
                mapping(map: map)
            }
            
         func mapping(map: Map) {
            property_id <- map["property_id"]
            public_id <- map["public_id"]
            url <- map["url"]
            description <- map["description"]
            path <- map["path"]
            }
    
}

class CityDetails: Mappable
{
   
    
    var region_id: Int?
    var name: String?
   
    
    required init?(map: Map) {
                mapping(map: map)
            }
            
         func mapping(map: Map) {
                region_id <- map["region_id"]
              name <- map["name"]
          
            }
    
}

class TypeDetails: Mappable
{
   

    var property_category_id: Int?
    var name: String?
    var slug: String?
   
    
    required init?(map: Map) {
              mapping(map: map)
            }
            
         func mapping(map: Map) {
            property_category_id <- map["property_category_id"]
            name <- map["name"]
            slug <- map["slug"]
          
            }
    
}
