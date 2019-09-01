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
    
    var defaults: UserDefaults
    
    init() {
        let identifier = Bundle(for: DefaultsManager.self).bundleIdentifier
        defaults = ScreenSaverDefaults(forModuleWithName: identifier!)!
    }

    var canvasColor: NSColor {
        set(newColor) {
            setColor(newColor, key: "CanvasColor")
        }
        get {
            return getColor("CanvasColor") ?? NSColor.black
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

    func setColor(_ color: NSColor, key: String) {
        defaults.set(NSKeyedArchiver.archivedData(withRootObject: color), forKey: key)
        defaults.synchronize()
    }

    func getColor(_ key: String) -> NSColor? {
        if let canvasColorData = defaults.object(forKey: key) as? Data {
            return NSKeyedUnarchiver.unarchiveObject(with: canvasColorData) as? NSColor
        }
        return nil;
    }

    
    var size: Float {
        set(newSize) {
            defaults.set(newSize, forKey: "Size")
        }
        get {
            let v = defaults.float(forKey: "Size")
            return v > 0 ? v : 0.55
        }
    }
    
    var amplitude: Float {
        set(newSize) {
            defaults.set(newSize, forKey: "Amplitude")
        }
        get {
            let v = defaults.float(forKey: "Amplitude")
            return v > 0 ? v : 0.55
        }
    }
    
}
