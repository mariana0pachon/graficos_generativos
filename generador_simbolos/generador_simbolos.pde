/* 
---COMANDOS---
W - aumentar width de los símbolos
w - disminuir width de los símbolos
H - aumentar height de los símbolos
h - disminuir height de los símbolos
r - reset tamaños y pantalla negra
c - clear (pantalla negra)
espacio - pausar en el siguiente frame

---PROBLEMAS---
- no se pausa inmediatamente
- la imagen no esta centrada
- cuando se disminuye mucho width/height hay un overlap a veces?
*/

import java.util.Arrays;
import java.util.HashMap;

int lineCount = 16;
HashMap<String, Integer>[] lines = new HashMap[lineCount];
int symbolW = 100;
int symbolH = 100;
int margin = 50;
int currentX;
int currentY;
boolean play = true;

void setup() {
  size(800, 800);
  background(0);
  stroke(255);
  declareLines(symbolW, symbolH);
}

void draw() {
  if (play) {
    background(0);
    
    currentX = margin;
    currentY = margin;
    
    while(currentY <= height - symbolH - margin) {
      while(currentX <= width - symbolW - margin) {
        pushMatrix();
        translate(currentX, currentY);
        drawSymbol();
        popMatrix();
        
        currentX += symbolW + margin;
      }
      currentY += symbolH + margin;
      currentX = margin;
    }
    
    delay(1000);
  }
}

void drawSymbol() {
  int lineNum = (int)random(lines.length) + 1;
  
  int[] lineIdxs = new int[lineNum];
  
  for (int i = 0; i < lineNum; i++) {
    int lineIdx = (int)random(lines.length);
    
    // loop hasta que lineIdx sea uno nuevo que no se haya usado en este símbolo
    while(Arrays.asList(lineIdxs).contains(lineIdx)) {
      lineIdx = (int)random(lines.length);
    }
    
    lineIdxs[i] = lineIdx;
    drawLine(lineIdx);
  }
}

void drawLine(int idx) {
  HashMap<String, Integer> currentLine = lines[idx];
  
  float fromX = currentLine.get("fromX");
  float fromY = currentLine.get("fromY");
  float toX = currentLine.get("toX");
  float toY = currentLine.get("toY");
  
  line(fromX, fromY, toX, toY);
}

void keyPressed() {
  switch(key) {
    case 'W':
      symbolW += 30;
      declareLines(symbolW, symbolH); 
      break;
    case 'w':
      symbolW -= 30;
      declareLines(symbolW, symbolH); 
      break;
    case 'H':
      symbolH += 30;
      declareLines(symbolW, symbolH); 
      break;
    case 'h':
      symbolH -= 30;
      declareLines(symbolW, symbolH);
      break;
    case 'r':
      background(0);
      symbolW = 100;
      symbolH = 100; 
      break;
    case 'c':
      background(0);
      break;
    case ' ':
      play = !play;
      break;
  }
}

void declareLines(int w, int h) {
  lines = new HashMap[lineCount];
  
  lines[0] = new HashMap<String, Integer>() {{
      put("fromX", 0);
      put("fromY", 0);
      put("toX", w / 2);
      put("toY", 0);
    } };
  
  lines[1] = new HashMap<String, Integer>() {{
      put("fromX", w / 2);
      put("fromY", 0);
      put("toX", w);
      put("toY", 0);
    } };
  
  lines[2] = new HashMap<String, Integer>() {{
      put("fromX", 0);
      put("fromY", 0);
      put("toX", 0);
      put("toY", h / 2);
    } };
  
  lines[3] = new HashMap<String, Integer>() {{
      put("fromX", 0);
      put("fromY", 0);
      put("toX", w / 2);
      put("toY", h / 2);
    } };
  
  lines[4] = new HashMap<String, Integer>() {{
      put("fromX", w / 2);
      put("fromY", 0);
      put("toX", w / 2);
      put("toY", h / 2);
    } };
  
  lines[5] = new HashMap<String, Integer>() {{
      put("fromX", w);
      put("fromY", 0);
      put("toX", w / 2);
      put("toY", h / 2);
    } };
  
  lines[6] = new HashMap<String, Integer>() {{
      put("fromX", w);
      put("fromY", 0);
      put("toX", w);
      put("toY", h / 2);
    } };
  
  lines[7] = new HashMap<String, Integer>() {{
      put("fromX", 0);
      put("fromY", h / 2);
      put("toX", w / 2);
      put("toY", h / 2);
    } };
  
  lines[8] = new HashMap<String, Integer>() {{
      put("fromX", w / 2);
      put("fromY", h / 2);
      put("toX", w);
      put("toY", h / 2);
    } };
  
  lines[9] = new HashMap<String, Integer>() {{
      put("fromX", 0);
      put("fromY", h / 2);
      put("toX", 0);
      put("toY", h);
    } };
  
  lines[10] = new HashMap<String, Integer>() {{
      put("fromX", 0);
      put("fromY", h);
      put("toX", w / 2);
      put("toY", h / 2);
    } };
  
  lines[11] = new HashMap<String, Integer>() {{
      put("fromX", w / 2);
      put("fromY", h / 2);
      put("toX", w / 2);
      put("toY", h);
    } };
  
  lines[12] = new HashMap<String, Integer>() {{
      put("fromX", w / 2);
      put("fromY", h / 2);
      put("toX", w);
      put("toY", h);
    } };
  
  lines[13] = new HashMap<String, Integer>() {{
      put("fromX", w);
      put("fromY", h / 2);
      put("toX", w);
      put("toY", h);
    } };
  
  lines[14] = new HashMap<String, Integer>() {{
      put("fromX", 0);
      put("fromY", h);
      put("toX", w / 2);
      put("toY", h);
    } };
  
  lines[15] = new HashMap<String, Integer>() {{
      put("fromX", w / 2);
      put("fromY", h);
      put("toX", w);
      put("toY", h);
    } };
}
