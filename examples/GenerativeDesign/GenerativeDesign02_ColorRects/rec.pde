final String sketchname = getClass().getName();

import com.hamoid.*;
VideoExport videoExport;

void rec () {
  if (frameCount == 1) {
    videoExport = new VideoExport(this, "video/" + sketchname + ".mp4");
    videoExport.setFrameRate(30);
    videoExport.startMovie();
  }

  videoExport.saveFrame();
}

import java.util.Calendar;

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}

void keyReleased () {
  if (key == 's' || key == 'S') {
    saveFrame(timestamp() + "_##.png");
  }
}
