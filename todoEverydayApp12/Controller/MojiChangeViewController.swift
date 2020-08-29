//
//  MojiChangeViewController.swift
//  OriginalTodoApp
//
//  Created by 深谷祐斗 on 2020/08/10.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import UIKit

class MojiChangeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    
    @IBOutlet weak var mojiTableView: UITableView!
    
    let mojiArray:[String] = ["大きい","少し大きい","通常","少し小さい","小さい"]
    var checkArray:[String] = ["circle","circle","checkmark.circle","circle","circle"]
    var mojisize:Int = 2
    let ud = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mojiTableView.delegate = self
        mojiTableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mojiArray.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if ud.object(forKey: "mojisize") != nil{
                   mojisize = ud.object(forKey: "mojisize") as! Int
               }
               switch mojisize{
               case 0:
               checkArray = ["checkmark.circle","circle","circle","circle","circle"]
               case 1:
               checkArray = ["circle","checkmark.circle","circle","circle","circle"]
               case 2:
               checkArray = ["circle","circle","checkmark.circle","circle","circle"]
               case 3:
               checkArray = ["circle","circle","circle","checkmark.circle","circle"]
               case 4:
               checkArray = ["circle","circle","circle","circle","checkmark.circle"]
               default:
               checkArray = ["checkmark.circle","circle","circle","circle","circle"]
               }
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "mojiCell")
        cell.textLabel?.text = mojiArray[indexPath.row]
        cell.imageView?.image = UIImage(systemName: checkArray[indexPath.row])
        return cell
       }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        checkArray.removeAll()
        switch indexPath.row {
        case 0:
        checkArray = ["checkmark.circle","circle","circle","circle","circle"]
        mojisize = 0
        ud.removeObject(forKey: "mojisize")
        UserDefaults.standard.set(mojisize, forKey: "mojisize")
        case 1:
        checkArray = ["circle","checkmark.circle","circle","circle","circle"]
        mojisize = 1
        ud.removeObject(forKey: "mojisize")
        UserDefaults.standard.set(mojisize, forKey: "mojisize")
        case 2:
        checkArray = ["circle","circle","checkmark.circle","circle","circle"]
        mojisize = 2
        ud.removeObject(forKey: "mojisize")
        UserDefaults.standard.set(mojisize, forKey: "mojisize")
        case 3:
        checkArray = ["circle","circle","circle","checkmark.circle","circle"]
        mojisize = 3
        ud.removeObject(forKey: "mojisize")
        UserDefaults.standard.set(mojisize, forKey: "mojisize")
        case 4:
        checkArray = ["circle","circle","circle","circle","checkmark.circle"]
        mojisize = 4
        ud.removeObject(forKey: "mojisize")
        UserDefaults.standard.set(mojisize, forKey: "mojisize")
        default:
        checkArray = ["checkmark.circle","circle","circle","circle","circle"]
        mojisize = 0
        ud.removeObject(forKey: "mojisize")
        UserDefaults.standard.set(mojisize, forKey: "mojisize")
        
        }
        
        mojiTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.bounds.size.height / 10
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
