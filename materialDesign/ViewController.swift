//
//  ViewController.swift
//  materialDesign
//
//  Created by Guillermo Silva on 5/20/19.
//  Copyright © 2019 Guillermo Silva. All rights reserved.
//

import UIKit
import MaterialComponents

class ViewController: UIViewController {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false;
        scrollView.backgroundColor = .white
        scrollView.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        return scrollView
    }()
    
    let usernameTextField: MDCTextField = {
        let usernameTextField = MDCTextField()
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.clearButtonMode = .unlessEditing
        usernameTextField.backgroundColor = .white
        return usernameTextField
    }()
    let passwordTextField: MDCTextField = {
        let passwordTextField = MDCTextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.isSecureTextEntry = true
        passwordTextField.backgroundColor = .white
        return passwordTextField
    }()
    
    var usernameTextFieldController: MDCTextInputControllerOutlined
    var passwordTextFieldController: MDCTextInputControllerOutlined
    
    /*override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        //TODO: Setup text field controllers
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }*/
    
    required init?(coder aDecoder: NSCoder) {
        self.usernameTextFieldController = MDCTextInputControllerOutlined(textInput: usernameTextField)
        self.passwordTextFieldController = MDCTextInputControllerOutlined(textInput: passwordTextField)
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        view.tintColor = .black
        scrollView.backgroundColor = .white
        
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate(
            NSLayoutConstraint.constraints(withVisualFormat: "V:|[scrollView]|",
                                           options: [],
                                           metrics: nil,
                                           views: ["scrollView" : scrollView])
        )
        NSLayoutConstraint.activate(
            NSLayoutConstraint.constraints(withVisualFormat: "H:|[scrollView]|",
                                           options: [],
                                           metrics: nil,
                                           views: ["scrollView" : scrollView])
        )
        
        scrollView.addSubview(usernameTextField)
        scrollView.addSubview(passwordTextField)
        usernameTextFieldController.placeholderText = "Username"
        usernameTextField.delegate = self as? UITextFieldDelegate
        passwordTextFieldController.placeholderText = "Password"
        passwordTextField.delegate = self as? UITextFieldDelegate
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(NSLayoutConstraint(item: usernameTextField,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: scrollView.contentLayoutGuide,
                                              attribute: .bottom,
                                              multiplier: 1,
                                              constant: 22))
        constraints.append(NSLayoutConstraint(item: usernameTextField,
                                              attribute: .centerX,
                                              relatedBy: .equal,
                                              toItem: scrollView,
                                              attribute: .centerX,
                                              multiplier: 1,
                                              constant: 0))
        constraints.append(contentsOf:
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-[username]-|",
                                           options: [],
                                           metrics: nil,
                                           views: [ "username" : usernameTextField]))
        constraints.append(NSLayoutConstraint(item: passwordTextField,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: usernameTextField,
                                              attribute: .bottom,
                                              multiplier: 1,
                                              constant: 8))
        constraints.append(NSLayoutConstraint(item: passwordTextField,
                                              attribute: .centerX,
                                              relatedBy: .equal,
                                              toItem: scrollView,
                                              attribute: .centerX,
                                              multiplier: 1,
                                              constant: 0))
        constraints.append(contentsOf:
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-[password]-|",
                                           options: [],
                                           metrics: nil,
                                           views: [ "password" : passwordTextField]))

        NSLayoutConstraint.activate(constraints)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
}

