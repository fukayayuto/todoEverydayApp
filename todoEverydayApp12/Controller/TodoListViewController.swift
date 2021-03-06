//
//  TodoViewController.swift
//  OriginalTodoApp
//
//  Created by 深谷祐斗 on 2020/07/19.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import UIKit
import Lottie
import JJFloatingActionButton
import FirebaseDatabase

class TodoListViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,UIGestureRecognizerDelegate{

    
    
    @IBOutlet weak var todoTableView: UITableView!
    @IBOutlet weak var timeTextFiled: DatePickerKeyboard!
    @IBOutlet weak var todoTextField: UITextField!
    @IBOutlet weak var plusTodoView: UIView!
    
    @IBOutlet weak var deliteButton: UIButton!
    @IBOutlet weak var whiteButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var orangeButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
       
     var todoTextArray:[String] = ["長押しで消去","右上の＋ボタンよりToDo入力"]
     var todoTimeArray:[String] = ["8/2 10:00","8/2 8:00"]
     var colorNumberArray:[Int] = [0,0]
     var colorNumber:Int = 0
    
    var todoArray :[TodoData] = []
    
     var todoStringArray = [String]()
     var TimeArray = [Date]()
     var colorArray = [Int]()
    
     let actionButton = JJFloatingActionButton()
    
     let ud = UserDefaults.standard
     
     override func viewDidLoad() {
        super.viewDidLoad()
                  
        todoTableView.register(UINib(nibName: "ToDoCell", bundle: nil),forCellReuseIdentifier:"ToDoCell")
        todoTableView.delegate = self
        todoTableView.dataSource = self
        
//        plusTodoView.backgroundColor = UIColor(red: 0, green: 0.2, blue: 0.8, alpha: 0.6)
        plusTodoView.isHidden = true
        
        timeTextFiled.delegate = self
        todoTextField.delegate = self
       
        
   

        if let storedData = UserDefaults().data(forKey: "todoList") {
                   do {
                       let unarchivedData = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(storedData)
                       todoArray.append(contentsOf: unarchivedData as! [TodoData])
                   } catch {
                       print(error)
                   }
               }
        
        configureObserver()
        dataChange()

        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(cellLongPressed))
        longPressRecognizer.delegate = self
        todoTableView.addGestureRecognizer(longPressRecognizer)
     
        actionButton.buttonImage = UIImage(systemName: "line.horizontal.3")
        actionButton.buttonImageSize = CGSize(width: 50, height: 50)
        actionButton.buttonColor = .blue
        actionButton.buttonDiameter = 60
        actionButton.isHidden = false
        
        actionButton.buttonAnimationConfiguration = .transition(toImage: UIImage(systemName: "xmark")!)
        actionButton.itemAnimationConfiguration = .slideIn(withInterItemSpacing: 80)
        
        let item1 = actionButton.addItem()
        item1.titleLabel.text = "天気予報     "
        item1.imageView.image = UIImage(named: "weatherIcon")
        item1.imageSize = CGSize(width: 90, height: 90)
        item1.action = { item in
           self.performSegue(withIdentifier: "weather", sender: nil)
        }
        
        let item2 = actionButton.addItem()
        item2.titleLabel.text = "ニュース     "
        item2.imageView.image = UIImage(named: "newsIcon")
        item2.imageSize = CGSize(width: 90, height: 90)
        item2.action = { item in
            let baseviewContorller = BaseViewController()
            self.present(baseviewContorller,animated: true ,completion: nil)
        }
        
        let item3 = actionButton.addItem()
        item3.titleLabel.text = "メモ     "
        item3.imageView.image = UIImage(named: "memoIcon")
        item3.imageSize = CGSize(width: 90, height: 90)
        item3.action = { [self] item in
         self.performSegue(withIdentifier: "memo", sender: nil)
            
        }
    
        view.addSubview(actionButton)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
        
            }

    override func viewWillAppear(_ animated: Bool) {
        todoTableView.delegate = self
        todoTableView.dataSource = self
        todoTableView.reloadData()
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//          self.view.endEditing(true)
//       }
//
  
    
    func showAnimation() {
           
              let animationView = AnimationView(name: "checkAnimation")
              animationView.frame = CGRect(x: 0, y: 0, width: view.bounds.width/4, height: view.bounds.height/5)
              animationView.center = self.view.center
              animationView.contentMode = .scaleAspectFit
              animationView.animationSpeed = 0.5
              view.addSubview(animationView)
              animationView.play()
        
              DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                
                animationView.isHidden = true
                
             }
     
          }
    
    @IBAction func whiteButtonTap(_ sender: Any) {
        
        colorNumber = 0
        blueButton.layer.borderWidth = 0
        yellowButton.layer.borderWidth = 0
        orangeButton.layer.borderWidth = 0
        greenButton.layer.borderWidth = 0
        
    }
    
    
    @IBAction func blueButtonTap(_ sender: Any) {
        
        blueButton.layer.borderColor = UIColor.white.cgColor
        blueButton.layer.borderWidth = 2.0
        yellowButton.layer.borderWidth = 0
        orangeButton.layer.borderWidth = 0
        greenButton.layer.borderWidth = 0
        colorNumber = 1
        
    }
    
    @IBAction func yellowButtonTap(_ sender: Any) {
        
        yellowButton.layer.borderColor = UIColor.white.cgColor
        yellowButton.layer.borderWidth = 2.0
        blueButton.layer.borderWidth = 0
        orangeButton.layer.borderWidth = 0
        greenButton.layer.borderWidth = 0
        colorNumber = 2
    }
    
    @IBAction func orangeButtonTap(_ sender: Any) {
        
        orangeButton.layer.borderColor = UIColor.white.cgColor
        orangeButton.layer.borderWidth = 2.0
        blueButton.layer.borderWidth = 0
        yellowButton.layer.borderWidth = 0
        greenButton.layer.borderWidth = 0
        colorNumber = 3
        
    }
    
    @IBAction func greenButtonTap(_ sender: Any) {
        
        greenButton.layer.borderColor = UIColor.white.cgColor
        greenButton.layer.borderWidth = 2.0
        blueButton.layer.borderWidth = 0
        yellowButton.layer.borderWidth = 0
        orangeButton.layer.borderWidth = 0
        colorNumber = 4
    }
    
    
    
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return todoArray.count
           }
           
         func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
                 let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell") as! ToDoCell
                 let data1 : String = self.stringFromDate(date: todoArray[indexPath.row].todoDate)
                 let text1 : String = todoArray[indexPath.row].todoString
                 let colorNumber :Int = todoArray[indexPath.row].colornumber
                 print(todoArray[indexPath.row].todoString as Any)
                 cell.ToDoTextLabel.text = text1
                 cell.ToDoTimeLabel.text = data1
                 cell.selectionStyle = .none
           
            var mojisize:Int = 2
            
            if UserDefaults.standard.object(forKey: "mojisize") != nil{
                mojisize = UserDefaults.standard.object(forKey: "mojisize") as! Int
            }
            
            switch mojisize {
            case 0:
                cell.ToDoTimeLabel.font = UIFont.systemFont(ofSize: 21.0)
                cell.ToDoTextLabel.font = UIFont.systemFont(ofSize: 24.0)
                cell.ToDoImageView.frame = CGRect(x: 10, y: 24, width: 40, height: 40)
            case 1:
                cell.ToDoTimeLabel.font = UIFont.systemFont(ofSize: 18.0)
                cell.ToDoTextLabel.font = UIFont.systemFont(ofSize: 21.0)
                cell.ToDoImageView.frame = CGRect(x: 12, y: 21, width: 40, height: 40)
            case 2:
                cell.ToDoTimeLabel.font = UIFont.systemFont(ofSize: 15.0)
                cell.ToDoTextLabel.font = UIFont.systemFont(ofSize: 18.0)
                cell.ToDoImageView.frame = CGRect(x: 14, y: 19, width: 30, height: 30)
            case 3:
                cell.ToDoTimeLabel.font = UIFont.systemFont(ofSize: 12.0)
                cell.ToDoTextLabel.font = UIFont.systemFont(ofSize: 15.0)
                cell.ToDoImageView.frame = CGRect(x: 20, y: 16, width: 25, height: 25)
            case 4:
                cell.ToDoTimeLabel.font = UIFont.systemFont(ofSize: 9.0)
                cell.ToDoTextLabel.font = UIFont.systemFont(ofSize: 12.0)
                cell.ToDoImageView.frame = CGRect(x: 26, y: 13, width: 20, height: 20)
            default:
                cell.ToDoTimeLabel.font = UIFont.systemFont(ofSize: 15.0)
                cell.ToDoTextLabel.font = UIFont.systemFont(ofSize: 15.0)
                cell.ToDoImageView.frame = CGRect(x: 14, y: 19, width: 30, height: 30)
            }
            
            switch colorNumber {
            case 0:
                cell.backgroundColor = .white
            case 1:
                cell.backgroundColor = UIColor(red: 90/255, green: 255/255, blue: 255/255, alpha: 0.5)
            case 2:
                cell.backgroundColor = UIColor(red: 255/255, green: 219/255, blue: 85/255, alpha: 0.5)
            case 3:
                cell.backgroundColor = UIColor(red: 255/255, green: 149/255, blue: 225/255, alpha: 0.5)
            case 4:
                cell.backgroundColor = UIColor(red: 73/255, green: 206/255, blue: 164/255, alpha: 0.5)
            default:
                cell.backgroundColor = .white
            }
                return cell
            }
                
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           textField.resignFirstResponder()
           return true
       }
        
    
    func numberOfSections(in tableView: UITableView) -> Int {
         // #warning Incomplete implementation, return the number of sections
         return 1
     }
   
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var mojisize:Int = 2
        var cellhight:Int = 14
                   
        if UserDefaults.standard.object(forKey: "mojisize") != nil{
            mojisize = UserDefaults.standard.object(forKey: "mojisize") as! Int
        }
         
        switch mojisize {
        case 0:
            cellhight = 10
        case 1:
            cellhight = 12
        case 2:
            cellhight = 14
        case 3:
            cellhight = 16
        case 4:
            cellhight = 18
        default:
            cellhight = 14
        }
        
        return view.frame.size.height / CGFloat(cellhight)
             }
     
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       
    }
    
    func configureObserver() {

           let notification = NotificationCenter.default
        notification.addObserver(self, selector: #selector(keyboardWillShow(notification:)),name: UIResponder.keyboardWillShowNotification, object: nil)
        notification.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
       }

    
       // Notificationを削除
       func removeObserver() {

           let notification = NotificationCenter.default
           notification.removeObserver(self)
       }
    
    @objc func keyboardWillShow(notification: Notification?) {

        let rect = (notification?.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
        let duration: TimeInterval? = notification?.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double
           UIView.animate(withDuration: duration!, animations: { () in
               let transform = CGAffineTransform(translationX: 0, y: -(rect?.size.height)!)
               self.view.transform = transform

           })
       }

       // キーボードが消えたときに、画面を戻す
    @objc func keyboardWillHide(notification: Notification?) {

        let duration: TimeInterval? = notification?.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? Double
           UIView.animate(withDuration: duration!, animations: { () in

               self.view.transform = CGAffineTransform.identity
           })
    }
    
    @IBAction func plusToDo(_ sender: Any) {
        
        plusTodoView.isHidden = false
        actionButton.isHidden = true
        timeTextFiled.text = ""
        todoTextField.text = ""

        
    }
    
    
    @IBAction func ToDoInput(_ sender: Any) {
        
        if timeTextFiled.text != "" && todoTextField.text != ""{
        
        var todoText:String = ""
        var todoTime:String = ""
        todoTime = timeTextFiled.text!
        todoText = todoTextField.text!
        
        DataInput(todoText: todoText, todoTime: todoTime, colorNumberCount: colorNumber)
            
        let todoData = TodoData()
        let timeDate4 = dateFromString(string:todoTime)
        todoData.todoDate = timeDate4
        todoData.todoString = todoText
        todoData.colornumber = colorNumber
        self.todoArray.insert(todoData, at: 0)
            let userDefaults = UserDefaults.standard
                           do {
                               let archivedData: Data = try NSKeyedArchiver.archivedData(withRootObject: self.todoArray, requiringSecureCoding: false)
                               userDefaults.set(archivedData, forKey: "todoList")
                               userDefaults.synchronize()
                           } catch {
                               print(error)
                           }
        dataChange()
        todoTableView.reloadData()
            
        timeTextFiled.text = ""
        todoTextField.text = ""
        blueButton.layer.borderWidth = 0
        yellowButton.layer.borderWidth = 0
        orangeButton.layer.borderWidth = 0
        greenButton.layer.borderWidth = 0
        colorNumber = 0
        plusTodoView.isHidden = true
        actionButton.isHidden = false
        
            
        }
    }

    @IBAction func deliteTap(_ sender: Any) {
        timeTextFiled.text = ""
        todoTextField.text = ""
        plusTodoView.isHidden = true
        blueButton.layer.borderWidth = 0
        yellowButton.layer.borderWidth = 0
        orangeButton.layer.borderWidth = 0
        greenButton.layer.borderWidth = 0
        colorNumber = 0
        actionButton.isHidden = false
    }
    
    
    @objc func cellLongPressed(recognizer: UILongPressGestureRecognizer) {
        let point = recognizer.location(in: todoTableView)
        let indexPath = todoTableView.indexPathForRow(at: point)
        if indexPath == nil {

        } else if recognizer.state == UIGestureRecognizer.State.began  {
            // 長押しされた場合の処理
            showAnimation()
            todoArray.remove(at: indexPath!.row)
            dataChange()
            todoTableView.reloadData()
         }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
   func dateFromString(string: String) -> Date {
                   
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = DateFormatter.dateFormat(fromTemplate:"MM/dd H:mm", options: 0, locale: Locale(identifier: "ja_JP"))
    return formatter.date(from: string)!
               
      }
               
      func stringFromDate(date: Date) -> String {
                   
          let formatter: DateFormatter = DateFormatter()
          formatter.calendar = Calendar(identifier: .gregorian)
          formatter.dateFormat = DateFormatter.dateFormat(fromTemplate:"MM/dd H:mm", options: 0, locale: Locale(identifier: "ja_JP"))
          return formatter.string(from: date)
                  }
              
      

    func dataChange(){
       
        todoArray = todoArray.sorted(by: { (a, b) -> Bool in
            return a.todoDate < b.todoDate
                  })
       
   }
    
    func fetchData(){
        
        let fetchDataRef = Database.database().reference().child("todoData")
        
             fetchDataRef.observe(.childAdded) { (snapShot) in
       
                   let snapShopData = snapShot.value as AnyObject
                   let todoString = snapShopData.value(forKey: "todo") as! String
                   let timeString = snapShopData.value(forKey: "time") as! String
                   let colorNumberCount = snapShopData.value(forKey: "colorCount") as! Int
                
                   let todoData = TodoData()
                   let timeDate = self.dateFromString(string: timeString)
                   todoData.todoDate = timeDate
                   todoData.todoString = todoString
                   todoData.colornumber = colorNumberCount
                   self.todoArray.append(todoData)
                   self.todoTableView.reloadData()
         }
    }
    
    
    
    func DataInput(todoText:String,todoTime:String,colorNumberCount:Int){
        
        let docData = [
            "todo":todoText,
            "time":todoTime,
            "colorCount":colorNumberCount
            ] as [String:Any]
        
        let todoDB = Database.database().reference().child("todoData")
        
        todoDB.childByAutoId().setValue(docData) { (error, result) in
        
             if error != nil{
                print("情報の取得に失敗しました。\(error)")
                return
            }
            print("情報の取得に成功しました")
            
        }
        
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

