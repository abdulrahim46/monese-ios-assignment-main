//
//  AppNavigationHandler.swift
//  Assignment
//
//  Created by Abdul Rahim on 10/12/21.
//

import Foundation
import UIKit


class AppNavigationHandler {
    
    // Detail screen
    public static func goToLauchDetailScreen(launch: Launch, from: UIViewController) {
        let vc = DetailViewController()
        vc.launch = launch
        let emptyBackButton = UIBarButtonItem.init(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        from.navigationController?.navigationBar.topItem?.backBarButtonItem = emptyBackButton
        from.navigationController?.pushViewController(vc, animated: true)
    }
}
