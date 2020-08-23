//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 木村太郎 on 2020/08/19.
//  Copyright © 2020 taro.kimura. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
   
    var picture:Int = 0
        
        override func viewDidLoad() {
        if (picture == 0) {
          imageView.image = UIImage(named: "1")
        } else if (picture == 1) {
          imageView.image = UIImage(named: "2")
        } else if (picture == 2) {
          imageView.image = UIImage(named: "3")
        }
        
    }    // Do any additional setup after loading the view.
}


    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



