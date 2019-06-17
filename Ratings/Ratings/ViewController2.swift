//
//  ViewController.swift
//  Ratings
//
//  Created by kpugame on 2019. 3. 28..
//  Copyright © 2019년 kpugame. All rights reserved.
//

import UIKit

class ViewController2: UIViewController, UIScrollViewDelegate {
    @IBOutlet var scrollView : UIScrollView!
    var imageView : UIImageView!
    
//    let doubleTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController2,scrollViewDoubleTapped(_:));)
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage(named: "photo1.png")!
        imageView = UIImageView(image: image)
        imageView.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: image.size)
        scrollView.addSubview(imageView)
        
        scrollView.contentSize=image.size
        
        let doubleTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController2.scrollViewDoubleTapped(_:)))
        doubleTapRecognizer.numberOfTapsRequired = 2
        doubleTapRecognizer.numberOfTouchesRequired = 1
        scrollView.addGestureRecognizer(doubleTapRecognizer)
        
        let scrollViewFrame = scrollView.frame
        let scaleWidth = scrollViewFrame.size.width/scrollView.contentSize.width
        let scaleHeight = scrollViewFrame.size.height/scrollView.contentSize.height
        let minScale = min(scaleWidth,scaleHeight)
        scrollView.minimumZoomScale=minScale
        
        scrollView.maximumZoomScale = 1.0
        scrollView.zoomScale = minScale
        
        centerScrollViewContents()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func centerScrollViewContents(){
        let boundsSize = scrollView.bounds.size
        var contentsFrame = imageView.frame
        
        if contentsFrame.size.width < boundsSize.width{
            contentsFrame.origin.x = (boundsSize.width-contentsFrame.size.width) / 2.0
        }
        else{
            contentsFrame.origin.x = 0.0
        }
        
        if contentsFrame.size.height < boundsSize.height{
            contentsFrame.origin.y = (boundsSize.height-contentsFrame.size.height) / 2.0
        }
        else{
            contentsFrame.origin.y = 0.0
        }
        imageView.frame=contentsFrame
    }
    
    @objc func scrollViewDoubleTapped(_ recognizer: UITapGestureRecognizer){
        let pointInView = recognizer.location(in: imageView)
        
        var newZoomScale = scrollView.zoomScale * 1.5
        newZoomScale = min(newZoomScale, scrollView.maximumZoomScale)
        
        let scrollViewSize = scrollView.bounds.size
        let w = scrollViewSize.width / newZoomScale
        let h = scrollViewSize.height / newZoomScale
        let x = pointInView.x - (w/2.0)
        let y = pointInView.y - (h/2.0)
        
        let rectToZoomTo = CGRect(x: x, y: y, width: w, height: h)
        
        scrollView.zoom(to: rectToZoomTo, animated: true)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        
    }
    
}

