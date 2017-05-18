//
//  BookViewController.swift
//  Lab8.4
//
//  Created by Daniel Muraveyko on 16/05/2017.
//  Copyright © 2017 Daniel Muraveyko. All rights reserved.
//

import UIKit

class BookViewController: UIViewController {

    @IBOutlet weak var authorView: UILabel!
    @IBOutlet weak var descripView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    var image:UIImage? = nil
    var author:String? = nil
    var descrip: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
        authorView.text = author
        descripView.text = descrip
    }
    
//    func initial(item: NSDictionary) {
//
//        title = item.value(forKey:"title") as? String
//     //   let imageName = item.object(forKey:"image") as! String
//        
//        //print(imageName)
////        if let image = UIImage(named: imageName) {
////            imageView.image = image
////        }
//        //image.image = UIImage(named: imageName)
//     //  author.text = item.value(forKey:"author") as? String
//     //   descriprion.text = item.value(forKey: "about") as? String
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
