//
//  ViewController.swift
//  Lab8.4
//
//  Created by Daniel Muraveyko on 16/05/2017.
//  Copyright © 2017 Daniel Muraveyko. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var collectionView: UICollectionView!

    var items = NSMutableDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.items = loadPlist()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadPlist()->NSMutableDictionary{
        let path = Bundle.main.path(forResource: "Library", ofType: "plist")
        return NSMutableDictionary(contentsOf: URL.init(fileURLWithPath: path!))!
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collection_cell", for: indexPath) as! DMCollectionViewCell
        let item = items.value(forKey: String(indexPath.row + 1)) as! NSDictionary
        cell.image.image = UIImage(named: item.value(forKey: "image") as! String)
        cell.author_and_title.text = item.value(forKey:"title") as? String
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "BookViewController") as! BookViewController
        self.navigationController?.pushViewController(controller, animated: true)
        let item = items.value(forKey: String(indexPath.row + 1)) as! NSDictionary
        controller.title = item.value(forKey:"title") as? String
        controller.image = UIImage(named: item.value(forKey: "image") as! String)
        controller.author = item.value(forKey:"author") as? String
        controller.descrip = item.value(forKey:"about") as? String
    }
}
