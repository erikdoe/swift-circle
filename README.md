# swift-circle

Small screensaver for OS X written entirely in Swift. Includes configuration sheet and user defaults access.

If you want to run the latest build from Xcode using the shared scheme you have to create a symlink to the build products in the screen savers directory, e.g.

    cd ~/Library/Screen\ Savers/
    ln -s ../Developer/Xcode/DerivedData/SwiftCircle-fnjybnzpxxgbfpcfligmifriixpo/Build/Products/Debug/SwiftCircle.saver
		
Please don't just copy paste these two lines. The exact location of the build output is going to be different in your case.
