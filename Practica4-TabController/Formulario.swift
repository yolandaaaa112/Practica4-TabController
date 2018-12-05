//
//  Formulario.swift
//  Practica4-TabController
//
//  Created by Yola on 18/09/18.
//  Copyright © 2018 Yola. All rights reserved.
//
var tareas = [Tareas]()
var tarea: Tareas?
import UIKit
import SQLite3
class Formulario: UIViewController {
    var db: OpaquePointer?
    @IBOutlet weak var tar: UITextField!
    
    
    @IBOutlet var cal: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Guardar(_ sender: Any) {
        let fecha = "\(String(describing: cal.date))"
        let tarea = tar.text
        tareas.append(Tareas(tarea: tarea!, fecha: fecha))
        print(tareas[0].tarea)
        print(tareas[0].fecha)
    }
    
    
    }

class Tareas: NSObject{
    var tarea: String
    var fecha: String
    
    init(tarea: String, fecha: String) {
        self.tarea = tarea
        self.fecha = fecha
    }
    
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


