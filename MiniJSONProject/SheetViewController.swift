//
//  SheetViewController.swift
//  MiniJSONProject
//
//  Created by Илья Десятов on 03.03.2024.
//

import UIKit

final class SheetViewController: UIViewController {
    private lazy var  button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("button", for: .normal)
        button.addTarget(self, action: #selector(nasrat), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .purple
        view.addSubview(button)
        
        setupUI1()
    }
    
    @objc private func nasrat() {
        let vc = UIViewController()
        vc.view.backgroundColor = .yellow
        self.present(vc, animated: true)
    }
    
    private func setupUI1() {
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
