//
//  MZCategoryViewController.swift
//  MZMusicPlayer
//
//  Created by 孟令宗 on 2020/8/9.
//  Copyright © 2020 孟令宗. All rights reserved.
//

import UIKit

class MZCategoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "乐库"
        view.backgroundColor = .white
        view.addSubview(collectView)
        collectView.reloadData()
    }
    
    lazy var collectView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.bounds.size.width - 32, height: view.bounds.size.width/4)
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        let temp = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        temp.backgroundColor = .white
        temp.delegate = self
        temp.dataSource = self
        temp.register(MZCategoryCell.self, forCellWithReuseIdentifier: "cell")
        temp.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "tempCell")
        return temp
    }()
}

extension MZCategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? MZCategoryCell {
            let temp = array[indexPath.row]
            cell.showInfo(temp.0, imageName: temp.1)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let temp = array[indexPath.row]
        let vc = MZCategoryDetailViewController()
        vc.keyName = temp.0
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

fileprivate let array = [("电台", "music_transceiver"), ("歌单", "music_song"), ("新歌", "music_new"), ("翻唱", "music_fan"), ("原创", "music_original"),("明星", "music_star"), ("民谣", "music_literature"), ("纯音乐", "music_lingsheng"), ("古风", "music_gufeng"), ("古典", "music_classical"), ("电子", "music_dianzi"), ("ACG", "music_acg"), ("影视", "music_movie"), ("老歌", "music_lao"), ("文艺", "music_wenyi"), ("睡前", "music_sleep"), ("铃声", "music_lingsheng"), ("榜单", "music_dan")]
