//
//  PaintViewModel.swift
//  Paint
//
//  Created by Laryssa Castagnoli on 17/01/24.
//  Copyright © 2024 Laryssa Castagnoli. All rights reserved.
//

import UIKit

protocol PaintNavigationDelegate: AnyObject {

    func paint(didFinish result: PaintViewModel.Result)
}

protocol PaintViewModelProtocol: AnyObject {

    var colors: [UIColor] { get }
    func share(image: UIImage?)
}

final class PaintViewModel {

    enum Result {
        case share(UIImage)
    }

    // MARK: Properties
    weak var navigation: PaintNavigationDelegate?

    init(navigation: PaintNavigationDelegate?) {
        self.navigation = navigation
    }
}

// MARK: - PaintViewModelProtocol
extension PaintViewModel: PaintViewModelProtocol {

    var colors: [UIColor] { [.black, .blue, .green, .red, .darkGray] }

    func share(image: UIImage?) {
        
        guard let image else { return }
        navigation?.paint(didFinish: .share(image))
    }
}
