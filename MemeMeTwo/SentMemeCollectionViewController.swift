//
//  SentMemeCollectionViewController.swift
//  MemeMeTwo
//
//  Created by Peter Mäder on 08.03.16.
//  Copyright © 2016 Peter Mäder. All rights reserved.
//

import UIKit

class SentMemeCollectionViewController: UICollectionViewController{
    
    var memes: [Meme] {
        return (UIApplication.sharedApplication().delegate as! AppDelegate).memes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //make Tabbar visible in case it got hidden
        self.tabBarController?.tabBar.hidden = false
        
        //add + sign for new Memes
        let rightBarButtonToAddMeme = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "addNewMeme")
        self.navigationItem.title = "Sent Memes Collection View"
        self.navigationItem.setRightBarButtonItem(rightBarButtonToAddMeme, animated: true)
        
        //Reload Table Data to reflect all Memes
        self.collectionView?.reloadData()
    }
    
    func addNewMeme(){
        let newMemeController = self.storyboard?.instantiateViewControllerWithIdentifier("MemeEditorViewController") as! MemeEditorViewController
        
        self.navigationController!.pushViewController(newMemeController, animated: true)
    }
    
    // MARK: Collection View Data Source
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("SentMemeCollectionCell", forIndexPath: indexPath) as! MemeCollectionViewCell
        
        cell.imageView?.image = memes[indexPath.row].memeImage
        
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let memeDetailViewController = self.storyboard?.instantiateViewControllerWithIdentifier("MemeDetailViewController") as! MemeDetailViewController
        
        memeDetailViewController.meme = memes[indexPath.row]
        self.navigationController?.pushViewController(memeDetailViewController, animated: true)
    }
}
