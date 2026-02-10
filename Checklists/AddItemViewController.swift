//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Destu Cikal Ramdani on 2/5/26.
//

import UIKit

protocol AddItemViewControllerDelegate: AnyObject {
    func addItemViewControllerDidCancel(
        _ controller: AddItemViewController)

    func addItemViewController(
        _ controller: AddItemViewController,
        didFinishAddingItem item: ChecklistItem
    )
}
  class AddItemViewController: UITableViewController, UITextFieldDelegate {
    weak var delegate: AddItemViewControllerDelegate?

    @IBOutlet weak var doneBarButton: UIBarButtonItem!

    @IBOutlet weak var textField: UITextField!
      
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.largeTitleDisplayMode = .never
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }

    @IBAction func cancel() {
        delegate?.addItemViewControllerDidCancel(self)
    }

    @IBAction func done() {
        let item = ChecklistItem()
        item.text = textField.text!

        print ("contents of the text field: \(textField.text!)")
        delegate?.addItemViewController(self, didFinishAddingItem: item)
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
