//
//  ViewController.swift
//  iGlance
//
//  Created by Cemal on 01.06.18.
//  Copyright © 2018 iGlance Corp. All rights reserved.
//

import Cocoa
import ServiceManagement

class ViewController: NSViewController {

    @IBOutlet weak var cbCPUUtil: NSButton! {
        didSet {
            cbCPUUtil.state = AppDelegate.UserSettings.userWantsCPUUtil ? NSButton.StateValue.on : NSButton.StateValue.off
        }
    }
    @IBOutlet weak var cbCPUTemp: NSButton! {
        didSet {
            cbCPUTemp.state = AppDelegate.UserSettings.userWantsCPUTemp ? NSButton.StateValue.on : NSButton.StateValue.off
        }
    }
    @IBOutlet weak var ddTempUnit: NSPopUpButton! {
        didSet {
            switch(AppDelegate.UserSettings.tempUnit)
            {
            case AppDelegate.TempUnit.Celcius:
                ddTempUnit.selectItem(at: 0)
                break;
            case AppDelegate.TempUnit.Fahrenheit:
                ddTempUnit.selectItem(at: 1)
                break;
            default:
                ddTempUnit.selectItem(at: 0)
            }
            
        }
    }
    @IBOutlet weak var cpCPU: NSColorWell! {
        didSet {
            cpCPU.color = AppDelegate.UserSettings.cpuColor
        }
    }
    @IBOutlet weak var cbAutostart: NSButton! {
        didSet {
            cbAutostart.state = (AppDelegate.UserSettings.userWantsAutostart) ? NSButton.StateValue.on : NSButton.StateValue.off
        }
    }
    @IBOutlet weak var ddUpdateInterval: NSPopUpButton! {
        didSet {
            switch (AppDelegate.UserSettings.updateInterval)
            {
            case 1.0:
                ddUpdateInterval.selectItem(at: 0)
                break;
            case 2.0:
                ddUpdateInterval.selectItem(at: 1)
                break;
            case 3.0:
                ddUpdateInterval.selectItem(at: 2)
                break;
            default:
                ddUpdateInterval.selectItem(at: 1)
            }
            
        }
    }
    @IBOutlet weak var btnCheckUpdate: NSButton!
    @IBOutlet weak var cbMemUtil: NSButton! {
        didSet {
            cbMemUtil.state = AppDelegate.UserSettings.userWantsMemUsage ? NSButton.StateValue.on : NSButton.StateValue.off
        }
    }
    @IBOutlet weak var cpMemUtil: NSColorWell! {
        didSet {
            cpMemUtil.color = AppDelegate.UserSettings.memColor
        }
    }
    @IBOutlet weak var cbNetUsage: NSButton! {
        didSet {
            cbNetUsage.state = AppDelegate.UserSettings.userWantsBandwidth ? NSButton.StateValue.on : NSButton.StateValue.off
        }
    }
    @IBOutlet weak var cbFanSpeed: NSButton! {
        didSet {
            cbFanSpeed.state = AppDelegate.UserSettings.userWantsFanSpeed ? NSButton.StateValue.on : NSButton.StateValue.off
        }
    }
    //MARK: Properties
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewDidDisappear()
    {
        super.viewDidDisappear()
        print("ohhhh")
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func cbCPUTemp_clicked(_ sender: NSButton) {
        AppDelegate.UserSettings.userWantsCPUTemp = (cbCPUTemp.state == NSButton.StateValue.on)
    }
    
    @IBAction func cbCPUUtil_clicked(_ sender: NSButton) {
        AppDelegate.UserSettings.userWantsCPUUtil = (cbCPUUtil.state == NSButton.StateValue.on)
    }
    @IBAction func cpCPU_clicked(_ sender: NSColorWell) {
        AppDelegate.UserSettings.cpuColor = sender.color
    }
    @IBAction func ddTempUnit_clicked(_ sender: Any) {
        AppDelegate.UserSettings.tempUnit = ddTempUnit.indexOfSelectedItem == 0 ? AppDelegate.TempUnit.Celcius : AppDelegate.TempUnit.Fahrenheit
    }
    
    @IBAction func cbAutostart_clicked(_ sender: NSButton) {
        AppDelegate.UserSettings.userWantsAutostart = (cbAutostart.state == NSButton.StateValue.on)
        if (cbAutostart.state == NSButton.StateValue.on) {
            if !SMLoginItemSetEnabled(NCConstants.launcherApplicationIdentifier as CFString, true) {
                print("The login item was not successfull")
            }
            else {
                UserDefaults.standard.set("true", forKey: "appLoginStart")
                print("autostart true")
            }
        }
        else {
            if !SMLoginItemSetEnabled(NCConstants.launcherApplicationIdentifier as CFString, false) {
                print("The login item was not successfull")
            }
            else {
                UserDefaults.standard.set("false", forKey: "appLoginStart")
                print("autostart false")
            }
        }
    }
    @IBAction func ddUpdateInterval_clicked(_ sender: NSPopUpButton) {
        switch (ddUpdateInterval.indexOfSelectedItem)
            
        {
        case 0:
            AppDelegate.UserSettings.updateInterval = 1.0
            break
        case 1:
            AppDelegate.UserSettings.updateInterval = 2.0
            break
        case 2:
            AppDelegate.UserSettings.updateInterval = 3.0
            break
        default:
            AppDelegate.UserSettings.updateInterval = 2.0
        }
    }
    @IBAction func btnCheckUpdate_clicked(_ sender: NSButton) {
    }
    
    @IBAction func cbMemUtil_clicked(_ sender: NSButton) {
        AppDelegate.UserSettings.userWantsMemUsage = (cbMemUtil.state == NSButton.StateValue.on)
    }
    
    @IBAction func cpMem_clicked(_ sender: NSColorWell) {
        AppDelegate.UserSettings.memColor = sender.color
    }
    
    @IBAction func cbNetUsage_clicked(_ sender: NSButton) {
        AppDelegate.UserSettings.userWantsBandwidth = (cbNetUsage.state == NSButton.StateValue.on)
    }
    
    @IBAction func cbFanSpeed_clicked(_ sender: NSButton) {
        AppDelegate.UserSettings.userWantsFanSpeed = (cbFanSpeed.state == NSButton.StateValue.on)
    }
    //MARK: Actions
}

