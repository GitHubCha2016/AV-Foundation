//
//  RootTableViewController.swift
//  AV-Foundation
//
//  Created by ZXL on 2018/2/12.
//  Copyright © 2018年 ZXL. All rights reserved.
//

import UIKit

class RootTableViewController: UITableViewController {

    let titleArray:[String] =
        ["AVSpeechSynthesizer",
         "音频播放"]
    let viewControllerArray:[UIViewController] =
        [SpeechViewController(),
         AudioListsViewController()]
    let cellId = "cellId"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if #available(iOS 11.0, *) {
//            self.tableView.contentInsetAdjustmentBehavior = .never
//        } else {
//            self.automaticallyAdjustsScrollViewInsets = false
//        }

        self.navigationItem.title = "AV-Foundation"
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier:cellId )
        self.tableView.rowHeight = HEIGHT(48)
        self.tableView.sectionHeaderHeight = HEIGHT(8.0)
        self.tableView.sectionFooterHeight = HEIGHT(1.0)
        //self.tableView.frame = CGRect(x: 0, y: kNavBarH, width: kScreenWidth, height: kScreenHeight-kNavBarH)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)

        cell.accessoryType = .disclosureIndicator
        let title = titleArray[indexPath.row]
        cell.textLabel?.text = title

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc:UIViewController = self.viewControllerArray[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
