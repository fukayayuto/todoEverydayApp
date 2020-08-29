//
//  ConfigurationViewController.swift
//  OriginalTodoApp
//
//  Created by 深谷祐斗 on 2020/08/09.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import UIKit

class ConfigurationViewController: UITableViewController {
    
    @IBOutlet weak var settingCell1: UITableViewCell!
    @IBOutlet weak var settingCell2: UITableViewCell!
    @IBOutlet weak var settingCell3: UITableViewCell!
    @IBOutlet weak var cell2: UITableViewCell!
    @IBOutlet weak var settingCell4: UITableViewCell!
    @IBOutlet weak var settingCell5: UITableViewCell!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        cell2.textLabel?.text = "プッシュ通知機能"
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
         switch section {
           case 0: // 「設定」のセクション
             return 3
           case 1: // 「その他」のセクション
             return 1
          case 2:
            return 2
           default: // ここが実行されることはないはず
             return 0
           }
    }

    
    
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 1 && indexPath.section == 0{
            
            print("selectNews")
            performSegue(withIdentifier: "select", sender: nil)
            
        }else if indexPath.section == 0 && indexPath.row == 0 {
            
        performSegue(withIdentifier: "mojiChange", sender: nil)
            
        }else if indexPath.row == 2 && indexPath.section == 0{
            performSegue(withIdentifier: "moji2", sender: nil)
            print("moji2")
            
        }
        
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
