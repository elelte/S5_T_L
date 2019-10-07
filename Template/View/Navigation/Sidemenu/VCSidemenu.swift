//
//  VCSidemenu.swift
//  Airlog
//
//  Created by Icon+ Gaenael on 04/10/19.
//  Copyright © 2019 Icon+ Mampang. All rights reserved.
//

import UIKit

class VCSidemenu: UITableViewController {

    var viewModel = VMSidemenu()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorStyle = .none
        setData()
    }
    
    private func setData(){
        viewModel.setup()
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.arr_cell.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let type_cell = viewModel.arr_cell[indexPath.row]
        
        switch type_cell.cell {
            
        case .header:
            let cell = tableView.dequeueReusableCell(withIdentifier: "header") as! CSidemenu
            cell.setHeader()
            return cell
            
        case .title:
            let cell = tableView.dequeueReusableCell(withIdentifier: "title") as! CSidemenu
            cell.setTitle(model: type_cell)
            return cell
            
        default:
            return GTableViewExtension.separatorCell()
            
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let type_cell = viewModel.arr_cell[indexPath.row]
        
        switch type_cell.cell {
            
        case .header:
            return 120
            
        case .title:
            return UITableView.automaticDimension
            
        default:
            return 1
            
        }
        
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }

}
