import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
      
    // Set the window properties to make it fully invisible
    self.isOpaque = false
    self.backgroundColor = NSColor.clear
    
    // Remove the shadow and hide from the dock
    self.collectionBehavior = [.fullScreenNone]
    self.hasShadow = false // Removes the shadow
    
    // Prevent the window from being moved
    self.isMovable = false
    self.isMovableByWindowBackground = false
      
    let flutterViewController = FlutterViewController()
    self.contentViewController = flutterViewController

    RegisterGeneratedPlugins(registry: flutterViewController)

    super.awakeFromNib()
  }
  
  // Optionally, override mouse events to further enforce immovability
  override func mouseDown(with event: NSEvent) {
    // Do nothing to prevent dragging
  }

  override func mouseDragged(with event: NSEvent) {
    // Do nothing to prevent dragging
  }
  override func keyDown(with event: NSEvent) {
    // Do nothing or explicitly handle the event to suppress the beep
  }

  override func keyUp(with event: NSEvent) {
    // Do nothing or explicitly handle the event to suppress the beep
  }
}
