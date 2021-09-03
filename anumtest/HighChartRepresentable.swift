//
//  HighChartsRepresentable.swift
//  HighChartsRepresentable
//
//  Created by Alexander Larsen on 02/09/2021.
//

import Foundation
import Highcharts
import SwiftUI

enum ChartType {
    case elevation
}

struct HighChartRepresentable: UIViewRepresentable {
    private let chartView = HIChartView()
    public let chartType: ChartType
    
    public let data: [Double]

    func makeUIView(context: Context) -> HIChartView {
        var chartView = chartView
        switch chartType {
        case .elevation:
            chartView = ElevationChart.InitElevationChart(chartView: chartView, data: data)
        }
        return chartView
    }

    func updateUIView(_ uiView: HIChartView, context: Context) {}

    func makeCoordinator() -> DefaultCoordinator {
        return DefaultCoordinator()
    }
}

class DefaultCoordinator: NSObject, Highcharts.HIChartViewDelegate {
    func chartViewDidLoad(_ chart: HIChartView!) {
        print("Test")
    }
}
