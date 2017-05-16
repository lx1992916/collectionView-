//
//  ViewController.swift
//  自定义layout
//
//  Created by 七 on 2017/5/9.
//  Copyright © 2017年 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    fileprivate lazy var collectionView: UICollectionView = {
        let layout = CustomLayout()
        layout.dataSource = self
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
       let collectionView = UICollectionView(frame: CGRect(x: 0, y: 100, width: UIScreen.main.bounds.width, height: 160), collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.orange
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "hehe")
        return collectionView
    }()
    
    fileprivate lazy var pageControll: UIPageControl = {
       let pageControl = UIPageControl(frame: CGRect(x: 0, y: 260, width: UIScreen.main.bounds.width, height: 20))
        pageControl.backgroundColor = .red
        pageControl.currentPage = 0
        pageControl.numberOfPages = 7
        return pageControl
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        view.addSubview(pageControll)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 38
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "hehe", for: indexPath)
        cell.backgroundColor = UIColor.rendomColor()
        return cell
    }
    
}

extension ViewController: CustomLayoutDataSource {
    func numberOfCols(_ customLayout: CustomLayout) -> Int {
        return 3
    }
    func numberOfRols(_ customLayout: CustomLayout) -> Int {
        return 2
    }
}
extension ViewController: UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = fabs(scrollView.contentOffset.x)
        print(index)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let index = fabs(scrollView.contentOffset.x)/UIScreen.main.bounds.width
        pageControll.currentPage = Int(index)
    }
}
