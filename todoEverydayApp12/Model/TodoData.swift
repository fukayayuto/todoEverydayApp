//
//  Data.swift
//  OriginalTodoApp
//
//  Created by 深谷祐斗 on 2020/08/02.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

//
//class TodoData: NSObject {
//
//    var string : String!
//    var date : Date!
//    var Int :Int!
//
//}


import Foundation
import FirebaseDatabase

class TodoData: NSObject, NSCoding{
   
    var todoString : String!
    var todoDate : Date!
    var colornumber :Int!
    
    override init(){}
    
    func encode(with coder: NSCoder) {
        coder.encode(todoString, forKey: "todoString")
        coder.encode(todoDate, forKey: "todoDate")
        coder.encode(colornumber, forKey: "colornumber")
    }
    
    required init?(coder aDecoder: NSCoder) {
        todoString = aDecoder.decodeObject(forKey: "todoString") as? String
        todoDate = aDecoder.decodeObject(forKey: "todoDate") as? Date
        colornumber = aDecoder.decodeObject(forKey: "colornumber") as? Int
    }
    
    
}

//class ToData2{
//    var todoString : String!
//    var dateString:String!
//    var todoDate : Date!
//    var numberString:String!
//    var colornumber :Int!
//
//    var ref: DatabaseReference?
//
//    init (snapshot: DataSnapshot) {
//
//        ref = snapshot.ref
//
//        let data = snapshot.value as! Dictionary<String, String>
//        todoString = data["todo"]! as String
//        dateString = data["date"]! as String
//        numberString = data["number"]! as String
//    }


