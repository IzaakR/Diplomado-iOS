//
//  ViewController.swift
//  ISpy
//
//  Created by Isaac on 8/31/18.
//  Copyright © 2018 Mudpie. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var imageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    scrollView.delegate = self
    updateZoomFor(size: view.frame.size)
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func viewForZooming(in scrollView: UIScrollView) -> UIView? {
    return imageView
  }
  
  
  func updateZoomFor(size: CGSize){
    let widthScale = size.width / imageView.bounds.width
    let heightScale = size.height / imageView.bounds.height
    let scale = min(widthScale, heightScale)
    scrollView.maximumZoomScale = max(size.width, size.height)
    scrollView.minimumZoomScale = scale
  }
  
}

