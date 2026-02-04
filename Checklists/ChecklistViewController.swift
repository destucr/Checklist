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
        return 1000
    }

    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)

        let label = cell.viewWithTag(1000) as! UILabel

        if indexPath.row % 5 == 0 {
            label.text = "walk the dog"
        } else if indexPath.row % 5 == 1 {
            label.text = "Brush my teeth"
        } else if indexPath.row % 5 == 2 {
            label.text = "Learn iOS development"
        } else if indexPath.row % 5 == 3 {
            label.text = "Soccer practice"
        } else if indexPath.row % 5 == 4 {
            label.text = "Eat ice cream"
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
            isChecked = row0checked
        } else if indexPath.row == 1 {
            isChecked = row1checked
        } else if indexPath.row == 2 {
            isChecked = row2checked
        } else if indexPath.row == 3 {
            isChecked = row3checked
        } else if indexPath.row == 4 {
            isChecked = row4checked
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
                row0checked.toggle()
                isChecked = row0checked
            } else if indexPath.row == 1 {
                row1checked.toggle()
                isChecked = row1checked
            } else if indexPath.row == 2 {
                row2checked.toggle()
                isChecked = row2checked
            } else if indexPath.row == 3 {
                row3checked.toggle()
                isChecked = row3checked
            } else if indexPath.row == 4 {
                row4checked.toggle()
                isChecked = row4checked
            }

            configureCheckmark(for: cell, at: indexPath)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
