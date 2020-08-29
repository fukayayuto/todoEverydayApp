//
//  SelectNews2ViewController.swift
//  OriginalTodoApp
//
//  Created by 深谷祐斗 on 2020/08/14.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import UIKit

class SelectNewsViewController: UITableViewController {

    let newsArray:[String] = ["スポーツ","エンタメ","経済","国際","科学","生活","国内"]
    
    @IBOutlet var selectTableView: UITableView!
    
    
    @IBOutlet weak var selectButton2: UISegmentedControl!
    @IBOutlet weak var selectButton3: UISegmentedControl!
    @IBOutlet weak var selectButton4: UISegmentedControl!
    @IBOutlet weak var selectButton5: UISegmentedControl!
    @IBOutlet weak var selectButton6: UISegmentedControl!
    @IBOutlet weak var selectButton7: UISegmentedControl!
    @IBOutlet weak var selectButton8: UISegmentedControl!

    var selectCount2:Int = 0
    var selectCount3:Int = 0
    var selectCount4:Int = 0
    var selectCount5:Int = 0
    var selectCount6:Int = 0
    var selectCount7:Int = 0
    var selectCount8:Int = 0
    
    let ud = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        
        selectTableView.sectionHeaderHeight = 0
        
        if ud.object(forKey: "count2") != nil{
            selectCount2 = ud.object(forKey: "count2") as! Int
            selectButton2.selectedSegmentIndex = 1
        }else{
            selectButton2.selectedSegmentIndex = 0
        }
        if ud.object(forKey: "count3") != nil{
            selectCount3 = ud.object(forKey: "count3") as! Int
            selectButton3.selectedSegmentIndex = 1
        }else{
            selectButton3.selectedSegmentIndex = 0
           }
        if ud.object(forKey: "count4") != nil{
            selectCount4 = ud.object(forKey: "count4") as! Int
            selectButton4.selectedSegmentIndex = 1
        }else{
            selectButton4.selectedSegmentIndex = 0
        }
        if ud.object(forKey: "count5") != nil{
            selectCount5 = ud.object(forKey: "count5") as! Int
            selectButton5.selectedSegmentIndex = 1
        }else{
            selectButton5.selectedSegmentIndex = 0
        }
               
        if ud.object(forKey: "count6") != nil{
            selectCount6 = ud.object(forKey: "count6") as! Int
            selectButton6.selectedSegmentIndex = 1
        }else{
            selectButton6.selectedSegmentIndex = 0
        }
        if ud.object(forKey: "count7") != nil{
            selectCount7 = ud.object(forKey: "count7") as! Int
            selectButton7.selectedSegmentIndex = 1
         }else{
            selectButton7.selectedSegmentIndex = 0
         }
    
        if ud.object(forKey: "count8") != nil{
            selectCount8 = ud.object(forKey: "count8") as! Int
            selectButton8.selectedSegmentIndex = 1
        }else{
            selectButton8.selectedSegmentIndex = 0
        }
    }
    
    
    
    @IBAction func select2(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: ud.removeObject(forKey: "count2")
        case 1:
            selectCount2 = selectCount2 + 1
            ud.set(selectCount2, forKey: "count2")
        default:
            break
        }
        
    }
    
    
    @IBAction func select3(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
               case 0: ud.removeObject(forKey: "count3")
               case 1:
                   selectCount3 = selectCount3 + 1
                   ud.set(selectCount3, forKey: "count3")
               default:
                   break
               }
        
    }
    
    @IBAction func select4(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
           case 0: ud.removeObject(forKey: "count4")
           case 1:
               selectCount4 = selectCount4 + 1
               ud.set(selectCount4, forKey: "count4")
           default:
               break
           }
        
    }
    
    
    @IBAction func select5(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: ud.removeObject(forKey: "count5")
        case 1:
            selectCount5 = selectCount5 + 1
            ud.set(selectCount5, forKey: "count5")
        default:
            break
        }
    }
    
    
    @IBAction func select6(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: ud.removeObject(forKey: "count6")
        case 1:
            selectCount6 = selectCount6 + 1
            ud.set(selectCount6, forKey: "count6")
        default:
            break
        }
    }
    
   
    @IBAction func select7(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: ud.removeObject(forKey: "count7")
        case 1:
            selectCount7 = selectCount7 + 1
            ud.set(selectCount7, forKey: "count7")
        default:
            break
        }
    }
    
    @IBAction func select8(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: ud.removeObject(forKey: "count8")
        case 1:
            selectCount8 = selectCount8 + 1
            ud.set(selectCount8, forKey: "count8")
        default:
            break
        }
    }
    
    
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 7
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
            case 0: // 「設定」のセクション
                return 1
            case 1: // 「その他」のセクション
                return 1
            case 2:
                return 1
            case 3: // 「設定」のセクション
                return 1
            case 4: // 「その他」のセクション
                return 1
            case 5:
                return 1
            case 6:
                return 1
            default: // ここが実行されることはないはず
                return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.bounds.size.height/12
    }
    
   

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
