//
//  MemeDetailViewController.swift
//  MemeMeTwo
//
//  Created by Peter Mäder on 09.03.16.
//  Copyright © 2016 Peter Mäder. All rights reserved.
//

import UIKit

class MemeDetailViewController : UIViewController {
    
    var meme : Meme!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //hide Tabbar
        self.tabBarController?.tabBar.hidden = true
        
        //add "Edit" button for to Edit a stored Memes
        let rightBarButtonToAddMeme = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Edit, target: self, action: "editMeme")
        self.navigationItem.setRightBarButtonItem(rightBarButtonToAddMeme, animated: true)
        
        imageView.image = meme.memeImage
    }
    
    func editMeme(){
        let editMemeController = self.storyboard?.instantiateViewControllerWithIdentifier("MemeEditorViewController") as! MemeEditorViewController
        
        editMemeController.originalImage = meme.originalImage
        self.navigationController!.pushViewController(editMemeController, animated: true)

    }
}
