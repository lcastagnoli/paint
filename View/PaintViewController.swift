//
//  PaintViewControllerx.swift
//  Paint
//
//  Created by Laryssa Castagnoli on 06/02/18.
//  Copyright © 2018 Laryssa Castagnoli. All rights reserved.
//

import UIKit

final class PaintViewController: UIViewController {

    // MARK: IBOutlets
    @IBOutlet private weak var segmentedWidth: UISegmentedControl!
    @IBOutlet private weak var drawView: DrawView!
    @IBOutlet private weak var collectionView: UICollectionView!

    // MARK: Properties
    private let viewModel: PaintViewModelProtocol

    // MARK: Constants
    private enum Constants {
        static let itemSize = CGSize(width: 30, height: 30)
        static let eraserWidth = 10.0
    }

    // MARK: Initializers
    init(with viewModel: PaintViewModelProtocol) {

        self.viewModel = viewModel
        super.init(nibName: nil, bundle: Bundle(for: PaintViewController.self))
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(cell: ColorCell.self)
    }
    
    // MARK: IBActions
    @IBAction private func tapChangeWidth(_ sender: UISegmentedControl) {
        drawView.color = UIColor.black
        drawView.width = CGFloat(sender.selectedSegmentIndex + 1)
    }
    
    
    @IBAction private func toggleWidths(_ sender: UIButton) {
        segmentedWidth.isHidden = !segmentedWidth.isHidden
    }
    
    @IBAction func tapEraser(_ sender: UIButton) {
        drawView.color = UIColor.white
        drawView.width = Constants.eraserWidth
    }
    
    @IBAction private func tapShare(_ sender: UIButton) {

        let screenshot = drawView.takeScreenshot()
        viewModel.share(image: screenshot)
    }
    
    @IBAction private func tapClear(_ sender: UIButton) {

        drawView.lines.removeAll()
        drawView.setNeedsDisplay()
    }
}

// MARK: - UICollectionViewDelegate
extension PaintViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeue(ColorCell.self, at: indexPath)
        cell.setup(with: viewModel.colors[safe: indexPath.item])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension PaintViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, 
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return Constants.itemSize
    }
}

// MARK: - UICollectionViewDelegate
extension PaintViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        drawView.color = viewModel.colors[safe: indexPath.item]
    }
}
