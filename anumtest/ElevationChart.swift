//
//  ElevationChart.swift
//  ElevationChart
//
//  Created by Alexander Larsen on 02/09/2021.
//

import Foundation
import Highcharts

struct ElevationChart{
    static func InitElevationChart(chartView: HIChartView, data: [Double], showTooltip: Bool = true) -> HIChartView{
        
        //Parameter
        let masi = data
        
        chartView.backgroundColor = .white
        chartView.plugins = ["annotations"]
        // Create chart
        let chart = HIChart()
        chart.backgroundColor = HIColor(uiColor: .white)
        chart.type = "area"
        chart.zoomType = "x"

        // Create title
        let title = HITitle()
        let style = HICSSObject()
        style.color = "#E9E9E9"
        title.style = style
        title.text = "Høydeprofil"
        title.align = "left"

        // Create x axis
        let xAxis = HIXAxis()
        xAxis.labels = HILabels()
        xAxis.labels.format = "{value} km"
        
        //Parameter
        let tripLengthString = "3.6 km"
        let lengthOfTrip = NSString(string: tripLengthString).doubleValue
        xAxis.max = NSNumber(value: lengthOfTrip)

        // Create y axis
        let yAxis = HIYAxis()
        yAxis.title = HITitle()
        yAxis.title.text = ""
        yAxis.labels = HILabels()
        yAxis.labels.format = "{value} moh"
        
        //Parameter
        let masSortedFromMinToMax = masi.sorted(by: { $0 < $1 })
        yAxis.min = NSNumber(value: masSortedFromMinToMax.first!)
        let maxYValue = NSNumber(value: masSortedFromMinToMax.last! + masSortedFromMinToMax.last!/100)
        yAxis.max = maxYValue

        // Create slider annotation
        let sliderAnnotations = HIAnnotations()
        sliderAnnotations.id = "sliderAnnotations"
        let slider = HIShapes()
        let height = Double(chartView.frame.height)
        slider.height = NSNumber(floatLiteral: height)
        slider.width = 1
        slider.type = "rect"
        slider.stroke = HIColor(uiColor: .gray)
        slider.point = HIPoint()
        slider.point.x = -100
        slider.point.xAxis = 0
        slider.point.yAxis = maxYValue
        sliderAnnotations.shapes = [slider]

        // Create location annotation
        let locationAnnotations = HIAnnotations()
        locationAnnotations.id = "locationAnnotations"
        let locationDot = HIShapes()
        locationDot.r = 7
        locationDot.type = "circle"
        locationDot.fill = HIColor(uiColor: .systemBlue)
        locationDot.stroke = HIColor(uiColor: .white)
        locationDot.strokeWidth = 3
        locationDot.point = HIPoint()
        locationDot.point.xAxis = 0
        locationDot.point.yAxis = 0
        locationDot.point.x = -100
        locationDot.point.y = maxYValue
        locationAnnotations.shapes = [locationDot]

        // Create tooltip
        let tooltip = HITooltip()
        tooltip.headerFormat = "{point.x:.1f} km<br>"
        tooltip.pointFormat = "{point.y} moh"
        tooltip.shared = false
        tooltip.animation = false
        
        //Parameter
        tooltip.enabled = NSNumber(booleanLiteral: showTooltip)

        // Update legend
        let legend = HILegend()
        legend.enabled = false

        // Update credits
        let credits = HICredits()
        credits.enabled = false

        // Update burger menu
        let exporting = HIExporting()
        exporting.enabled = false

        // Create chart data
        let area = HIArea()
        
        //Parameter
        let mas = masi
        var areaDataArray: [[Double]] = []
        let xInterval = lengthOfTrip/Double(mas.count)
        var xSteps = 0.0
        mas.forEach {
            let xValue = xSteps
            let yValue = $0
            let areaData = [xValue, yValue]
            areaDataArray.append(areaData)
            xSteps += xInterval
        }
        area.data = areaDataArray
        area.lineColor = HIColor(uiColor: .green)
        area.lineWidth = 1
        area.color = HIColor(uiColor: .green)
        area.fillOpacity = 0.5
        if !showTooltip {
            area.enableMouseTracking = false
        }

        // Update the options
        let options = HIOptions()
        options.chart = chart
        options.title = title
        options.xAxis = [xAxis]
        options.yAxis = [yAxis]
        options.annotations = [sliderAnnotations, locationAnnotations]
        options.tooltip = tooltip
        options.legend = legend
        options.credits = credits
        options.exporting = exporting
        options.series = [area]
        chartView.options = options
        
        return chartView
    }
}
