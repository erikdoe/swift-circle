/*
 *  Copyright 2015 Erik Doernenburg
 *
 *  Licensed under the Apache License, Version 2.0 (the "License"); you may
 *  not use these files except in compliance with the License. You may obtain
 *  a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 *  WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 *  License for the specific language governing permissions and limitations
 *  under the License.
 */


import Cocoa

class ConfigureSheetController : NSObject {
    
    var defaultsManager = DefaultsManager()

    @IBOutlet var window: NSWindow?
    @IBOutlet var circleColorWell: NSColorWell?
    @IBOutlet var canvasColorWell: NSColorWell?

    override init() {
        super.init()
        let myBundle = NSBundle(forClass: ConfigureSheetController.self)
        myBundle.loadNibNamed("ConfigureSheet", owner: self, topLevelObjects: nil)
        canvasColorWell!.color = defaultsManager.canvasColor
        circleColorWell!.color = defaultsManager.circleColor
    }

    @IBAction func updateDefaults(sender: AnyObject) {
        defaultsManager.canvasColor = canvasColorWell!.color
        defaultsManager.circleColor = circleColorWell!.color
    }
   
    @IBAction func closeConfigureSheet(sender: AnyObject) {
        NSApp.endSheet(window!)
    }

}
