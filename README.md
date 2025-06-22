# display-presenter

Our software to run Raspis as Displays for events

## Vision

### Client

The client should be a simple plug-and-play system, that only needs to be powered on. It then should automatically do the following things:

- Change the screen orientation
- Start the webpage in fullscreen
- automatically get new updates/versions of the webpage every 2–3 seconds **without** visible refresh

### Server

The server should be run on start up (systemctl, really necessary?) and host a config webpage with the following functionality:

- make changes to the layout (add images, banners, etc.)
- upload images that should be shown and save them locally to host them
- slider to enable single image or slideshow
- delete images that shouldn't be shown anymore
- set a timer to a specific date and time with a name
- change the visibility of the timer (which one to show, (don't) show name, select format)
- login (encryption)
- add text to be shown

And it should have a phenomenal design :)