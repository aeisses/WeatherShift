//
//  GraphViewController.swift
//  WeatherShift
//
//  Created by Aaron Eisses on 11/8/17.
//  Copyright © 2017 Salesforce. All rights reserved.
//

import UIKit
import Charts

class GraphViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {

    let pickerData = [["Amherst","Annapolis","Annapolis Valley","Cape Breton West","Guysborough","HRM","Kentville","Liverpool"],
                      ["Temperature","Precipitation","Degree Days","Heat Days","Growing Degree Days","Growing Season","Agriculture","Days With Rain","Freeze-Thaw","Water"]]

    var currentLocation:String = ""
    var currentAdjuster:String = "Temperature"

    @IBOutlet weak var chtChart:LineChartView!
    @IBOutlet var locationPicker: UIPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationPicker.delegate = self
        locationPicker.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func touchLocation(_ sender: Any) {
    }

    @IBAction func touchClear(_ sender: Any) {
    }

    @IBAction func touchStats(_ sender: Any) {
    }

    func updateGraph() {
        let chartData = LineChartData()

        if currentAdjuster == "Temperature" {
            let line1 = self.addLine(location: currentLocation, range: "Temperature - Annual", colour: NSUIColor.black)
            let line2 = self.addLine(location: currentLocation, range: "Temperature - Winter", colour: NSUIColor.blue)
            let line3 = self.addLine(location: currentLocation, range: "Temperature - Spring", colour: NSUIColor.green)
            let line4 = self.addLine(location: currentLocation, range: "Temperature - Summer", colour: NSUIColor.yellow)
            let line5 = self.addLine(location: currentLocation, range: "Temperature - Autumn", colour: NSUIColor.orange)

            chartData.addDataSet(line1)
            chartData.addDataSet(line2)
            chartData.addDataSet(line3)
            chartData.addDataSet(line4)
            chartData.addDataSet(line5)
        } else if currentAdjuster == "Precipitation" {
            let line1 = self.addLine(location: currentLocation, range: "Precipitation - Annual", colour: NSUIColor.black)
            let line2 = self.addLine(location: currentLocation, range: "Precipitation - Winter", colour: NSUIColor.blue)
            let line3 = self.addLine(location: currentLocation, range: "Precipitation - Spring", colour: NSUIColor.green)
            let line4 = self.addLine(location: currentLocation, range: "Precipitation - Summer", colour: NSUIColor.yellow)
            let line5 = self.addLine(location: currentLocation, range: "Precipitation - Autumn", colour: NSUIColor.orange)

            chartData.addDataSet(line1)
            chartData.addDataSet(line2)
            chartData.addDataSet(line3)
            chartData.addDataSet(line4)
            chartData.addDataSet(line5)
        } else if currentAdjuster == "Degree Days" {
            let line1 = self.addLine(location: currentLocation, range: "Heating Degree Days", colour: NSUIColor.black)
            let line2 = self.addLine(location: currentLocation, range: "Cooling Degree Days", colour: NSUIColor.blue)

            chartData.addDataSet(line1)
            chartData.addDataSet(line2)
        } else if currentAdjuster == "Heat Days" {
            let line1 = self.addLine(location: currentLocation, range: "Hot Days (Tmax > 30)", colour: NSUIColor.black)
            let line2 = self.addLine(location: currentLocation, range: "Very Hot Days (Tmax > 35)", colour: NSUIColor.blue)
            let line3 = self.addLine(location: currentLocation, range: "Cold Days (Tmax < -10)", colour: NSUIColor.green)
            let line4 = self.addLine(location: currentLocation, range: "Very Cold Days (Tmax < -20)", colour: NSUIColor.yellow)

            chartData.addDataSet(line1)
            chartData.addDataSet(line2)
            chartData.addDataSet(line3)
            chartData.addDataSet(line4)
        } else if currentAdjuster == "Growing Degree Days" {
            let line1 = self.addLine(location: currentLocation, range: "Growing Degree Days > 5", colour: NSUIColor.black)
            let line2 = self.addLine(location: currentLocation, range: "Growing Degree Days > 10", colour: NSUIColor.blue)

            chartData.addDataSet(line1)
            chartData.addDataSet(line2)
        } else if currentAdjuster == "Growing Season" {
            let line1 = self.addLine(location: currentLocation, range: "Growing Season Length", colour: NSUIColor.black)
            let line2 = self.addLine(location: currentLocation, range: "Corn Season Length", colour: NSUIColor.green)
            let line3 = self.addLine(location: currentLocation, range: "Freeze Free Season", colour: NSUIColor.yellow)

            chartData.addDataSet(line1)
            chartData.addDataSet(line2)
            chartData.addDataSet(line3)
        } else if currentAdjuster == "Agriculture" {
            let line1 = self.addLine(location: currentLocation, range: "Corn Heat Units (CHU)", colour: NSUIColor.blue)

            chartData.addDataSet(line1)
        } else if currentAdjuster == "Days With Rain" {
            let line1 = self.addLine(location: currentLocation, range: "Days With Rain", colour: NSUIColor.black)
            let line2 = self.addLine(location: currentLocation, range: "Days With Snow", colour: NSUIColor.blue)

            chartData.addDataSet(line1)
            chartData.addDataSet(line2)
        } else if currentAdjuster == "Freeze-Thaw" {
            let line1 = self.addLine(location: currentLocation, range: "Freeze-Thaw Cycles - Annual", colour: NSUIColor.black)
            let line2 = self.addLine(location: currentLocation, range: "Freeze-Thaw Cycles - Winter", colour: NSUIColor.blue)
            let line3 = self.addLine(location: currentLocation, range: "Freeze-Thaw Cycles - Spring", colour: NSUIColor.green)
            let line4 = self.addLine(location: currentLocation, range: "Freeze-Thaw Cycles - Summer", colour: NSUIColor.yellow)
            let line5 = self.addLine(location: currentLocation, range: "Freeze-Thaw Cycles - Autumn", colour: NSUIColor.orange)

            chartData.addDataSet(line1)
            chartData.addDataSet(line2)
            chartData.addDataSet(line3)
            chartData.addDataSet(line4)
            chartData.addDataSet(line5)
        } else if currentAdjuster == "Water" {
            let line1 = self.addLine(location: currentLocation, range: "Water Surplus", colour: NSUIColor.black)
            let line2 = self.addLine(location: currentLocation, range: "Water Deficit", colour: NSUIColor.blue)
            let line3 = self.addLine(location: currentLocation, range: "Intensity Short Period Rainfall", colour: NSUIColor.green)

            chartData.addDataSet(line1)
            chartData.addDataSet(line2)
            chartData.addDataSet(line3)
        }

        chtChart.data = chartData
        chtChart.chartDescription?.text = currentAdjuster
    }

    func addLine(location: String, range: String, colour: NSUIColor) -> LineChartDataSet {
        var lineChartEntry = [ChartDataEntry]()

        let manager = RESTManager()
        var data = manager.weatherDataForLocation(location: location, type: range)

        for i in 0..<data.count {
            let value = ChartDataEntry(x: self.convertRangeToNumber(range: data[i].range!), y: Double(data[i].measure))

            lineChartEntry.append(value)
        }

        let line = LineChartDataSet(values: lineChartEntry, label: range)
        line.colors = [colour]

        return line;
    }

    // Picker required methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return pickerData.count
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData[component].count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[component][row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            currentLocation = pickerData[component][row]
        }
        if component == 1 {
            currentAdjuster = pickerData[component][row]
        }
        if currentLocation == "" {
            currentLocation = "Amherst"
        }
        self.updateGraph()
    }

    func convertRangeToNumber(range: String) -> Double {
        var value = 0.0
        if range == "1980s" {
            value = 1980.0
        }
        else if range == "2020s" {
            value = 2020.0
        }
        else if range == "2050s" {
            value = 2050.0
        }
        else if range == "2080s" {
            value = 2080.0
        }
        return value
    }
}
