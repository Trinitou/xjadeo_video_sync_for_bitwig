loadAPI(17);

host.setShouldFailOnDeprecatedUse(true);

host.defineController("XJadeo", "XJadeo Video Sync", "0.2", "295c10cb-b8d6-416b-9be5-dc2375936ac0", "Trinitou");

var oscConnection;

var lastOnTopState;
function invalidateLastOnTopState() {
   lastOnTopState = null;
}
function updateOnTop(onTop) {
   if(onTop == lastOnTopState)
      return;
   oscConnection.sendMessage("/jadeo/cmd", "window ontop " + (onTop ? "on" : "off"));
   lastOnTopState = onTop;
   host.println("Sent 'Keep on top' state: " + (onTop ? "on" : "off"));
}

var lastVideoPath;
function invalidateLastVideoPath() {
   lastVideoPath = null;
}
function updateVideo(path) {
   if (path === lastVideoPath)
      return false;
   oscConnection.sendMessage("/jadeo/load", path); // sending an empty path will close current video file
   host.println("Sent video path: '" + path + "'");
   lastVideoPath = path;
   return true;
}

var lastFrame;
function invalidateLastFrame() {
   lastFrame = -1;
}
function updateFrame(frame) {
   if (oscConnection == null) {
      invalidateLastFrame();
      return;
   }
   if (frame != lastFrame) {
      oscConnection.sendMessage("/jadeo/seek", frame);
      lastFrame = frame;
      // host.println("Sent frame: " + lastFrame);
   }
}

var lastLoopState;
function invalidateLastLoopState() {
   lastLoopState = null;
}
function updateLoop(loop) {
   if(loop == lastLoopState)
      return;
   oscConnection.sendMessage("/jadeo/art/loop", loop ? 1 : 0);
   lastLoopState = loop;
   host.println("Sent 'Loop' state: " + (loop ? "on" : "off"));
}

function invalidateAll() {
   invalidateLastOnTopState();
   invalidateLastVideoPath();
   invalidateLastFrame();
   invalidateLastLoopState();
}

var onTopSetting;
var pathSetting;
var frameRateSetting;
var loopSetting;
var pos;

function init() {   
   oscConnection = host.getOscModule().connectToUdpServer("localhost", 12345, null);
   
   let prefs = host.getPreferences();

   onTopSetting = prefs.getBooleanSetting("Keep on top", "Video window", true);
   onTopSetting.markInterested();

   let docState = host.getDocumentState();

   pathSetting = docState.getStringSetting("Path", "File", 256, "");
   pathSetting.markInterested();

   frameRateSetting = docState.getNumberSetting("FPS", "File", 24, 60, 0.01, "", 24);
   frameRateSetting.markInterested();

   loopSetting = docState.getBooleanSetting("Loop", "File", false);
   loopSetting.markInterested();

   // add flush command to both the preferences and document state for easy access:
   let settings = [prefs, docState];
   for(var i = 0; i < settings.length; i++) {
      settings[i].getSignalSetting("Flush", "Video window", "Flush!").addSignalObserver(function () {
         invalidateAll();
      });
   }

   pos = host.createTransport().playPositionInSeconds();
   pos.markInterested();

   invalidateAll();

   println("XJadeo Video Sync initialized!");
}

function flush() {
   updateOnTop(onTopSetting.get());
   if (updateVideo(pathSetting.get()))
      invalidateLastFrame();
   updateFrame(Math.floor(pos.get() * frameRateSetting.getRaw()));
   updateLoop(loopSetting.get());
}

function exit() {
   updateVideo("");
}
