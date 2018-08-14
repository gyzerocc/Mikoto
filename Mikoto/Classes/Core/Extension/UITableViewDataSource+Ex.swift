//
//  UITableViewDataSource+Ex.swift
//  Base
//
//  Created by 龚阳 on 2018/4/25.
//

import Foundation

public extension UITableViewDataSource {
    
    /// return total rows in the tableView
    public func totalRows(tableView: UITableView) -> Int {
        let totalSections = numberOfSections!(in: tableView)
        var section = 0, total = 0
        while section < totalSections {
            total += self.tableView(tableView, numberOfRowsInSection: section)
            section += 1
        }
        return total
    }
    
}
