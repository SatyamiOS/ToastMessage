//
//  ViewController.swift
//  ToastView
//
//  Created by Satyam Kumar on 30/01/19.
//  Copyright © 2019 Satyam Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func btnShowtoast(_ sender : Any){
        showToast(message:"Message Successfully Show!!!")
    }

}

extension  UIViewController {
    
    func showToast(message : String){
        
        guard let window = UIApplication.shared.keyWindow else {
            return
        }
        
        let toastLabel = UILabel()
        toastLabel.text = message
        toastLabel.textAlignment = .center
        toastLabel.font = UIFont.systemFont(ofSize: 18)
        toastLabel.textColor = UIColor.white
        toastLabel.backgroundColor = UIColor.gray
        toastLabel.numberOfLines = 0
        
        let textSize = toastLabel.intrinsicContentSize
        let labelWidth = min(textSize.width, window.frame.width - 20)
        
        toastLabel.frame = CGRect(x: 20, y: window.frame.height - 90, width: labelWidth + 30, height: textSize.height+20)
        toastLabel.center.x = window.center.x
        toastLabel.layer.cornerRadius =  15
        toastLabel.layer.masksToBounds = true
        
        window.addSubview(toastLabel)
        UIView.animate(withDuration: 3.0, animations: {
            toastLabel.alpha = 0
            
        }){ (_)in
            toastLabel.removeFromSuperview()
        }
        
    }
    
}

