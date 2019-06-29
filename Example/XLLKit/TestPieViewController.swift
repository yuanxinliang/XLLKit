//
//  TestPieViewController.swift
//  XLLKit_Example
//
//  Created by ZZCMXL on 2019/6/25.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import AAInfographics
import Charts


class TestPieViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .orange
        demo1()
//        demo2()
    }
    
    func demo2()
    {
        let w = self.view.frame.width
        let h: CGFloat = 240
        let chart = PieChartView()
        
        chart.setExtraOffsets(left: 0, top: 20, right: 0, bottom: 20)
        
        // 旋转功能
        chart.rotationEnabled = true
        
        chart.drawEntryLabelsEnabled = true //显示区块文本
        chart.usePercentValuesEnabled = true
        
        chart.drawSlicesUnderHoleEnabled = true
        
        // 设置空心部分的样式
        chart.drawHoleEnabled = true
        chart.holeRadiusPercent = 0.5
        chart.holeColor = .orange
        
        chart.transparentCircleRadiusPercent = 0.0
        
        // 设置饼图中央的标题文字
        chart.drawCenterTextEnabled = true
        chart.centerText = "收入"
        
        chart.legend.maxSizePercent = 0.0
        chart.legend.form = .empty
        chart.legend.textColor = .clear
        
        
        chart.backgroundColor = .white
        chart.frame = CGRect(x: 0, y: 200, width: w, height: h)
        self.view.addSubview(chart)
        
        chart.animate(xAxisDuration: 0.25, yAxisDuration: 0.25, easingOption: .linear)
        
        let e1 = PieChartDataEntry(value: 50, label: "工资")
        let e2 = PieChartDataEntry(value: 15, label: "奖金")
        let e3 = PieChartDataEntry(value: 20, label: "餐补")
        
        let set = PieChartDataSet(entries: [e1, e2, e3], label: "")
        set.selectionShift = 0
        set.colors = [UIColor.cyan, UIColor.brown, UIColor.green]
        set.xValuePosition = .outsideSlice
        set.yValuePosition = .outsideSlice
        set.valueLineWidth = 1.0
        set.valueLineColor = UIColor.xl_hexString("#333333")
        set.valueLinePart1OffsetPercentage = 0.8
        
        let data = PieChartData(dataSet: set)
        data.setValueTextColor(.black)
        
        //数值百分比格式化显示
        let pFormatter = NumberFormatter()
        pFormatter.numberStyle = .percent
        pFormatter.maximumFractionDigits = 2
        pFormatter.multiplier = 1
        pFormatter.percentSymbol = "%"
        data.setValueFormatter(DefaultValueFormatter(formatter: pFormatter))
        
        chart.data = data
    }
    
    func demo1()
    {
        let w = self.view.frame.width
        let h: CGFloat = 240
        
        let chart = AAChartView()
        chart.frame = CGRect(x: 0, y: 200, width: w, height: h)
        
//        let centerView = UIView()
//        centerView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
//        centerView.center = CGPoint(x: Int(w / 2), y: 120)
//        centerView.backgroundColor = .red
//        chart.addSubview(centerView)
        
        
        self.view.addSubview(chart)
        
        let model = AAChartModel()
        model.chartType = .pie
        model.title = "收入大类"
        model.subtitle = ""
        model.inverted = true
        model.dataLabelEnabled = true
        model.legendEnabled = false
//        model.backgroundColor = "#19B180"
        model.colorsTheme = ["#555555","#FE9C3C", "#bb9C39", "#F0113C"]
        
        let element = AASeriesElement()
        element.innerSize("50%")
        element.allowPointSelect(false)
        element.name("金额")
        element.borderWidth(0)
        element.borderColor("#000000")
//        let datas = [["工资: 50%", 50], ["奖金: 30%", 300], ["津贴: 20%", 200]]
        let datas = [["工资: 50%", 50]]
        element.data(datas)
        
        model.series = [element.toDic()!]
        chart.aa_drawChartWithChartModel(model)
    }

}

// 参考
// https://blog.csdn.net/kmonarch/article/details/82892250
// http://www.hangge.com/blog/cache/detail_2162.html
// http://www.hangge.com/blog/cache/detail_2163.html

/**
 //创建饼状图
 self.pieChartView = [[PieChartView alloc] initWithFrame:CGRectMake(20, 80, f_Device_w-40, 300)];
 [self.view addSubview:self.pieChartView];
 
 //基本样式
 [self.pieChartView setExtraOffsetsWithLeft:30 top:0 right:30 bottom:0];//饼状图距离边缘的间隙
 self.pieChartView.usePercentValuesEnabled = YES;//是否根据所提供的数据, 将显示数据转换为百分比格式
 self.pieChartView.dragDecelerationEnabled = YES;//拖拽饼状图后是否有惯性效果
 self.pieChartView.drawSliceTextEnabled = YES;//是否显示区块文本
 //空心饼状图样式
 self.pieChartView.drawHoleEnabled = YES;//饼状图是否是空心
 self.pieChartView.holeRadiusPercent = 0.5;//空心半径占比
 self.pieChartView.holeColor = [UIColor clearColor];//空心颜色
 self.pieChartView.transparentCircleRadiusPercent = 0.52;//半透明空心半径占比
 self.pieChartView.transparentCircleColor = [UIColor colorWithRed:210/255.0 green:145/255.0 blue:165/255.0 alpha:0.3];//半透明空心的颜色
 //实心饼状图样式
 //    self.pieChartView.drawHoleEnabled = NO;
 //饼状图中间描述
 if (self.pieChartView.isDrawHoleEnabled == YES) {
 self.pieChartView.drawCenterTextEnabled = YES;//是否显示中间文字
 //普通文本
 //        self.pieChartView.centerText = @"饼状图";//中间文字
 //富文本
 NSMutableAttributedString *centerText = [[NSMutableAttributedString alloc] initWithString:@"饼状图"];
 [centerText setAttributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:16],NSForegroundColorAttributeName: [UIColor orangeColor]} range:NSMakeRange(0, centerText.length)];
 self.pieChartView.centerAttributedText = centerText;
 }
 //饼状图描述
 self.pieChartView.descriptionText = @"饼状图示例";
 self.pieChartView.descriptionFont = [UIFont systemFontOfSize:10];
 self.pieChartView.descriptionTextColor = [UIColor grayColor];
 //饼状图图例
 self.pieChartView.legend.maxSizePercent = 1;//图例在饼状图中的大小占比, 这会影响图例的宽高
 self.pieChartView.legend.formToTextSpace = 5;//文本间隔
 self.pieChartView.legend.font = [UIFont systemFontOfSize:10];//字体大小
 self.pieChartView.legend.textColor = [UIColor grayColor];//字体颜色
 self.pieChartView.legend.position = ChartLegendPositionBelowChartCenter;//图例在饼状图中的位置
 self.pieChartView.legend.form = ChartLegendFormCircle;//图示样式: 方形、线条、圆形
 self.pieChartView.legend.formSize = 12;//图示大小
 //为饼状图提供数据
 self.pieCData = [self setData];
 self.pieChartView.data = self.pieCData;
 //设置动画效果
 [self.pieChartView animateWithXAxisDuration:1.0f easingOption:ChartEasingOptionEaseOutExpo];
 */
