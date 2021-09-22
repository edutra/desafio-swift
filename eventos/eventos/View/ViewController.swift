//
//  ViewController.swift
//  eventos
//
//  Created by Enrique Dutra on 22/09/21.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var tableView: UITableView!
    private let viewModel = ViewControllerViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.viewModel.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

}

extension ViewController: ViewControllerViewModelDelegate{
    func startRequest() {
        print("Start request")
    }
    
    func endRequest() {
        print("End request")
    }
    
    func stopRequest() {
        print("Stop request")
    }
    
    
}

