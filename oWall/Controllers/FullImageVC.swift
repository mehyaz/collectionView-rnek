//
//  FullImageVC.swift
//  oWall
//
//  Created by Mehmet Yazık on 8.10.2018.
//  Copyright © 2018 Mehmet Yazık. All rights reserved.
//

import UIKit

class FullImageVC: UIViewController, UIScrollViewDelegate {

    var fullImage = UIImage(named: "1")
    
    @IBOutlet weak var fullImageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.delegate = self
        fullImageView.image = fullImage
        scrollView.minimumZoomScale = 1
        scrollView.maximumZoomScale = 4
        scrollView.contentSize = fullImageView.frame.size
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return fullImageView
    }
    
    

}
