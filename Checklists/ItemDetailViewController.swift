//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Destu Cikal Ramdani on 2/5/26.
//

import UIKit

protocol ItemDetailViewControllerDelegate: AnyObject {
    func itemDetailViewControllerDidCancel(
        _ controller: ItemDetailViewController
    )

    func itemDetailViewController(
        _ controller: ItemDetailViewController,
        didFinishAddingItem item: ChecklistItem
    )

    func itemDetailViewController(
        _ controller: ItemDetailViewController,
        didFinishEditing item: ChecklistItem
    )
}


class ItemDetailViewController: UITableViewController, UITextFieldDelegate {
    weak var delegate: ItemDetailViewControllerDelegate?
    var itemToEdit: ChecklistItem?

    @IBOutlet weak var doneBarButton: UIBarButtonItem!

    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let itemToEdit = itemToEdit {
            title = "Edit Item"
            textField.text = itemToEdit.text
            doneBarButton.isEnabled = true
        }

        navigationItem.largeTitleDisplayMode = .never
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }

    @IBAction func cancel() {
        delegate?.itemDetailViewControllerDidCancel(self)
    }

    // How it can diferentiate the item?
    @IBAction func done() {
        if let item = itemToEdit {
            item.text = textField.text!
            delegate?.itemDetailViewController(self, didFinishEditing: item)
        } else {
            let item = ChecklistItem()
            item.text = textField.text!
            delegate?.itemDetailViewController(self, didFinishAddingItem: item)
        }
    }

    override func tableView(
        _ tableView: UITableView,
        willSelectRowAt indexPath: IndexPath
    ) -> IndexPath? {
        return nil
    }

    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        let oldText = textField.text!
        let stringRange = Range(range, in: oldText)!
        let newText = oldText.replacingCharacters(in: stringRange, with: string)

        doneBarButton.isEnabled = !newText.isEmpty

        return true
    }

    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        doneBarButton.isEnabled = false
        return true
    }
}
