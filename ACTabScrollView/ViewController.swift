//
//  ViewController.swift
//  ACTabScrollView
//
//  Created by AzureChen on 2015/8/19.
//  Copyright (c) 2015年 AzureChen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ACTabScrollViewDelegate, ACTabScrollViewDataSource {

    @IBOutlet weak var tabScrollView: ACTabScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabScrollView.frame = self.view.frame
        self.view.addSubview(tabScrollView)
        
        tabScrollView.defaultPageIndex = 1
        tabScrollView.defaultTabSectionHeight = 60
        tabScrollView.pagingEnabled = true
        tabScrollView.delegate = self
        tabScrollView.dataSource = self
        tabScrollView.cachePageLimit = 3
    }
    
    // MARK: ACTabScrollViewDelegate
    func tabScrollView(tabScrollView: ACTabScrollView, didChangePageTo index: Int) {
        print(index)
    }
    
    func tabScrollView(tabScrollView: ACTabScrollView, didScrollPageTo index: Int) {
    }
    
    // MARK: ACTabScrollViewDataSource
    func numberOfPagesInTabScrollView(tabScrollView: ACTabScrollView) -> Int {
        return 8
    }
    
    func tabScrollView(tabScrollView: ACTabScrollView, tabViewForPageAtIndex index: Int) -> UIView {
        let tabView = UIView()
        tabView.frame.size = CGSize(width: (index + 1) * 10, height: (index + 1) * 5)
        
        switch (index % 3) {
        case 0:
            tabView.backgroundColor = UIColor.redColor()
        case 1:
            tabView.backgroundColor = UIColor.greenColor()
        case 2:
            tabView.backgroundColor = UIColor.blueColor()
        default:
            break
        }
        
        return tabView
    }
    
    func tabScrollView(tabScrollView: ACTabScrollView, contentViewForPageAtIndex index: Int) -> UIView {
        let contentView = UIView()
        
        switch (index % 3) {
        case 0:
            contentView.backgroundColor = UIColor.redColor()
        case 1:
            contentView.backgroundColor = UIColor.greenColor()
        case 2:
            contentView.backgroundColor = UIColor.blueColor()
        default:
            break
        }
        
        return contentView
    }
}

