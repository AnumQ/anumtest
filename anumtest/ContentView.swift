//
//  ContentView.swift
//  anumtest
//
//  Created by Anum Qudsia on 03/09/2021.
//

import SwiftUI

struct ContentView: View {
    let chartData = [Double(31.0),Double(33.0),Double(33.0),Double(32.0),Double(32.0),Double(60.0),Double(60.0),Double(62.0),Double(62.0),Double(76.0),Double(76.0),Double(83.0),Double(83.0),Double(81.0),Double(81.0),Double(81.0),Double(81.0),Double(82.0),Double(82.0),Double(82.0),Double(82.0),Double(83.0),Double(83.0),Double(86.0),Double(86.0),Double(93.0),Double(93.0),Double(85.0),Double(85.0),Double(80.0),Double(80.0),Double(72.0),Double(72.0),Double(71.0),Double(71.0),Double(70.0),Double(70.0),Double(67.0),Double(67.0),Double(60.0),Double(60.0),Double(59.0),Double(59.0),Double(56.0),Double(56.0),Double(52.0),Double(52.0),Double(45.0),Double(45.0),Double(42.0),Double(42.0),Double(43.0),Double(43.0),Double(36.0),Double(36.0),Double(39.0),Double(39.0),Double(33.0),Double(33.0),Double(33.0),Double(33.0),Double(32.0),Double(32.0),Double(31.0),Double(31.0),Double(32.0),Double(32.0),Double(32.0),Double(32.0),Double(32.0),Double(32.0),Double(32.0),Double(32.0),Double(32.0),Double(32.0),Double(33.0),Double(33.0),Double(31.0),Double(31.0),Double(31.0),Double(31.0),Double(30.0),Double(30.0),Double(32.0),Double(32.0),Double(34.0),Double(34.0),Double(36.0),Double(36.0),Double(32.0),Double(32.0),Double(30.0),Double(30.0),Double(10.0),Double(10.0),Double(11.0),Double(11.0),Double(14.0),Double(14.0),Double(19.0),Double(19.0),Double(26.0),Double(26.0),Double(27.0),Double(27.0),Double(28.0),Double(28.0),Double(31.0),Double(31.0),Double(33.0),Double(33.0),Double(32.0)]
    
    var body: some View {
        HighChartRepresentable(chartType: .elevation, data: chartData).frame(width: .infinity, height: 140, alignment: .center)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
