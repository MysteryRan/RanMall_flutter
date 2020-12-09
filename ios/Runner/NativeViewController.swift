//
//  NativeViewController.swift
//  Runner
//
//  Created by zouran on 2020/12/9.
//

import UIKit

class NativeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        
        let tips = UILabel()
        tips.text = "这是原生界面"
        tips.frame = CGRect(x: 100, y: 100, width: 300, height: 100)
        self.view.addSubview(tips)
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
