//
//  DetailViewController.swift
//  Assignment
//
//  Created by Abdul Rahim on 10/12/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MARK: View & properties
    
    var launch: Launch?
    
    private let rocketLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        return label
    }()
    
    private let detailLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .body)
        return label
    }()
    
    private let wikiLinkLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.text = "Wikipedia page"
        label.textColor = .systemBlue
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.isUserInteractionEnabled = true
        return label
    }()
    
    private let articleLinkLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.text = "Article page"
        label.textColor = .systemBlue
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.isUserInteractionEnabled = true
        return label
    }()
    
    private let scrollview: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.alwaysBounceVertical = true
        return scrollView
    }()
    
    let contentView = UIView()
    
    //MARK: Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = launch?.name
        view.addSubview(scrollview)
        setupView()
        setupConstraints()
        configureView()
    }
    
    // view setup here
    private func setupView() {
        [rocketLabel, detailLabel, wikiLinkLabel, articleLinkLabel]
            .forEach {
                $0.numberOfLines = 0
                $0.textAlignment = .center
            }
        wikiLinkLabel.tag = 1
        articleLinkLabel.tag = 2
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(tappedOnLabel(_:)))
        tapgesture.numberOfTapsRequired = 1
        wikiLinkLabel.addGestureRecognizer(tapgesture)
        articleLinkLabel.addGestureRecognizer(tapgesture)
    }
    
    // setting constraints here
    private func setupConstraints() {
        
        [contentView, rocketLabel, detailLabel, wikiLinkLabel, articleLinkLabel]
            .forEach {
                $0.translatesAutoresizingMaskIntoConstraints = false
                scrollview.addSubview($0)
            }
        
        let margin: CGFloat = 15.0
        NSLayoutConstraint.activate([
            wikiLinkLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            wikiLinkLabel.topAnchor.constraint(equalTo: articleLinkLabel.bottomAnchor, constant: 10),
            
            articleLinkLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin),
            articleLinkLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -margin),
            articleLinkLabel.topAnchor.constraint(equalTo: detailLabel.bottomAnchor, constant: 20),
                        
            detailLabel.leadingAnchor.constraint(equalTo: rocketLabel.leadingAnchor),
            detailLabel.topAnchor.constraint(equalTo: rocketLabel.bottomAnchor, constant: 10),
            detailLabel.trailingAnchor.constraint(equalTo: rocketLabel.trailingAnchor),
            
            rocketLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            rocketLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            rocketLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            contentView.centerXAnchor.constraint(equalTo: scrollview.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollview.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollview.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollview.bottomAnchor),
            
            scrollview.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollview.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollview.topAnchor.constraint(equalTo: view.topAnchor),
            scrollview.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    //configure view
    
    private func configureView() {
        rocketLabel.text = launch?.rocket
        detailLabel.text = launch?.details
    }
    
    //MARK:- Action tappedOnLabel
    
    @objc func tappedOnLabel(_ gesture: UITapGestureRecognizer) {
        print("aaaadadadadad")
//        if label.tag == 1 {
//
//        } else {
//
//        }
        //Constants.openWithSafariVC(url: URL(string: viewModel.cat.wikipediaUrl ?? "")!, from: self)
    }
    
}
