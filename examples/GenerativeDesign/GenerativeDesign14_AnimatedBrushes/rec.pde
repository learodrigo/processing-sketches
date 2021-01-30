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
  switch (key) {
    case 'b':
    case 'B':    
      showGrid = !showGrid;
      break;
    case 's':
    case 'S':
      saveFrame(timestamp() + "_##.png");
      break;
    case ' ':
      background(0);
      break;
    case '1':
      angleSpeed = 1;
      break;
    case '2':
      angleSpeed = 2;
      break;
    case '3':
      angleSpeed = 3;
      break;
    case '4':
      angleSpeed = 4;
      break;
    case '5':
      angleSpeed = 5;
      break;
    case '6':
      angleSpeed = 6;
      break;
    case '7':
      angleSpeed = 7;
      break;
    case '8':
      angleSpeed = 8;
      break;
    case '9':
      angleSpeed = 9;
      break;
    case '0':
      angleSpeed = 10;
      break;
  }
}
