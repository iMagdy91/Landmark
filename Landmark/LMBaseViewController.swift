//
//  LMBaseViewController.swift
//  Landmark
//
//  Created by Mohamed Magdy on 7/25/17.
//  Copyright © 2017 Mohamed Magdy. All rights reserved.
//

import UIKit

class LMBaseViewController: UIViewController {

    // MARK: - Utils
    func handleError(error: Error) {
        showMessage(message: error.localizedDescription)
    }
    
    private func showMessage(message: String) {
        let alertController = UIAlertController.init(title: nil, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }

}
