//
//  InputViewController.swift
//  todoEverydayApp12
//
//  Created by 深谷祐斗 on 2020/08/21.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import UIKit

class InputView: UIView{
    
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
    
    
     override init(frame: CGRect) {
        super.init(frame: frame)
        
        nibInit()
        setupView()
        autoresizingMask = .flexibleHeight
    }
    
    private func setupView(){
        
    }
    
    override var intrinsicContentSize: CGSize{
        
        return .zero
    }
    
    private func nibInit(){
        
        let nib = UINib(nibName: "InputView", bundle: nil)
        guard let view = nib.instantiate(withOwner: self, options:nil).first as? UIView else {return}
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        self.addSubview(view)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension InputView:UITextViewDelegate{
     
   

}



