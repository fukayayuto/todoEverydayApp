//
//  NotificationViewController.swift
//  todoEverydayApp12
//
//  Created by 深谷祐斗 on 2020/09/16.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import UIKit



class NotificationViewController: UITableViewController {
 
    @IBOutlet weak var switchButton: UISwitch!
    @IBOutlet weak var cell1: UITableViewCell!
    @IBOutlet weak var cell2: UITableViewCell!
    @IBOutlet weak var timeTextField: UITextField!
    
    var timePicker = TimePickerKeyboard()
    var count:Int = 0
    let ud = UserDefaults.standard
    var hour:String = "09"
    var minite:String = "00"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cell1.textLabel?.text = "通知設定"
        cell2.textLabel?.text = "通知時間設定"
 
        if ud.object(forKey: "time") != nil{
            timeTextField.text = ud.object(forKey: "time") as? String
        }else{
            timeTextField.text = "\(hour):\(time)"
        }
        
        if ud.object(forKey: "switch") != nil{
                  count = ud.object(forKey: "switch") as! Int
        }else{
            count = 0
        }
              if count == 0{
                  switchButton.isOn = true
                  OnAction()
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
   
    @IBAction func reloadButton(_ sender: Any) {
        guard let time = timeTextField.text else {return}
        ud.removeObject(forKey: "time")
        ud.set(time, forKey: "time")
        hour = hourTextChange(hour: time)
        minite = timeTextChange(minite: time)
        self.viewDidLoad()
    }
    
    
    
    
    func OnAction(){
          
          let content = UNMutableNotificationContent()
          var notificationTime = DateComponents()

          // トリガー設定
        
          notificationTime.hour = Int(hour)
          notificationTime.minute = Int(minite)
          let trigger = UNCalendarNotificationTrigger(dateMatching: notificationTime, repeats: false)
          
          content.title = ""
          content.body = "今日の天気"
          content.sound = UNNotificationSound.default

          let request = UNNotificationRequest(identifier: "uuid", content: content, trigger: trigger)
           // 通知をセット
           UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
          
      }
      
    func hourTextChange(hour:String)->String{
             let hourString:String = String(hour[hour.index(hour.startIndex, offsetBy: 0)..<hour.index(hour.startIndex, offsetBy: 1)])
                return hourString
                
            }
    
    
    func timeTextChange(minite:String)->String{
             let miniteString:String = String(minite[minite.index(minite.startIndex, offsetBy: 2)..<minite.index(minite.startIndex, offsetBy: 3)])
                return miniteString
                
            }
   
       
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
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
