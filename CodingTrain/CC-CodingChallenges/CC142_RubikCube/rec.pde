final String sketchname = getClass().getName();

import com.hamoid.*;
VideoExport videoExport;

void rec () {
  if (frameCount == 1) {
    videoExport = new VideoExport(this, sketchname + ".mp4");
    videoExport.setFrameRate(20);
    videoExport.startMovie();
  }
  
  videoExport.saveFrame();
}
