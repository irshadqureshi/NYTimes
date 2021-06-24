//
//  BaseViewController.swift
//  NYTimes
//
//  Created by Irshad Qureshi on 22/06/2021.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = hexStringToUIColor(hex: "#f7f7f7")
    }
    
    public func showAlertMessage(vc: UIViewController, titleStr: String?, messageStr: String?, actionTitles:[String?], actions:[((UIAlertAction) -> Void)?]) {
        let alert = UIAlertController(title: titleStr, message: messageStr, preferredStyle: .alert)
        for (index, title) in actionTitles.enumerated() {
            let action = UIAlertAction(title: title, style: .default, handler: actions[index])
            alert.addAction(action)
        }
        vc.present(alert, animated: true, completion: nil)
    }
    
    public func showAlertMessage(vc: UIViewController, titleStr:String, messageStr:String) -> Void {
        let alert = UIAlertController(title: titleStr, message: messageStr, preferredStyle: UIAlertController.Style.alert);

        vc.present(alert, animated: true, completion: nil)
    }
    
}
