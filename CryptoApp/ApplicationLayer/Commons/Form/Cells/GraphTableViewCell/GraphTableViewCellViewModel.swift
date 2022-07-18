//
//  GraphTableViewCellViewModel.swift
//  CryptoApp
//
//  Created by iveri gamezardashvili on 7/13/22.
//

import UIKit

final class GraphTableViewCellViewModel {
    let id: String = "GraphTableViewCellViewModel"
    let sparkline: [String]
    let dynamicColorsProvider: DynamicColorsProviderProtocol
    
    init(
        sparkline: [String],
        dynamicColorsProvider: DynamicColorsProviderProtocol
    ) {
        self.sparkline = sparkline
        self.dynamicColorsProvider = dynamicColorsProvider
    }
}

extension GraphTableViewCellViewModel: CellViewModelProtocol {
    public func cell(
        for tableView: UITableView,
        indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: GraphTableViewCell.reuseIdentifier,
            for: indexPath
        ) as! GraphTableViewCell
        let dataInDouble = sparkline.map { Double($0)! }
        let maxValue = dataInDouble.max() ?? 0
        let minValue = dataInDouble.min() ?? 0
        let normalizedSparkline = Observable(normalize(sparkline))
        
        cell.graphView.clipsToBounds = true
        cell.minValueLabel.text = "$\(minValue)"
        cell.maxValueLabel.text = "$\(maxValue)"

        normalizedSparkline.bind { [weak self] values in
            guard let self = self else { return }
            let linePath = self.makeLinePath(points: values, view: cell.graphView)
            let shapeLayer = self.makeLineShapeLayer(path: linePath, lineColor: self.dynamicColorsProvider.highlight.uiColor)
            DispatchQueue.main.async {
                cell.graphView.layer.sublayers = nil
                cell.graphView.layer.addSublayer(shapeLayer)
            }
        }
        
        return cell
    }
    
    public func isEqual(other: Differentiable) -> Bool {
        guard let other = other as? Self else { return false }
        return id == other.id
    }
}

// MARK: - Private Functions

extension GraphTableViewCellViewModel {
    private func makeLinePath(points: [Double], view: UIView) -> UIBezierPath {
        let linePath = UIBezierPath()
        for (index, point) in points.enumerated() {
            let xPos = (view.bounds.size.width) / CGFloat(points.count - 1) * CGFloat(index)
            let yPos = (1 - point) * (view.bounds.size.height - 2)
            if index == 0 {
                linePath.move(to: CGPoint(x: xPos, y: yPos))
            }
            linePath.addLine(to: CGPoint(x: xPos, y: yPos))
        }
        return linePath
    }

    private func makeLineShapeLayer(path: UIBezierPath, lineColor: UIColor) -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.lineWidth = 2.0
        shapeLayer.position = CGPoint(x: 0.0, y: 0.0)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = lineColor.cgColor
        return shapeLayer
    }
    
    private func normalize(_ data: [String]) -> [Double] {
        let dataInDouble = data.map { Double($0)! }
        let maxValue = dataInDouble.max() ?? 0
        let minValue = dataInDouble.min() ?? 0
        let difference = maxValue - minValue
        let normalizedValues = dataInDouble.map { Double(($0 - minValue) / difference) }
        return normalizedValues
    }
}
