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


import ScreenSaver

class DefaultsManager {
    
    var defaults: NSUserDefaults
    
    init() {
        let identifier = NSBundle(forClass: DefaultsManager.self).bundleIdentifier
        defaults = ScreenSaverDefaults.defaultsForModuleWithName(identifier) as NSUserDefaults
    }

    var canvasColor: NSColor {
        set(newColor) {
            setColor(newColor, key: "CanvasColor")
        }
        get {
            return getColor("CanvasColor") ?? NSColor.blackColor()
        }
    }

    var circleColor: NSColor {
        set(newColor) {
            setColor(newColor, key: "CircleColor")
        }
        get {
            return getColor("CircleColor") ?? NSColor(red: 1, green: 0.5, blue: 0.0, alpha: 1.0)
        }
    }

    func setColor(color: NSColor, key: String) {
        defaults.setObject(NSKeyedArchiver.archivedDataWithRootObject(color), forKey: key)
        defaults.synchronize()
    }

    func getColor(key: String) -> NSColor? {
        if let canvasColorData = defaults.objectForKey(key) as? NSData {
            return NSKeyedUnarchiver.unarchiveObjectWithData(canvasColorData) as? NSColor
        }
        return nil;
    }

    
    var size: Float {
        set(newSize) {
            defaults.setFloat(newSize, forKey: "Size")
        }
        get {
            let v = defaults.floatForKey("Size")
            return v > 0 ? v : 0.55
        }
    }
    
    var amplitude: Float {
        set(newSize) {
            defaults.setFloat(newSize, forKey: "Amplitude")
        }
        get {
            let v = defaults.floatForKey("Amplitude")
            return v > 0 ? v : 0.55
        }
    }
    
}