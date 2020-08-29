//
//  MemoViewController.swift
//  OriginalTodoApp
//
//  Created by 深谷祐斗 on 2020/07/25.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
    @IBOutlet weak var memoTabelView: UITableView!
    
    let ud = UserDefaults.standard
    var mojisize:Int = 2
    
    var memoArray:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        memoTabelView.delegate = self
        memoTabelView.dataSource = self
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoArray.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "memoCell")
        cell.textLabel?.text = memoArray[indexPath.row]
      
                   
                   if UserDefaults.standard.object(forKey: "mojisize2") != nil{
                       mojisize = UserDefaults.standard.object(forKey: "mojisize2") as! Int
                   }
                   
                   switch mojisize {
                   case 0:
                    cell.textLabel?.font = UIFont.systemFont(ofSize: 30.0)
                   case 1:
                    cell.textLabel?.font = UIFont.systemFont(ofSize: 25.0)
                   case 2:
                    cell.textLabel?.font = UIFont.systemFont(ofSize: 20.0)
                   case 3:
                    cell.textLabel?.font = UIFont.systemFont(ofSize: 15.0)
                   case 4:
                     cell.textLabel?.font = UIFont.systemFont(ofSize: 10.0)
                   default:
                    cell.textLabel?.font = UIFont.systemFont(ofSize: 20.0)
                 
                   }
        return cell
      }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detail", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadMemo()
    }

    func loadMemo(){
           if ud.array(forKey: "memoArray") != nil{
               memoArray = ud.array(forKey: "memoArray") as![String]
               memoTabelView.reloadData()
           }
       }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail"{
            let detailVC = segue.destination as! DetailViewController
            let selectedIndexPath = memoTabelView.indexPathForSelectedRow!
            detailVC.memoText = memoArray[selectedIndexPath.row]
            detailVC.selectedRow = selectedIndexPath.row
            memoArray.remove(at: selectedIndexPath.row)
            detailVC.saveMemoArray = memoArray
            
        }else if segue.identifier == "add"{
            let addVC = segue.destination as! AddMemoViewController
            addVC.saveMemoArray = memoArray
            
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

            if editingStyle == .delete {
                memoArray.remove(at: indexPath.row)
                ud.set(memoArray, forKey: "memoArray")
                tableView.reloadData()
            }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if UserDefaults.standard.object(forKey: "mojisize2") != nil{
            mojisize = UserDefaults.standard.object(forKey: "mojisize2") as! Int
        }
        switch mojisize {
        case 0:
            return view.bounds.size.height / 10
        case 1:
            return view.bounds.size.height / 13
        case 2:
            return view.bounds.size.height / 16
        case 3:
            return view.bounds.size.height / 19
        case 4:
            return view.bounds.size.height / 22
        default:
            return view.bounds.size.height / 16
        }
        
    }
    
    
    @IBAction func addMemo(_ sender: Any) {
        performSegue(withIdentifier: "add", sender: nil)
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


