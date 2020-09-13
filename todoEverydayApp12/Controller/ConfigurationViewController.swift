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
    @IBOutlet weak var switchButton: UISwitch!
    
    var count:Int = 0
    let ud = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cell2.textLabel?.text = "通知機能"
        
        if ud.object(forKey: "switch") != nil{
            count = ud.object(forKey: "switch") as! Int
        }
        
        if count == 0{
            switchButton.isOn = true
        }else if count == 1{
            switchButton.isOn = false
        }
    }
  
    @IBAction func switchChange(_ sender: UISwitch) {
        
        if ( sender.isOn ) {
                  print("ON")
                  OnAction()
                  ud.removeObject(forKey:"switch")
               } else {
                   print("OFF")
                   count = 1
                   ud.set(count, forKey: "switch")
               }
    }
    
    func OnAction(){
        
        let content = UNMutableNotificationContent()
        var notificationTime = DateComponents()

        // トリガー設定
        notificationTime.hour = 9
        notificationTime.minute = 0
        let trigger = UNCalendarNotificationTrigger(dateMatching: notificationTime, repeats: false)
        
        content.title = ""
        content.body = "今日の天気"
        content.sound = UNNotificationSound.default

        let request = UNNotificationRequest(identifier: "uuid", content: content, trigger: trigger)
         // 通知をセット
         UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
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
    
}

