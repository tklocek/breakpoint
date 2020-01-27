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
    var usersDetail = [String: UserDetails]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DataService.instance.getAllFeedMessages { (returnedMessagesArray) in
            var idsArray = [String]()
            self.usersDetail.removeAll()
            self.messageArray = returnedMessagesArray.reversed()
            self.tableView.reloadData()
            
            
            if self.messageArray.count > 0 {
              for id in 0...(self.messageArray.count - 1) {
                  if !(idsArray.contains(self.messageArray[id].senderId)) {
                      idsArray.append(self.messageArray[id].senderId)
                    }
                }
                
            }
         
            for index in 0...(idsArray.count - 1) {
                DataService.instance.getUserProfile(fromUID: idsArray[index]) { (userDetailDict) in
                    self.usersDetail[idsArray[index]] = userDetailDict
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
        
        DataService.instance.getUserName(forUID: message.senderId) { (returnedUsername) in
        
            if message.senderId == Auth.auth().currentUser?.uid {
                if let imageData = UserDefaults.standard.object(forKey: "profileImage") as? Data {
                    image = UIImage(data: imageData)
                }
            } else if let urlString = self.usersDetail[message.senderId]?.imageURL {
                if urlString != "" {
                    let url = URL(string: urlString)!
                    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in

                        if error != nil {
                            print("error:")
                            print(error)
                            return
                        }

                                DispatchQueue.main.async(execute: {
                                image = UIImage(data: data!)!
                                cell.imageView?.image = image
                        print(url)
                                })
                    }
                    task.resume()
                }
            }
            
        
            cell.configureCell(profileImage: image!, email: returnedUsername, content: message.content)
        }
        
        return cell
    }
    
}
