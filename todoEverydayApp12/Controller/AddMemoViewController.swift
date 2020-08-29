//
//  AddMemoViewController.swift
//  OriginalTodoApp
//
//  Created by 深谷祐斗 on 2020/07/25.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import UIKit

class AddMemoViewController: UIViewController {

    
    @IBOutlet weak var memoTextFiled: UITextView!
    
    var shareText:String = ""
    let ud = UserDefaults.standard
    var saveMemoArray:[String] = []
    var mojisize:Int = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.object(forKey: "mojisize2") != nil{
            mojisize = UserDefaults.standard.object(forKey: "mojisize2") as! Int
        }
        
        switch mojisize {
        case 0: memoTextFiled.font = UIFont.systemFont(ofSize: 30.0)
        case 1: memoTextFiled.font = UIFont.systemFont(ofSize: 25.0)
        case 2: memoTextFiled.font = UIFont.systemFont(ofSize: 20.0)
        case 3: memoTextFiled.font = UIFont.systemFont(ofSize: 15.0)
        case 4: memoTextFiled.font = UIFont.systemFont(ofSize: 10.0)
        default: memoTextFiled.font = UIFont.systemFont(ofSize: 20.0)
            
        }

        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    @IBAction func addMemo(_ sender: Any) {
    
        
        if memoTextFiled.text != ""{
            
             showAlert(title: "保存しますか？")
           
        }else{

           let alert2Controller = UIAlertController(title:"何も書いてありません" ,
                                                          message: nil,
                                                          preferredStyle: .alert)
            alert2Controller.addAction(UIAlertAction(title: "OK",
                                                     style: .default,
                                                     handler: nil))
            present(alert2Controller, animated: true)
                    
        
       }
    }
//        let inputText = memoTextFiled.text
//        if ud.array(forKey: "memoArray") != nil{
//            var saveMemoArray = ud.array(forKey: "memoArray") as! [String]
//            if inputText != ""{
//                saveMemoArray.append(inputText!)
//                ud.set(saveMemoArray, forKey: "memoArray")
//            }else{
//                showAlert(title: "何も入力されていません")
//            }
//
//        }else{
//            //最初、何も書かれていない場合
//            var newMemoArray = [String]()
//            //nilを強制アンラップはエラーが出るから
//            if inputText != ""{
//                //inputtextはoptional型だから強制アンラップ
//                newMemoArray.append(inputText!)
//                ud.set(newMemoArray, forKey: "memoArray")
//            }else{
//                showAlert(title: "何も入力されていません")
//            }
//        }
//        showAlert(title: "保存完了")
        
       
    
    
    @IBAction func share(_ sender: Any) {
           
           textGet()
           
           let items = [shareText] as [Any]
           
           let activtyVC = UIActivityViewController(activityItems: items, applicationActivities: nil)
           
           present(activtyVC,animated: true,completion: nil)
           print(items)
           
       }
       
       func textGet(){
           
           shareText = memoTextFiled.text
           
       }
       
    


    func showAlert(title:String){
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)

        let okAction: UIAlertAction = UIAlertAction(title: "OK",style: UIAlertAction.Style.default,handler:{(action:UIAlertAction!) -> Void in
           
            let inputText = self.memoTextFiled.text
            self.saveMemoArray.append(inputText!)
            self.ud.set(self.saveMemoArray, forKey: "memoArray")
            self.navigationController?.popViewController(animated: true)
               })

       let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル",style: UIAlertAction.Style.cancel,handler:nil)
       alert.addAction(okAction)
       alert.addAction(cancelAction)
        self.present(alert, animated: true, completion:nil)
     
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
