# WideVision Prototype
WideVision is supposed to be a pair of augmented reality glasse that will help visually impaired persons to see better. It's doing that by displaying a version of the real world that is more suitable for each disability and individual.

In this prototype we create a depth image in which close objects are bright and far away objects dark. This should allow people with certain kind of visual impairments to see shapes better.

We use Microsoft's Kinect as a camera and we process the image and serve it as HTML on a mobile phone which is inserted in a VR headset.

This is a prototype developed for the Startup Weekend organized by [FED Network] in Copenhagen.

Here is a short [video] when we tested it with the user and [this] is what the user sees.

## Devices
- Kinect model 1414
- Immerse VR glasses (any kind of Google Cardboard works as well)
## Setup
Install [Processing] version 2.21 .

Download the libraries.
- SimpleOpenNi version 0.24 [SimpleOpenNi Download]
- WebSocketP5 [WebSocketP5]

Save the libraries in /Documents/Processing/Libraries

Open and Run user_stream.pde in Processing. This will create a webserver on localhost:8080.
What I ususally do is cd to the /html folder and run
```sh
python -m SimpleHTTPServer 8000
```
to create a HTTP server which I can access from the local network on my mobile phone.
You should change /html/index.html so that it's going to use your own IP.

## //
Please excuse the use of old and deprecated libraries, but if that's what's going to take me to get stuff working I'm doing it.

[//]: asd
[this]: <https://youtu.be/fklq2Uv6FAM>
[video]: <https://youtu.be/ruekmlefRYs>
[FED Network]: <http://fednetwork.dk>
[Processing]: <https://processing.org/download/?processing>
[SimpleOpenNi]: <https://code.google.com/p/simple-openni/>
[SimpleOpenNi Download]: <https://code.google.com/p/simple-openni/downloads/list?can=1&q=&colspec=Filename+Summary+Uploaded+ReleaseDate+Size+DownloadCount>
[WebSocketP5]: <https://github.com/chrisallick/ProcessingWebSocketVideoStreamer>
