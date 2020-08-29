//
//  Base2ViewController.swift
//  OriginalTodoApp
//
//  Created by 深谷祐斗 on 2020/07/19.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//
import UIKit
import SegementSlide

class BaseViewController: SegementSlideDefaultViewController {

    let titleArray:[String] = ["トップニュース","スポーツ","エンタメ","経済","国際","科学","生活","国内"]
//    let news2Array:[String] = ["/SPORTS","/ENTERTAINMENT","/BUSINESS","/WORLD","/SCIENCE","/HEALTH","/NATION"]
    var titleArray2:[String] = ["トップニュース"]
    
    let ud = UserDefaults.standard
    
    var topicArray:[String] = []
    
    var topic:String = "TOP"
    var topic2:String = ""
    var topic3:String = ""
    var topic4:String = ""
    var topic5:String = ""
    var topic6:String = ""
    var topic7:String = ""
    var topic8:String = ""
    
    var title2:String = "スポーツ"
    var title3:String = "エンタメ"
    var title4:String = "経済"
    var title5:String = "国際"
    var title6:String = "科学"
    var title7:String = "生活"
    var title8:String = "国内"
    
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            topicArray.append(topic)
            
            if ud.object(forKey: "count2") != nil {
                topic2 = ""
            }else{
                topic2 = "/SPORTS"
                topicArray.append(topic2)
                titleArray2.append(title2)
                
            }
            
            if ud.object(forKey: "count3") != nil {
                topic3 = ""
            }else{
                topic3 = "/ENTERTAINMENT"
                topicArray.append(topic3)
                titleArray2.append(title3)
            }
            
            if ud.object(forKey: "count4") != nil {
                topic4 = ""
            }else{
                topic4 = "/BUSINESS"
                topicArray.append(topic4)
                titleArray2.append(title4)
            }
            
            if ud.object(forKey: "count5") != nil {
                topic5 = ""
            }else{
                topic5 = "/WORLD"
                topicArray.append(topic5)
                titleArray2.append(title5)
            }
            if ud.object(forKey: "count6") != nil {
                topic6 = ""
            }else{
                topic6 = "/SCIENCE"
                topicArray.append(topic6)
                titleArray2.append(title6)
            }
            if ud.object(forKey: "count7") != nil {
                topic7 = ""
            }else{
                topic7 = "/HEALTH"
                topicArray.append(topic7)
                titleArray2.append(title7)
            }
            if ud.object(forKey: "count8") != nil {
                           topic8 = ""
            }else{
                topic8 = "/NATION"
                topicArray.append(topic8)
                titleArray2.append(title8)
            }
            
            

            ud.removeObject(forKey: "topic")
 
            ud.set(topicArray, forKey: "topic")
//
//            ud.removeObject(forKey: "topic2")
//            ud.removeObject(forKey: "topic3")
//            ud.removeObject(forKey: "topic4")
//            ud.removeObject(forKey: "topic5")
//            ud.removeObject(forKey: "topic6")
//            ud.removeObject(forKey: "topic7")
//            ud.removeObject(forKey: "topic8")
            
          
            reloadData()
            defaultSelectedIndex = 0
            
            
            print(topicArray)
            print(titleArray2)
            

        }

        override var titlesInSwitcher: [String]{
            
            switch titleArray2.count{
            case 1:
                return[titleArray2[0]]
            case 2:
                return[titleArray2[0],titleArray2[1]]
            case 3:
                return[titleArray2[0],titleArray2[1],titleArray2[2]]
            case 4:
                return[titleArray2[0],titleArray2[1],titleArray2[2],titleArray2[3]]
            case 5:
                return[titleArray2[0],titleArray2[1],titleArray2[2],titleArray2[3],titleArray2[4]]
            case 6:
                return[titleArray2[0],titleArray2[1],titleArray2[2],titleArray2[3],titleArray2[4],titleArray2[5]]
            case 7:
                 return[titleArray2[0],titleArray2[1],titleArray2[2],titleArray2[3],titleArray2[4],titleArray2[5],titleArray2[6]]
            case 8:
                return[titleArray2[0],titleArray2[1],titleArray2[2],titleArray2[3],titleArray2[4],titleArray2[5],titleArray2[6],titleArray2[7]]
            default:
                return[titleArray2[0],titleArray2[1],titleArray2[2],titleArray2[3],titleArray2[4],titleArray2[5],titleArray2[6],titleArray2[7]]
            }
    
            
    }
    



     override func segementSlideContentViewController(at index: Int) -> SegementSlideContentScrollViewDelegate? {
        
        
           switch index {
            
           case 0:
           return NewsViewController()
        
            case 1:
            return News2ViewController()
            
            case 2:
            return News3ViewController()
            
            case 3:
            return News4ViewController()
            
            case 4:
            return News5ViewController()
            
            case 5:
            return News6ViewController()
            
            case 6:
            return News7ViewController()
            
            case 7:
            return News8ViewController()
            
            
           default:
               return NewsViewController()
           }
       }

    }
