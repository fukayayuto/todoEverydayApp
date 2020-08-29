//
//  InputViewController.swift
//  todoEverydayApp12
//
//  Created by 深谷祐斗 on 2020/08/21.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import UIKit

class TodoInputView: UIView{
    
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
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            self.setFromXib()
            
            plusButton.layer.cornerRadius = 15
            deliteButton.layer.cornerRadius = 10
        }

        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            self.setFromXib()
        }

        func setFromXib() {
            let nib = UINib.init(nibName: "TodoInputView", bundle: nil)
            let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
            self.addSubview(view)
        }
    }

