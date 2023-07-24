String lines[];
int slides[];
int types[];

int w = 640;
int h = 480;
int n = 0;
int m = 0;
int s = 0;

static final int TITLE = 0;
static final int SUBTITLE = 1;
static final int AUTHOR = 2;
static final int INSTITUTE = 3;
static final int DATE = 4;
static final int THEME = 5;
static final int HEADER1 = 6;
static final int HEADER2 = 7;
static final int HEADER3 = 8;
static final int HEADER4 = 9;
static final int HEADER5 = 10;
static final int HEADER6 = 11;
static final int DIVISION = 12;
static final int BLOCKQUOTE1 = 13;
static final int BLOCKQUOTE2 = 14;
static final int BLOCKQUOTE3 = 15;
static final int ULIST = 16;
static final int PICTURE = 17;
static final int CODE = 18;
static final int PARAGRAPH = 19;
static final int SIZE = 20;
static final int UNDEFINED = 21;

void setup() {
  size(640,480);
  loadMarkdown("progresivas.md");
}

void loadMarkdown(String filename) {
  lines = loadStrings(filename);
  m = lines.length;
  types = new int[m];
  slides = new int[m];
  slides[0] = 0;
  n = 1;
  for (int i=0; i<m; i++) {
    if ((lines[i].length()>=6) && (lines[i].substring(0, 6).equals("title:"))) {
      types[i] = TITLE;
      lines[i] = lines[i].substring(7);
    } else if ((lines[i].length()>=9) && (lines[i].substring(0, 9).equals("subtitle:"))) {
      types[i] = SUBTITLE;
      lines[i] = lines[i].substring(10);
    } else if ((lines[i].length()>=7) && (lines[i].substring(0, 7).equals("author:"))) {
      types[i] = AUTHOR;
      lines[i] = lines[i].substring(8);
    } else if ((lines[i].length()>=10) && (lines[i].substring(0, 10).equals("institute:"))) {
      types[i] = INSTITUTE;
      lines[i] = lines[i].substring(11);
    } else if ((lines[i].length()>=5) && (lines[i].substring(0, 5).equals("date:"))) {
      types[i] = DATE;
      lines[i] = lines[i].substring(6);
    } else if ((lines[i].length()>=6) && (lines[i].substring(0, 6).equals("######"))) {
      types[i] = HEADER6;
      lines[i] = lines[i].substring(7);
    } else if ((lines[i].length()>=5) && (lines[i].substring(0, 5).equals("#####"))) {
      types[i] = HEADER5;
      lines[i] = lines[i].substring(6);
    } else if ((lines[i].length()>=4) && (lines[i].substring(0, 4).equals("####"))) {
      types[i] = HEADER4;
      lines[i] = lines[i].substring(5);
    } else if ((lines[i].length()>=3) && (lines[i].substring(0, 3).equals("###"))) {
      types[i] = HEADER3;
      lines[i] = lines[i].substring(4);
    } else if ((lines[i].length()>=2) && (lines[i].substring(0, 2).equals("##"))) {
      types[i] = HEADER2;
      lines[i] = lines[i].substring(3);
      slides[n] = i;
      n++;
    } else if ((lines[i].length()>=1) && (lines[i].substring(0, 1).equals("#"))) {
      types[i] = HEADER1;
      lines[i] = lines[i].substring(2);
      slides[n] = i;
      n++;
    } else if ((lines[i].length()>=3) && (lines[i].substring(0, 3).equals("---"))) {
      types[i] = UNDEFINED;
    } else if ((lines[i].length()>=2) && (lines[i].substring(0, 2).equals("--"))) {
      types[i] = DIVISION;
      lines[i] = lines[i].substring(3);
      slides[n] = i;
      n++;
    } else if ((lines[i].length()>=3) && (lines[i].substring(0, 3).equals(">>>"))) {
      types[i] = BLOCKQUOTE3;
      lines[i] = lines[i].substring(4);
    } else if ((lines[i].length()>=2) && (lines[i].substring(0, 2).equals(">>"))) {
      types[i] = BLOCKQUOTE2;
      lines[i] = lines[i].substring(3);
    } else if ((lines[i].length()>=1) && (lines[i].substring(0, 1).equals(">"))) {
      types[i] = BLOCKQUOTE1;
      lines[i] = lines[i].substring(2);
    } else if ((lines[i].length()>=1) && (lines[i].substring(0, 1).equals("-"))) {
      types[i] = ULIST;
      lines[i] = lines[i].substring(2);
    } else if ((lines[i].length()>=1) && (lines[i].substring(0, 1).equals("*"))) {
      types[i] = ULIST;
      lines[i] = lines[i].substring(2);
    } else if ((lines[i].length()>=1) && (lines[i].substring(0, 1).equals("+"))) {
      types[i] = ULIST;
      lines[i] = lines[i].substring(2);
    } else if ((lines[i].length()>=1) && (lines[i].substring(0, 1).equals("!"))) {
      types[i] = PICTURE;
      lines[i] = lines[i].substring(2);
    } else if ((lines[i].length()>=1) && (lines[i].substring(0, 1).equals("`"))) {
      types[i] = CODE;
      lines[i] = lines[i].substring(2);
    } else if ((lines[i].length()>=1) && (lines[i].substring(0, 1).equals("\\"))) {
      types[i] = SIZE;
      lines[i] = lines[i].substring(1);
    } else {
      types[i] = PARAGRAPH;
    }
  }
}

void displaySlide(int index) {
  background(255);
  int i = slides[index];
  while(i<slides[index+1]) {
    switch (types[i]) {
      case TITLE:
        fill(0);
        textSize(24);
        textAlign(LEFT);
        text(lines[i],w*0.1,h*0.2,w*0.6,h*0.4);
        stroke(#DD8636);
        line(w*0.1,h*0.5,w*0.6,h*0.5);
        break;
      case SUBTITLE:
        fill(0);
        textSize(18);
        textAlign(LEFT);
        text(lines[i],w*0.1,h*0.4,w*0.6,h*0.4);
        break;
      case AUTHOR:
        fill(0);
        textSize(14);
        textAlign(LEFT);
        text(lines[i],w*0.1,h*0.6,w*0.6,h*0.4);
        break;
      case INSTITUTE:        
        fill(0);
        textSize(14);
        textAlign(LEFT);
        text(lines[i],w*0.1,h*0.65,w*0.6,h*0.4);
        break;
      case DATE:
        fill(0);
        textSize(14);
        textAlign(LEFT);
        text(lines[i],w*0.1,h*0.8,w*0.7,h*0.4);
        break;
      case THEME: break;
      case HEADER1:
        noStroke();
        fill(#27373A);
        rect(0,0,w,h*0.1);
        fill(255);
        textSize(18);
        textAlign(LEFT);
        text(lines[i],w*0.1,h*0.025,w*0.9,h*0.05);
        break;
      case HEADER2:
        noStroke();
        fill(#27373A);
        rect(0,0,w,h*0.1);
        fill(255);
        textSize(18);
        textAlign(LEFT);
        text(lines[i],w*0.1,h*0.025,w*0.9,h*0.05);
        break;
      case HEADER3: break;
      case HEADER4: break;
      case HEADER5: break;
      case HEADER6: break;
      case DIVISION: break;
      case BLOCKQUOTE1: break;
      case BLOCKQUOTE2: break;
      case BLOCKQUOTE3: break;
      case ULIST: break;
      case PICTURE: break;
      case CODE: break;
      case PARAGRAPH:
        fill(0);
        textSize(16);
        textAlign(LEFT);
        text(lines[i],w*0.1,h*0.4,w*0.8,h*0.4);
        break;
    }
    fill(0);
    textSize(10);
    text(index+1,w*0.95,h*0.95);
    i++;
  }
}

void draw() {
  displaySlide(s);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      if (s<n) s++;
    } else if (keyCode == DOWN) {
      if (s>0) s--;
    }
  }
}
