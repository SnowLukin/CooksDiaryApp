//
//  TextFieldRecipeTableViewCell.swift
//  RecipesApp
//
//  Created by Anastasia Izmaylova on 06.01.2022.
//

import UIKit

class TextFieldRecipeTableViewCell: UITableViewCell {
    
    @IBOutlet var textFieldRecipe: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        textFieldRecipe.delegate = self
        
        backgroundColor = UIColor(red: 0.224, green: 0.381, blue: 0.210, alpha: 1)
    }
    
    @objc private func didTapDone(){
        textFieldRecipe.endEditing(true)
    }

}
extension TextFieldRecipeTableViewCell: UITextViewDelegate{
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        textFieldRecipe.endEditing(true)
    }

    func textViewDidBeginEditing(_ textView: UITextView) {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        textView.inputAccessoryView = keyboardToolbar
        
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(didTapDone)
        )
        
        let flexBarButton = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        
        keyboardToolbar.items = [flexBarButton, doneButton]
    }
}

