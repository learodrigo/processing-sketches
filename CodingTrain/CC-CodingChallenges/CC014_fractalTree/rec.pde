final String sketchname = getClass().getName();

import com.hamoid.*;
VideoExport videoExport;

void rec () {
  if (frameCount == 1) {
    videoExport = new VideoExport(this, "frames/" + sketchname + "-004" + ".mp4");
    videoExport = new VideoExport(this, sketchname + "-004" + ".mp4");
    videoExport.setFrameRate(30);
    videoExport.startMovie();
  }
  
  videoExport.saveFrame();
}
