//
//  TimePicker.swift
//  OriginalTodoApp
//
//  Created by 深谷祐斗 on 2020/07/19.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import Foundation
import UIKit

//protocol NotificationDelegate{
//    func loadOK()
//}

class TimePickerKeyboard: UITextField{
   
    private var datePicker: UIDatePicker!
 

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commoninit()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        commoninit()
    }
    
    private func commoninit() {
        // datePickerの設定
        datePicker = UIDatePicker()
//        datePicker.date = time()
        datePicker.datePickerMode = UIDatePicker.Mode.time
        datePicker.locale = Locale(identifier: "ja")
        datePicker.addTarget(self, action: #selector(setText), for: .valueChanged)
        datePicker.minuteInterval = 60
        // textFieldのtextに日付を表示する
        setText()

        inputView = datePicker
        inputAccessoryView = createToolbar()
    }

    // キーボードのアクセサリービューを作成する
    private func createToolbar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 44)

        let space = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: self, action: nil)
        space.width = 12
        let flexSpaceItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let NowButtonItem = UIBarButtonItem(title: "現在", style: .done, target: self, action: #selector(nowTimePicker))
        let doneButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePicker))

        let toolbarItems = [flexSpaceItem,NowButtonItem, doneButtonItem, space]

        toolbar.setItems(toolbarItems, animated: true)

        return toolbar
    }

    // キーボードの完了ボタンタップ時に呼ばれる
    @objc private func donePicker() {
        resignFirstResponder()
        let notificationVC = NotificationViewController()
        notificationVC.load()
    }
   
    @objc private func nowTimePicker() {
        datePicker.date = Date()
        setText()
    }

    //追加20200701
    @objc private func setText(){
        let f = DateFormatter()
        f.timeStyle = .short
        f.dateFormat = "HH:mm"
        text = f.string(from: datePicker.date)
    }
    // datePickerの日付けをtextFieldのtextに反映させる

    // クラス外から日付を取り出すためのメソッド
    func getDate() -> Date {
        return datePicker.date
    }

    // コピペ等禁止
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return false
    }
    // カーソル非表示
    override func caretRect(for position: UITextPosition) -> CGRect {
        return CGRect(x: 0, y: 0, width: 0, height: 0)
    }

    
}

