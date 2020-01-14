//
//  FirstViewController.swift
//  breakpoint
//
//  Created by Tomek Klocek on 2019-12-17.
//  Copyright © 2019 Tomek Klocek. All rights reserved.
//

import UIKit
import Firebase

class FeedVC: UIViewController {

    // Outlets
    @IBOutlet weak var tableView: UITableView!
    
    var messageArray = [Message]()
    var idsArray = [String]()
    var usersDetail = [UserDetails]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataService.instance.getAllFeedMessages { (returnedMessagesArray) in
            self.messageArray = returnedMessagesArray.reversed()
            self.tableView.reloadData()
            
            if self.messageArray.count > 0 {
              for id in 0...(self.messageArray.count - 1) {
                  if !(self.idsArray.contains(self.messageArray[id].senderId)) {
                      self.idsArray.append(self.messageArray[id].senderId)
                  }
              }
                DataService.instance.getAllUserProfiles(fromUID: self.idsArray) { (userDetailsAquired) in
                    self.usersDetail = userDetailsAquired
                    
                    
                }
                    
                }
                
                
            
             }
        }

}

extension FeedVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell") as? FeedCell else {return UITableViewCell()}
        
        let message = messageArray[indexPath.row]
        var image = UIImage(named: "defaultProfileImage")
        
        if message.senderId == Auth.auth().currentUser?.uid {
            if let imageData = UserDefaults.standard.object(forKey: "profileImage") as? Data {
                image = UIImage(data: imageData)
            } else {
                image = UIImage(named: "defaultProfileImage")
            }
            
        } else if usersDetail. {
            image = UIImage(named: "defaultProfileImage")
        }
        
        
        
        DataService.instance.getUserName(forUID: message.senderId) { (returnedUsername) in
            cell.configureCell(profileImage: image!, email: returnedUsername, content: message.content)
        }
        
        return cell
    }
    
}
