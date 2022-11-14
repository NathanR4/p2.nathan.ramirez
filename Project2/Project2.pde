
float calx = 100;
float caly;
int calSize = 150;
boolean overCal = false;
boolean calEnabled = true;
boolean callocked = false;
float calTextSize;
float calTextx;
float calTexty;
float xCalOffset = 0.0;
float yCalOffset = 0.0;
int day = day();
int month = month();
int year = year();
Table cal;
boolean overCalToggle, overWeaToggle, overHeaToggle, overSocToggle, overNewToggle;


float weax = 800;
float weay = 0;
int weaSize = 150;
boolean overWea = false;
boolean weaEnabled = true;
boolean wealocked = false;
float weaTextSize;
float weaTextx;
float weaTexty;
float xWeaOffset = 0.0;
float yWeaOffset = 0.0;
Table weather;
String current, low, high, status;
int hour, min;
boolean am = false, pm = false;


float socx = 100;
float socy = 1120;
int socSize = 150;
boolean overSoc = false;
boolean overSocButton = false;
boolean socEnabled = true;
boolean soclocked = false;
float socTextSize;
float socTextx;
float socTexty;
float xSocOffset = 0.0;
float ySocOffset = 0.0;
Table socials;
Table messages;
boolean isSocials = true;


float newx = 380;
float newy = 970;
int newSize = 300;
boolean overNew = false;
boolean overNewButton = false;
boolean newEnabled = true;
boolean newlocked = false;
float newTextSize;
float newTextx;
float newTexty;
float xNewOffset = 0.0;
float yNewOffset = 0.0;
int savedTime, totalTime=5000, counter = 2;
PImage news;


float heax = 700;
float heay = 1120;
int heaSize = 150;
boolean heaSoc = false;
boolean overHea = false;
boolean overWeight = false, overSleep = false, overSteps = false;
boolean heaEnabled = true;
boolean healocked = false;
float heaTextSize;
float heaTextx;
float heaTexty;
float xHeaOffset = 0.0;
float yHeaOffset = 0.0;
boolean isSleep = true, isWeight = false, isSteps = false;
Table sleep, weight, steps;

boolean overTab = false;
boolean tabOn = false;
PShape bars;

void setup() {
  size(1000, 1300);
  weather = loadTable("weather.csv", "header");
  for (TableRow row : weather.rows()) {
    current = row.getString("current");
    low = row.getString("low");
    high = row.getString("high");
    status = row.getString("status");
  }
  socials = loadTable("socials.csv", "header");
  messages = loadTable("messages.csv", "header");
  sleep = loadTable("sleep.csv", "header");
  weight = loadTable("weight.csv", "header");
  steps = loadTable("steps.csv", "header");
  cal = loadTable("calendar1.csv", "header");
  bars = loadShape("bars.svg");
  savedTime = millis(); 
  news = loadImage("news1.png");
}

void draw() { 
  strokeWeight(1);
  background(211, 211, 211);
  rect(-1, 1250, 50, 50);
  bars.disableStyle();
  fill(255);
  scale(.10);
  shape(bars, 100, 12600);
  scale(10);
  
  int passedTime = millis()-savedTime;
  if(passedTime > totalTime) {
   news = loadImage("news"+counter+".png");
   print(counter);
   if(counter == 3) {
     counter = 0;
   }
   savedTime=millis();
   counter+=1;
  }
  
  
  if(mouseX > 0 && mouseX < 50 &&
     mouseY > 1250 && mouseY < 1300) {
       overTab = true;
   }
   else {
     overTab = false;
   }
   
   if(tabOn) {
     fill(112, 128, 144);
     rect(0, 0, 150, 1300);
     fill(0);
     rect(-1, 1250, 50, 50);
     fill(255);
     scale(.10);
     shape(bars, 100, 12600);
     scale(10);
     fill(0);
     textSize(16);
     text("Calendar: ", 20, 30);
     fill(255);
     rect(95, 15, 21, 21);
     if(calEnabled) {
       fill(0);
       rect(98, 18, 15, 15);
     }
     
     fill(0);
     text("Weather: ", 20, 60);
     fill(255);
     rect(95, 45, 21, 21);
     if(weaEnabled) {
       fill(0);
       rect(98, 48, 15, 15);
     }
     
     fill(0);
     text("Socials: ", 20, 90);
     fill(255);
     rect(95, 75, 21, 21);
     if(socEnabled) {
       fill(0);
       rect(98, 78, 15, 15);
     }
     
     fill(0);
     text("Health: ", 20, 120);
     fill(255);
     rect(95, 105, 21, 21);
     if(heaEnabled) {
       fill(0);
       rect(98, 108, 15, 15);
     }
     
     fill(0);
     text("News: ", 20, 150);
     fill(255);
     rect(95, 135, 21, 21);
     if(newEnabled) {
       fill(0);
       rect(98, 138, 15, 15);
     }
   }
   
  if (mouseX > 98 && mouseX < 110 && 
      mouseY > 18 && mouseY < 32) {
    overCalToggle = true;  
  } else {
    overCalToggle = false;
  }
  
  if (mouseX > 98 && mouseX < 110 && 
      mouseY > 38 && mouseY < 62) {
    overWeaToggle = true;  
  } else {
    overWeaToggle = false;
  }
  
  if (mouseX > 98 && mouseX < 110 && 
      mouseY > 75 && mouseY < 95) {
    overSocToggle = true;  
  } else {
    overSocToggle = false;
  }
  
  if (mouseX > 98 && mouseX < 110 && 
      mouseY > 105 && mouseY < 120) {
    overHeaToggle = true;  
  } else {
    overHeaToggle = false;
  }
   
  if (mouseX > 98 && mouseX < 110 && 
      mouseY > 135 && mouseY < 150) {
    overNewToggle = true;  
  } else {
    overNewToggle = false;
  }
   
  
  if (mouseX > calx-calSize && mouseX < calx+calSize && 
      mouseY > caly-calSize && mouseY < caly+calSize-100) {
    overCal = true;  
    if(!callocked) { 
    } 
  } else {
    stroke(153);
    fill(0);
    overCal = false;
  }
  
  if (mouseX > weax-weaSize && mouseX < weax+weaSize && 
      mouseY > weay-weaSize && mouseY < weay+weaSize-100) {
    overWea = true;  
    if(!wealocked) { 
    } 
  } else {
    stroke(153);
    fill(0);
    overWea = false;
  }
  
   if (mouseX > socx-socSize+100 && mouseX < socx+socSize && 
      mouseY > socy-socSize+100 && mouseY < socy+socSize-100) {
    overSoc = true;  
    if(!soclocked) { 
    } 
  } else {
    stroke(153);
    fill(0);
    overSoc = false;
  }
  
  if (mouseX > newx-newSize+100 && mouseX < newx+newSize && 
      mouseY > newy-newSize+100 && mouseY < newy+newSize-100) {
    overNew = true;  
  } else {
    stroke(153);
    fill(0);
    overNew = false;
  }
  
  if (mouseX > socx+50 && mouseX < socx+socSize+100 && 
      mouseY > socy-socSize+100 && mouseY < socy+socSize-100) {
    overSocButton = true;  
  }
  else {
    overSocButton = false;
  }
  
  if (mouseX > heax-heaSize+100 && mouseX < heax+heaSize && 
      mouseY > heay-heaSize+100 && mouseY < heay+heaSize-100) {
    overHea = true;  
    if(!healocked) { 
    } 
  } else {
    stroke(153);
    fill(0);
    overHea = false;
  }
  
  if (mouseX > heax+30 && mouseX < heax+heaSize-40 && 
      mouseY > heay && mouseY < heay+30) {
    overSleep = true;  
  }
  else {
    overSleep = false;
  }
  
  if (mouseX > heax+70 && mouseX < heax+heaSize+90 && 
      mouseY > heay && mouseY < heay+30) {
    overWeight = true;  
  }
  else {
    overWeight = false;
  }
  
  if (mouseX > heax+150 && mouseX < heax+heaSize+120 && 
      mouseY > heay && mouseY < heay+30) {
    overSteps = true;  
  }
  else {
    overSteps = false;
  }
  
  strokeWeight(1);
  if(calEnabled) {
    fill(178, 190, 181);
    strokeWeight(1);
    rect(calx, caly, calSize, calSize);
    fill(0);
    textSize(calSize/8);
    fill(0);
    line(calx, caly+30, calx+calSize, caly+30);
    text("Calendar", calx+40, caly+20); 
    textSize(calSize/7);
    text("Nov, " + String.valueOf(day) + ", " + String.valueOf(year), calx+20, caly+55); 
    line(calx, caly+65, calx+calSize, caly+65);
    float spacing = caly+90;
    textSize(calSize/10);
    for (TableRow row : cal.rows()) {
      String event = row.getString("event");
      text(event, calx + 10, spacing);
      spacing += 25;
    }
  }
  
  if(weaEnabled) {
    fill(178, 190, 181);
    rect(weax, weay, weaSize, weaSize);
    fill(0);
    textSize(weaSize/8);
    line(weax, weay+30, weax+weaSize, weay+30);
    text("Weather", weax+45, weay+20); 
    textSize(weaSize/10);
    text("Low: " + low, weax+15, weay+50);
    text("High: " + high, weax+85, weay+50);
    text(status, weax+15, weay + 85);
    textSize(weaSize/5);
    text(current, weax + 85, weay + 90);
    hour = hour();
    if(hour < 12) {
      am = true;
    }
    else{
     pm = true;
     hour -= 12;
    }
    min = minute();
    textSize(weaSize/5);
    if(am) {
      text(str(hour) + " : " + str(min) + " AM", weax + 25, weay + 130);
    }
    if(pm) {
      text(str(hour) + " : " + str(min) + " PM", weax + 25, weay + 130);
    }
  }
  
  
  if(newEnabled) {
    fill(178, 190, 181);
    rect(newx, newy, newSize, newSize);
    fill(0);
    textSize(newSize/9);
    text("News", newx+110, newy+25); 
    line(newx, newy+30, newx+newSize, newy+30);
 
    image(news, newx+10, newy+40);
    
  }
  
  if(socEnabled) {
    fill(178, 190, 181);
    rect(socx, socy, socSize+110, socSize);
    fill(0);
    textSize(socSize/8);
    line(socx, socy+30, socx+socSize+110, socy+30);
    text("Socials        Messages", socx+60, socy+20); 
    textSize(socSize/10);
    float notifSpacing = socy + 20;
    
    if(isSocials) {
      strokeWeight(2);
      stroke(0);
      line(socx+50, socy+25, socx+120, socy+25);
      for (TableRow row : socials.rows()) {
        notifSpacing += 30;
        String time = row.getString("time");
        String notif = row.getString("notif");
        text(time + " : " +  notif, socx+5, notifSpacing);
      }
    }
    else {
      strokeWeight(2);
      stroke(0);
      line(socx+135, socy+25, socx+220, socy+25);
      for (TableRow row : messages.rows()) {
        notifSpacing += 30;
        String from = row.getString("from");
        String message = row.getString("message");
        text(from + " : " +  message, socx+5, notifSpacing);
      }
    }
  }
  
  strokeWeight(0);
  if(heaEnabled) {
    fill(178, 190, 181);
    rect(heax, heay, heaSize+110, heaSize);
    fill(0);
    textSize(heaSize/8);
    line(heax, heay+30, heax+heaSize, heay+30);
    line(heax, heay+30, heax+heaSize+110, heay+30);
    text("Sleep      Weight      Steps", heax+40, heay+20); 
    textSize(heaSize/10);
    
    if(isSleep) {
      strokeWeight(2);
      stroke(0);
      line(heax+35, heay+25, heax+85, heay+25);
      float ySpacing = heay + 20;
      float xSpacing = heax + 55;
      textSize(heaSize/12);
      ySpacing += 100;
      text("4 Hrs", heax+10, ySpacing);
      strokeWeight(.5);
      line(heax+40, ySpacing-5, heax+250, ySpacing-5);
      text("6 Hrs", heax+10, ySpacing-25);
      line(heax+40, ySpacing-30, heax+250, ySpacing-30);
      text("8 Hrs", heax+10, ySpacing-50);
      line(heax+40, ySpacing-55, heax+250, ySpacing-55);
      text("10 Hrs", heax+10, ySpacing-75);
      line(heax+45, ySpacing-80, heax+250, ySpacing-80);
      for (TableRow row : sleep.rows()) {
        String day = row.getString("day");
        float sleep = row.getFloat("sleep");
        circle(xSpacing, ((24-sleep)*11)+heay-110, 10);
        text(day, xSpacing-15, ySpacing+20);
        xSpacing += 40;
      }
    }
    
    if(isWeight) {
      strokeWeight(2);
      stroke(0);
      line(heax+100, heay+25, heax+160, heay+25);
      float ySpacing = heay + 20;
      float xSpacing = heax + 55;
      textSize(heaSize/12);
      ySpacing += 100;
      text("160lbs", heax+10, ySpacing);
      strokeWeight(.5);
      line(heax+40, ySpacing-5, heax+250, ySpacing-5);
      text("170lbs", heax+10, ySpacing-25);
      line(heax+40, ySpacing-30, heax+250, ySpacing-30);
      text("180lbs", heax+10, ySpacing-50);
      line(heax+40, ySpacing-55, heax+250, ySpacing-55);
      text("190lbs", heax+10, ySpacing-75);
      line(heax+45, ySpacing-80, heax+250, ySpacing-80);
      for (TableRow row : weight.rows()) {
        String day = row.getString("day");
        float weight = row.getFloat("weight");
        circle(xSpacing, ((160-weight)*2)+heay+105, 10);
        text(day, xSpacing-15, ySpacing+20);
        xSpacing += 40;
      }
    }
    
    if(isSteps) {
      strokeWeight(2);
      stroke(0);
      line(heax+175, heay+25, heax+225, heay+25);
      float ySpacing = heay + 20;
      float xSpacing = heax + 55;
      textSize(heaSize/12);
      ySpacing += 100;
      text("4000", heax+10, ySpacing);
      strokeWeight(.5);
      line(heax+40, ySpacing-5, heax+250, ySpacing-5);
      text("5000", heax+10, ySpacing-25);
      line(heax+40, ySpacing-30, heax+250, ySpacing-30);
      text("6000", heax+10, ySpacing-50);
      line(heax+40, ySpacing-55, heax+250, ySpacing-55);
      text("7000", heax+10, ySpacing-75);
      line(heax+40, ySpacing-80, heax+250, ySpacing-80);
      for (TableRow row : steps.rows()) {
        String day = row.getString("day");
        float steps = row.getFloat("steps");
        circle(xSpacing, (100-(steps/100)*1.9)+heay+85, 10);
        text(day, xSpacing-15, ySpacing+20);
        xSpacing += 40;
      }
    }
  }
  
}

void mousePressed() {
  if(overCalToggle) {
    calEnabled = !calEnabled;
  }
 
 if(overNewToggle) {
    newEnabled = !newEnabled;
  }
 
 if(overWeaToggle) {
    weaEnabled = !weaEnabled;
  }
  
  if(overSocToggle) {
    socEnabled = !socEnabled;
  }
  
  if(overHeaToggle) {
    heaEnabled = !heaEnabled;
  }
  
  if(overTab) {
    tabOn = !tabOn;
  }
  
  if(overCal) { 
    callocked = true; 
    fill(211, 211, 211);
    xCalOffset = mouseX-calx; 
    yCalOffset = mouseY-caly; 
  } 
  else {
    callocked = false;
  }

  
  if(overWea) { 
    wealocked = true; 
    fill(211, 211, 211);
    xWeaOffset = mouseX-weax; 
    yWeaOffset = mouseY-weay; 
  } 
  else {
    wealocked = false;
  }
  
  if(overSoc) { 
    soclocked = true; 
    fill(211, 211, 211);
    xSocOffset = mouseX-socx; 
    ySocOffset = mouseY-socy; 
  } 
  else {
    soclocked = false;
  }
  
  if(overNew) { 
    newlocked = true; 
    fill(211, 211, 211);
    xNewOffset = mouseX-newx; 
    yNewOffset = mouseY-newy; 
  } 
  else {
    newlocked = false;
  }

  if(overSocButton) {
    isSocials = !isSocials;
  }
  
  if(overHea) { 
    healocked = true; 
    fill(211, 211, 211);
    xHeaOffset = mouseX-heax; 
    yHeaOffset = mouseY-heay; 
  } 
  else {
    healocked = false;
  }

  if(overWeight) {
    isSleep = false;
    isSteps = false;
    isWeight = true;
  }
  if(overSleep) {
    isSleep = true;
    isSteps = false;
    isWeight = false;
  }
  if(overSteps) {
    isSleep = false;
    isSteps = true;
    isWeight = false;
  }
}

void mouseDragged() {
  if(callocked) {
    calx = mouseX-xCalOffset; 
    caly = mouseY-yCalOffset; 
  }
  if(wealocked) {
    weax = mouseX-xWeaOffset; 
    weay = mouseY-yWeaOffset; 
  }
  if(soclocked) {
    socx = mouseX-xSocOffset; 
    socy = mouseY-ySocOffset; 
  }
  if(healocked) {
    heax = mouseX-xHeaOffset; 
    heay = mouseY-yHeaOffset; 
  }
  
  if(newlocked) {
    newx = mouseX-xNewOffset; 
    newy = mouseY-yNewOffset; 
  }
}

void mouseReleased() {
 callocked = false;
 wealocked = false;
 soclocked = false;
 healocked = false;
 newlocked = false;
}
