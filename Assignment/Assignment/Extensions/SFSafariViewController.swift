//
//  SFSafariViewController.swift
//  Assignment
//
//  Created by Abdul Rahim on 11/12/21.
//

import UIKit
import SafariServices

// MARK:- SFSafariViewController

extension SFSafariViewController {
    
    public static func openWithSafariVC(url: URL, from: UIViewController) {
        var updatedUrl = url
        if url.absoluteString.lowercased().starts(with: "http") == false {
            if let urlWithHttp = URL(string: "http://"+url.absoluteString) {
                updatedUrl = urlWithHttp
            } else {
                return
            }
        }
        let configuration = SFSafariViewController.Configuration.init()
        let safariVC = SFSafariViewController.init(url: updatedUrl, configuration: configuration)
        safariVC.preferredControlTintColor = .purple
        from.present(safariVC, animated: true, completion: nil)
    }
}
