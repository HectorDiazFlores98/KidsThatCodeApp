//
//  CampInfoViewController.swift
//  KidsThatCode
//
//  Created by Hector Diaz on 7/8/18.
//  Copyright © 2018 KidsThatCode. All rights reserved.
//

import UIKit
import Firebase

class CampInfoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var scheduleTable: UITableView!
    
    var scheduleRef: DatabaseReference!
    var scheduleArray: [String] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scheduleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        
        let scheduleCell = scheduleArray[indexPath.row]
        print(scheduleCell)
        cell.textLabel?.text = scheduleCell
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        scheduleRef = Database.database().reference().child("Schedule").child("Camp")
        scheduleRef.observe(DataEventType.value) { (snapshot) in
            let snapshotValue = snapshot.value as? NSDictionary
            let activity1 = snapshotValue!["Activity1"] as? String
            self.scheduleArray.append(activity1!)
            let activity2 = snapshotValue!["Activity2"] as? String
            self.scheduleArray.append(activity2!)
            let activity3 = snapshotValue!["Activity3"] as? String
            self.scheduleArray.append(activity3!)
            let activity4 = snapshotValue!["Activity4"] as? String
            self.scheduleArray.append(activity4!)
            let activity5 = snapshotValue!["Activity5"] as? String
            self.scheduleArray.append(activity5!)
            let activity6 = snapshotValue!["Activity6"] as? String
            self.scheduleArray.append(activity6!)
            let activity7 = snapshotValue!["Activity7"] as? String
            self.scheduleArray.append(activity7!)
            let activity8 = snapshotValue!["Activity8"] as? String
            self.scheduleArray.append(activity8!)
            
            
        }
        self.scheduleTable.reloadData()
        // Do any additional setup after loading the view.
    }

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
