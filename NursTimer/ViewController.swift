//
//  ViewController.swift
//  NursTimer
//
//  Created by Нурсат Шохатбек on 23.12.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var LabelText: UILabel!
    
    @IBOutlet weak var ImageView: UIImageView!
    var news = News()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        LabelText.text = news.info
        ImageView.image = UIImage(named: news.picture)
        
      
    }
 
}

