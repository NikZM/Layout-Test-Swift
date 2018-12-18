//
//  CollectionViewCell.swift
//  Layout Test
//
//  Created by Nik Medgyesy on 18/12/2018.
//  Copyright © 2018 Nik Medgyesy. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell, UITableViewDataSource, UITableViewDelegate {
    
    
    var onScroll: ((_ scrollView: UIScrollView)->Void)?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableID", for: indexPath)
        cell.textLabel?.text = "**  \(indexPath.row+1) **"
        return cell
    }
    
    
    @IBOutlet var tableView: UITableView!
    override func awakeFromNib() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.contentInset = UIEdgeInsets(top: 80, left: 0, bottom: 0, right: 0)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        onScroll?(scrollView)
    }
}
