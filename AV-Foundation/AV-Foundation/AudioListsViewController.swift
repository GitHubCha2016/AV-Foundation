//
//  AudioListsViewController.swift
//  AV-Foundation
//
//  Created by ZXL on 2018/2/24.
//  Copyright © 2018年 ZXL. All rights reserved.
//

import UIKit
import KDEAudioPlayer

class AudioListsViewController: UITableViewController {
    
    lazy var dataSource = { () -> [String] in
        let sources = Bundle.paths(forResourcesOfType: "mp3", inDirectory: Bundle.main.resourcePath!)
        return sources
    }()
    var player = AudioPlayer()
    
    deinit {
        print("\(self) 销毁了")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "音频播放"
        self.clearsSelectionOnViewWillAppear = false
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "mp3Cell")
        self.tableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        player.stop()
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
        return self.dataSource.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mp3Cell", for: indexPath)

        if dataSource.count > indexPath.row {
            let path = dataSource[indexPath.row]
            let url:URL = URL(fileURLWithPath: path)
            cell.textLabel?.text = url.lastPathComponent
        }
        
        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if dataSource.count > indexPath.row {
            //print(dataSource[indexPath.row])
            self.play(path: dataSource[indexPath.row])
        }
    }
}

extension AudioListsViewController {
    func play(path:String) {
        let url = URL(fileURLWithPath: path)
        player.delegate = self
        let item = AudioItem(mediumQualitySoundURL: url)
        player.play(item: item!)
    }
}

extension AudioListsViewController : AudioPlayerDelegate {
    // AudioPlayer’s state changes
    func audioPlayer(_ audioPlayer: AudioPlayer, didChangeStateFrom from: AudioPlayerState, to state: AudioPlayerState) {
        print("状态：\(from) -> 状态：\(state)")
    }
    // This method is called regularly to notify progression update
    func audioPlayer(_ audioPlayer: AudioPlayer, didUpdateProgressionTo time: TimeInterval, percentageRead: Float) {
        print("进度 \(time) \(percentageRead)")
    }
    // Control Center / Lockscreen
    override func remoteControlReceived(with event: UIEvent?) {
        if let event = event {
            player.remoteControlReceived(with: event)
        }
    }
}


