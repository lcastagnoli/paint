//
//  Coordinator.swift
//  Paint
//
//  Created by Laryssa Castagnoli on 05/03/24.
//  Copyright © 2024 Laryssa Castagnoli. All rights reserved.
//

import UIKit

final class Coordinator {

    var navigationController = UINavigationController()

    func start() {
        
        let viewModel = PaintViewModel(navigation: self)
        let paintViewController = PaintViewController(with: viewModel)
        navigationController.pushViewController(paintViewController, animated: true)
    }

    private func openShare(image: UIImage) {

        let activityViewController = UIActivityViewController(activityItems: [image as Any], applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = navigationController.view
        navigationController.present(activityViewController, animated: true, completion: nil)
    }
}

// MARK: - PaintNavigationDelegate
extension Coordinator: PaintNavigationDelegate {

    func paint(didFinish result: PaintViewModel.Result) {
        switch result {
        case let .share(screenshot):
            openShare(image: screenshot)
        }
    }
}
