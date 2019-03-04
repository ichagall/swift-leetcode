//
//  ViewController.swift
//  Test
//
//  Created by ght on 2019/2/27.
//  Copyright © 2019 youdao. All rights reserved.
//

import UIKit

class TempView: UIView {
    var identifier: String?
    var inShow: Bool = false;
    
    class func newView() -> TempView {
        let view = TempView()
        view.inShow = false;
        return view
    }
}

class ViewController: UIViewController, UIScrollViewDelegate {

    var array = Array<TempView>()
    var cache : Dictionary = [String: Any]();
    let scrollView = UIScrollView()
    let viewHeight = 100;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.scrollView)
        self.scrollView.delegate = self;
        self.scrollView.frame = self.view.bounds
        self.scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.initUI();
    }
    
    func initUI() -> Void {
        var yoffset: CGFloat = 0
        var rect = CGRect(x: 0.0, y: yoffset, width: self.view.frame.size.width, height: self.view.frame.height)
        while rect.maxY < self.view.frame.size.height {
            let cell = TempView.newView()
            cell.identifier = "1"
        }
        
    }
    
    func add(cell: TempView) -> Void {
        if var array = self.cache[cell.identifier ?? "1"] as? Array<TempView>{
            array.append(cell)
        }
        else{
            
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffset = scrollView.contentOffset;
        
        
    }
    
    
}

