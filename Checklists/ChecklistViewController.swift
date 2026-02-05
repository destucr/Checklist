//
//  ViewController.swift
//  Checklists
//
//  Created by Destu Cikal Ramdani on 1/28/26.
//

import UIKit
import SwiftUI

class ChecklistViewController: UITableViewController {
    var row0item = ChecklistItem()
    var row1item = ChecklistItem()
    var row2item = ChecklistItem()
    var row3item = ChecklistItem()
    var row4item = ChecklistItem()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return 5    }

    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)

        let label = cell.viewWithTag(1000) as! UILabel

        if indexPath.row % 5 == 0 {
            label.text = row0item.text
        } else if indexPath.row % 5 == 1 {
            label.text = row1item.text
        } else if indexPath.row % 5 == 2 {
            label.text = row2item.text
        } else if indexPath.row % 5 == 3 {
            label.text = row3item.text
        } else if indexPath.row % 5 == 4 {
            label.text = row4item.text
        }

        configureCheckmark(for: cell, at: indexPath)
        return cell
    }

    func configureCheckmark(
        for cell: UITableViewCell,
        at indexPath: IndexPath
    ) {
        var isChecked = false
        if indexPath.row == 0 {
            isChecked = row0item.isChecked
        } else if indexPath.row == 1 {
            isChecked = row1item.isChecked
        } else if indexPath.row == 2 {
            isChecked = row2item.isChecked
        } else if indexPath.row == 3 {
            isChecked = row3item.isChecked
        } else if indexPath.row == 4 {
            isChecked = row4item.isChecked
        }

        if isChecked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }

    override func tableView(
        _
        tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        if let cell = tableView.cellForRow(at: indexPath) {
            var isChecked = false
            if indexPath.row == 0 {
                row0item.isChecked.toggle()
            } else if indexPath.row == 1 {
                row1item.isChecked.toggle()
            } else if indexPath.row == 2 {
                row2item.isChecked.toggle()
            } else if indexPath.row == 3 {
                row3item.isChecked.toggle()
            } else if indexPath.row == 4 {
                row4item.isChecked.toggle()
            }

            configureCheckmark(for: cell, at: indexPath)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
