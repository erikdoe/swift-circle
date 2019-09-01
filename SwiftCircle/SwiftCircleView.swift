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


// http://www.raywenderlich.com/74438/swift-tutorial-a-quick-start
// http://stackoverflow.com/questions/27852616/do-swift-screensavers-work-in-mac-os-x-before-yosemite


import ScreenSaver

public class SwiftCircleView : ScreenSaverView {
    
    var defaultsManager: DefaultsManager = DefaultsManager()
    lazy var sheetController: ConfigureSheetController = ConfigureSheetController()
    
    var circleSize: Float = 100
    var amplitude: Float = 0.5
    var canvasColor: NSColor?
    var circleColor: NSColor?
    var frameCount = 0
    
    
    override init?(frame: NSRect, isPreview: Bool) {
        super.init(frame: frame, isPreview: isPreview)
        animationTimeInterval = 1.0 / 60.0
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override public var hasConfigureSheet: Bool {
        return true
    }
    
    override public var configureSheet: NSWindow? {
        return sheetController.window
    }

    
    override public func startAnimation() {
        super.startAnimation()
        cacheColors()
        needsDisplay = true
    }
    
    override public func stopAnimation() {
        super.stopAnimation()
    }
    

    override public func draw(_ rect: NSRect) {
        super.draw(rect)
        cacheColors()
        drawBackground()
     }
    
    override public func animateOneFrame() {
        window!.disableFlushing()
        drawCircle(canvasColor!, diameter: CGFloat(circleSize+amplitude))
        let r = CGFloat(sin(Float(frameCount) / 40) * amplitude + circleSize)
        drawCircle(circleColor!, diameter: r)
        frameCount += 1
        window!.enableFlushing()
    }
    
    
    func cacheColors() {
        circleSize = Float(bounds.size.height) / 4 * defaultsManager.size
        amplitude = circleSize * defaultsManager.amplitude * 0.75
        canvasColor = defaultsManager.canvasColor
        circleColor = defaultsManager.circleColor
    }
    
    func drawBackground() {
        let bPath:NSBezierPath = NSBezierPath(rect: bounds)
        canvasColor!.set()
        bPath.fill()
    }

    func drawCircle(_ color: NSColor, diameter: CGFloat) {
        let circleRect = NSMakeRect(bounds.size.width/2 - diameter/2, bounds.size.height/2 - diameter/2, diameter, diameter)
        let cPath: NSBezierPath = NSBezierPath(ovalIn: circleRect)
        color.set()
        cPath.fill()
    }
    
}
    

