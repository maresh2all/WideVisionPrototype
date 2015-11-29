

/*
*  Author: Mares Radomir 
*  Date : 2015-11-27
*  Inspired by_
*      SimpleOpenNI examples by Max Rheiner
*      Websockets examples from http://badankles.com/?p=209
*  User during FED Network Copenhagen weekend hackathon
*  to create AR glasses for visually impaired

*/

import SimpleOpenNI.*;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import javax.imageio.ImageIO;
import muthesius.net.*;
import org.webbitserver.*;
import jcifs.util.Base64;

WebSocketP5 socket;

SimpleOpenNI  context;
int skip = 0;
void setup()
{
  size(640, 480);
  context = new SimpleOpenNI(this);
  socket = new WebSocketP5( this, 8080 );
  if (context.isInit() == false)
  {
    println("Can't init SimpleOpenNI, maybe the camera is not connected!"); 
    exit();
    return;
  }

  // mirror is by default enabled
  context.setMirror(false);

  // enable depthMap generation 
  context.enableDepth();

}

void draw()
{
  // update the cam
  context.update();

  BufferedImage buffimg = new BufferedImage( width, height, BufferedImage.TYPE_INT_RGB);
  buffimg.setRGB( 0, 0, width, height, context.depthImage().pixels, 0, width );
  
  ByteArrayOutputStream baos = new ByteArrayOutputStream();
  try {
      ImageIO.write( buffimg, "jpg", baos );
    } catch( IOException ioe ) {
              println("Error");
  }
  
  String b64image = Base64.encode( baos.toByteArray() );
  socket.broadcast( b64image );
  
  
  

  background(0, 0, 0);

  // draw depthImageMap
  image(context.depthImage(), 0, 0);

}
byte[] int2byte(int[]src) {
  int srcLength = src.length;
  byte[]dst = new byte[srcLength << 2];
    
  for (int i=0; i<srcLength; i++) {
    int x = src[i];
    int j = i << 2;
    dst[j++] = (byte) (( x >>> 0 ) & 0xff);           
    dst[j++] = (byte) (( x >>> 8 ) & 0xff);
    dst[j++] = (byte) (( x >>> 16 ) & 0xff);
    dst[j++] = (byte) (( x >>> 24 ) & 0xff);
  }
  return dst;
}
void stop(){
  socket.stop();
}

void websocketOnMessage(WebSocketConnection con, String msg){
  println(msg);
}

void websocketOnOpen(WebSocketConnection con){
  println("A client joined");
}

void websocketOnClosed(WebSocketConnection con){
  println("A client left");
}

