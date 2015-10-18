//
//  ViewController.swift
//  FriendBookPlus
//
//  Created by Ahmed Hawas on 2015-10-17.
//  Copyright © 2015 Ahmed Hawas. All rights reserved.
//

import UIKit

class FriendListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var friends = [Friend]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        createFriends()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func createFriends() {
        let elaine = Friend()
        elaine.name = "Elaine"
        elaine.phoneNumber = "416-999-9929"
        elaine.birthday = "22-12-1980"
        elaine.picture = UIImage(named: "elaine")!
        self.friends.append(elaine)
        
        let george = Friend()
        george.name = "george"
        george.phoneNumber = "416-8888-9929"
        george.birthday = "22-12-1970"
        george.picture = UIImage(named: "george")!
        self.friends.append(george)
        
        let kramer = Friend()
        kramer.name = "Kramer"
        kramer.phoneNumber = "219-8888-9982"
        kramer.birthday = "11-11-1970"
        kramer.picture = UIImage(named: "Kramer")!
        self.friends.append(kramer)
        
        let jerry = Friend()
        jerry.name = "Jerry"
        jerry.phoneNumber = "1800-8888-9909"
        jerry.birthday = "22-12-1960"
        jerry.picture = UIImage(named: "jerry")!
        self.friends.append(jerry)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friends.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let friend = self.friends[indexPath.row]
        cell.textLabel!.text = friend.name
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let friend = self.friends[indexPath.row]
        self.performSegueWithIdentifier("detailSegue", sender: friend)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let detailViewController = segue.destinationViewController as! FriendDetailViewController
        detailViewController.friend = sender as! Friend
    }
}

