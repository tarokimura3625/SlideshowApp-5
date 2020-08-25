//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 木村太郎 on 2020/08/09.
//  Copyright © 2020 taro.kimura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nextImage: UIButton!
    @IBOutlet weak var backImage: UIButton!
    @IBOutlet weak var toResultView: UIButton!
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
         }
    
    var imageIndex = 0
    
    var timer: Timer!
    
    var timer_sec:Int = 0
    
    var Image :UIImage!
    
    let images = [UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func backImage(_ sender: Any) {
        if imageIndex == 0 {
            imageIndex = 2
        } else {
            imageIndex -= 1
        }
        
        imageView.image = images[imageIndex]
        
    }
    
    @IBAction func nextImage(_ sender: Any) {
        if imageIndex  < 1 {
            imageIndex += 1
        } else if imageIndex < 2 {
            imageIndex += 1
        } else if imageIndex < 3 {
            imageIndex -= 2
        }
        
        imageView.image = images[imageIndex]
    }
    
    @IBOutlet weak var startStop: UIButton!
    
    
    @IBAction func startStop(_ sender: Any) {
        if self.timer != nil {
            
            backImage.setTitleColor(UIColor.darkGray, for: .normal)
            backImage.setTitleColor(UIColor.darkGray, for: .normal)
            
            startStop.setTitle("start", for: UIControl.State.normal)
            self.timer.invalidate()
            self.timer = nil
            
            self.backImage.isEnabled = true   //戻るボタンタップ可
            self.nextImage.isEnabled = true  //次へボタンタップ可
            
        } else {
           
            
            startStop.setTitle("Stop", for: UIControl.State.normal)
            
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(nextImage(_:)), userInfo: nil, repeats: true)
            
            
            
            backImage.isEnabled = false    //戻るボタンタップ不可
            backImage.setTitleColor(UIColor.lightGray, for: .normal)
            nextImage.isEnabled = false    //次へボタンタップ不可
            nextImage.setTitleColor(UIColor.lightGray, for: .normal)
       
       
            }
    }
        
    
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any!){
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        
        if self.timer != nil {
        self.timer.invalidate()   // タイマーを停止する
        self.timer = nil
            
        resultViewController.picture = imageIndex
            
        }
    }
}


