//
//  ViewController.swift
//  SwiftTableView
//
//  Created by Tianjian on 16/1/17.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var tableView :UITableView?
    var items = ["武汉","上海","北京","深圳","广州","重庆","香港","台海","天津"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initTableView()
    }
    
    func initTableView(){
        self.tableView = UITableView(frame:self.view.frame,style: UITableViewStyle.Plain)
        self.tableView!.delegate = self;
        self.tableView!.dataSource = self;
        self.tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(self.tableView!)
    }

    //1.numberOfLines
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }

    //2.
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView .dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        
        var row = indexPath.row as Int
        
        cell.textLabel?.text = self.items[row]
        
        return cell;
    }
}

