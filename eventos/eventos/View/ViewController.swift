//
//  ViewController.swift
//  eventos
//
//  Created by Enrique Dutra on 22/09/21.
//

import UIKit

class ViewController: UIViewController {

//    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        tableView.delegate = self
//        tableView.dataSource = self
        
        let request = Request()
        request.eventsRequest { events in
            print(events)
        }
        request.eventRequest(by: 1) { event in
            print(event)
        }
    }


}

//extension ViewController: UITableViewDelegate, UITableViewDataSource
//func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    <#code#>
//}


