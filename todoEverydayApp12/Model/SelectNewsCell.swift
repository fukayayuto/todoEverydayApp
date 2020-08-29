//
//  SelectNewsCell.swift
//  OriginalTodoApp
//
//  Created by 深谷祐斗 on 2020/08/10.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import UIKit

class SelectNewsCell: UITableViewCell {

    @IBOutlet weak var newsTextLabel: UILabel!
    
    
    @IBOutlet weak var selectButton: UISegmentedControl!
    
    
    let ud = UserDefaults.standard
    
    
    let newsArray:[String] = ["スポーツ","エンタメ","経済","国際","科学","生活","国内"]

    var topic2:String = "/SPORTS"
    var topic3:String = "/ENTERTAINMENT"
    var topic4:String = "/ENTERTAINMENT"
    var topic5:String = "/WORLD"
    var topic6:String = "/SCIENCE"
    var topic7:String = "/HEALTH"
    var topic8:String = "/NATION"
    var count:Int = 8
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
    @IBAction func selectNews(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
        if ud.object(forKey: "count") != nil{
        count = ud.object(forKey: "count") as! Int
        }
        count = count + 1
        ud.removeObject(forKey: "count")
        ud.set(count, forKey: "count")
        case 1:
        if ud.object(forKey: "count") != nil{
        count = ud.object(forKey: "count") as! Int
        }
        count = count - 1
        ud.removeObject(forKey: "count")
        ud.set(count, forKey: "count")
        default: break
        
    }
    
 
    
    
//    func selectNews(cellIndex:Int){
//
//
//        let selectIndex = selectButton.selectedSegmentIndex
//
//        if selectIndex == 0 && cellIndex == 0{
//
//        }
//
//        if selectIndex == 0 && cellIndex == 1{
//
//        }
//
//
//        if selectIndex == 0 && cellIndex == 2{
//
//        }
//
//        if selectIndex == 0 && cellIndex == 3{
//
//        }
//
//        if selectIndex == 0 && cellIndex == 4{
//
//        }
//
//        if selectIndex == 0 && cellIndex == 5{
//
//        }
//
//        if selectIndex == 0 && cellIndex == 6{
//        }
//
//        if selectIndex == 1 && cellIndex == 0{
//                count = count - 1
//               }
//
//               if selectIndex == 1 && cellIndex == 1{
//                    count = count - 1
//               }
//
//
//               if selectIndex == 1 && cellIndex == 2{
//                   count = count - 1
//               }
//
//               if selectIndex == 1 && cellIndex == 3{
//                  count = count - 1
//               }
//
//               if selectIndex == 1 && cellIndex == 4{
//                   count = count - 1
//               }
//
//               if selectIndex == 1 && cellIndex == 5{
//                count = count - 1
//               }
//
//               if selectIndex == 1 && cellIndex == 6{
//                  count = count - 1
//               }
        
      
//
//        switch cellIndex{
//        case 0:
//            ud.set(topic2, forKey: "topic2")
//        case 1:
//            ud.set(topic3, forKey: "topic3")
//        case 2:
//            ud.set(topic4, forKey: "topic4")
//        case 3:
//            ud.set(topic5, forKey: "topic5")
//        case 4:
//            ud.set(topic6, forKey: "topic6")
//        case 5:
//            ud.set(topic7, forKey: "topic7")
//        case 6:
//            ud.set(topic8, forKey: "topic8")
//
 }

}
