//
//  SentMemeTableViewController.swift
//  MemeMeTwo
//
//  Created by Peter Mäder on 08.03.16.
//  Copyright © 2016 Peter Mäder. All rights reserved.
//

import UIKit

class SentMemeTableViewController: UITableViewController {
    
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
        self.navigationItem.title = "Sent Memes Table View"
        self.navigationItem.setRightBarButtonItem(rightBarButtonToAddMeme, animated: true)
        
        //Reload Table Data to reflect all Memes
        self.tableView.reloadData()
    }
    
    func addNewMeme(){
        let newMemeController = self.storyboard?.instantiateViewControllerWithIdentifier("MemeEditorViewController") as! MemeEditorViewController
        
        self.navigationController!.pushViewController(newMemeController, animated: true)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MemeTableViewCell")!
        cell.imageView?.image = memes[indexPath.row].memeImage
        cell.textLabel?.text = memes[indexPath.row].topText + " ... " + memes[indexPath.row].bottomText

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let memeDetailViewController = self.storyboard?.instantiateViewControllerWithIdentifier("MemeDetailViewController") as! MemeDetailViewController
        
        memeDetailViewController.meme = memes[indexPath.row]
        self.navigationController?.pushViewController(memeDetailViewController, animated: true)
    }
    
    //MARK: Implemented Delete Row functionality
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {

        if editingStyle == UITableViewCellEditingStyle.Delete {
            print("Delete pressed")
            
            (UIApplication.sharedApplication().delegate as! AppDelegate).memes.removeAtIndex(indexPath.row)
            
            tableView.reloadData()
        }
        
    }
    
}