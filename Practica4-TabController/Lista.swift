//
//  ViewController.swift
//  Practica4-TabController
//
//  Created by Yola on 18/09/18.
//  Copyright © 2018 Yola. All rights reserved.
//
import UIKit
import SQLite3
class Lista: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var db: OpaquePointer?
    var tar: String = ""
    var cale:Date?=nil
    var ta:[String]=[]
    var ca:[String]=[]
    
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource=self
        tableView.delegate=self
        let izqui = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeft))
        izqui.direction = .left
        self.view.addGestureRecognizer(izqui)
        let dere = UISwipeGestureRecognizer(target: self, action: #selector(swipeRigh))
        dere.direction = .right
        self.view.addGestureRecognizer(dere)
        
    }
    @objc func swipeLeft(){
        let total = (self.tabBarController!.viewControllers?.count)!-1
        tabBarController!.selectedIndex = min(total, tabBarController!.selectedIndex+1)
    }
    @objc func swipeRigh(){
        tabBarController!.selectedIndex = min(0, tabBarController!.selectedIndex-1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tareas.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cel = tableView.dequeueReusableCell(withIdentifier:"celda")
        cel?.textLabel?.text=tareas[indexPath.row].fecha
        cel?.detailTextLabel?.text=tareas[indexPath.row].tarea
        
        return cel!
    }
    
    


}

