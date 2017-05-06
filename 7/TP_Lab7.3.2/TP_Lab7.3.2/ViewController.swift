//
//  ViewController.swift
//  TP_Lab7.3.2
//
//  Created by Daniel Muraveyko on 21/04/2017.
//  Copyright © 2017 Daniel Muraveyko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = UIColor.blue
        // Do any additional setup after loading the view, typically from a nib.
        let imageSize = CGSize(width: 200, height: 200)
        let imageView = UIImageView(frame: CGRect(origin: CGPoint(x: 100, y: 100), size: imageSize))
        self.view.addSubview(imageView)
        let image = drawCustomImage(size: imageSize)
        imageView.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func draw(_ rect: CGRect)
    {
        let context = UIGraphicsGetCurrentContext()
        let myShadowOffset = CGSize (width: -10,  height: 15)
        
        context?.saveGState()
        context?.setShadow (offset: myShadowOffset, blur: 5)
        context?.setLineWidth(4.0)
        context?.setStrokeColor(UIColor.blue.cgColor)
        let rectangle = CGRect(x: 60,y: 170,width: 200,height: 80)
        context?.addEllipse(in: rectangle)
        context?.strokePath()
        context?.restoreGState()
    }

    
    func drawCustomImage(size: CGSize) -> UIImage {
        // Setup our context
        let bounds = CGRect(origin: CGPoint.zero, size: size)
       
        let opaque = false
        let scale: CGFloat = 0
        UIGraphicsBeginImageContextWithOptions(size, opaque, scale)
        let context = UIGraphicsGetCurrentContext()
        context!.setStrokeColor(UIColor.red.cgColor)
         draw(bounds)
        //context!.setLineWidth(2.0)
        
//        context?.setLineWidth(8.0)
//        context?.setStrokeColor(UIColor.blue.cgColor)
//        let rectangle = CGRect(x: 60,y: 170,width: 200,height: 80)
//        context?.addRect(rectangle)
//        context?.strokePath()
//        context?.setFillColor(UIColor.red.cgColor)
//        context?.fill(rectangle)
        
       // context!.stroke(bounds)
//        let gradient: CAGradientLayer = CAGradientLayer()
//        gradient.colors = [UIColor.blue.cgColor, UIColor.red.cgColor]
//        gradient.locations = [0.0 , 1.0]
//        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
//        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
//        gradient.frame = bounds

//        //context!.fill(bounds)
//        context!.beginPath()
//        
//        context!.move(to: CGPoint(x: bounds.minX, y: bounds.minY))
//        context!.addLine(to: CGPoint(x: bounds.minX, y: bounds.maxY))
//       
//        context!.move(to: CGPoint(x: bounds.maxX, y: bounds.maxY))
//        context!.addLine(to: CGPoint(x: bounds.minX, y: bounds.maxY))
//        context!.strokePath()
        
        // Drawing complete, retrieve the finished image and cleanup
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
}

