my personal basic media server

or my attempts to run a media server (one of various flavors) in docker for arm 64 bit machines. Why? My brother has been buying movies on disc for 20 years. He decided to rip them to a hard drive.

This is a front end for about 550 movies that he purchased over the years.

This media server is plex based with:

    plex aids:
        tautulli
        plex meta manager (TBD)
    frontends
        dashy
    Orchestration
        Portainer
    logging/monitoring
        Dozzle
        dashdot
    music and podcasts
        airsonic
        musicbrains (tbd)
    utilities
        watchtower
    maybe some day
        traefik
        syncthing

A second stack with the arrs is in process. (built on top of this stack).

Everything here is pretty basic, cadged from github and other places. Dashy from Alicia Sykes is the front end. Still WIP. It has more toys to play with. I have only scratched the surface of dashy. I like it. I can mix web tools and server apps and scripts in one interface. I am not wild about the themes, but that is a quibble.

Plex vs. kodi vs. jelly. I went with plex. The others are good. I started with minidlna and loved minidlna. But it lacked the bells and whistles that my users wanted. With plex meta manager (still giving me issues) and Plex you can build a nice interface with links to info about the movie, actors, etc. It makes browsing and movie selection easier.

Plex is a pain in some ways, but getting basic cable channels for $5 a month can not be overlooked. No more hulu/youtube or Netflix. I am down to amazon prime, plex, and Disney/ESPN. If I allocate half of my amazon prime subscription fee to media, my total is about $82/mo. Any time you can get it under 100, great.

I set up syncthing, it is a neat little app that syncs multiple places. I have a linux laptop, a desktop, a windows laptop with a gpu (for foto editing), and the various pi servers. suncthing made it easy to keep all in sync.

IPTV is something that should be considered. Endless password and access issues coupled with clunky payment systems has made this a back burner issue. 

Hardware: Mostly Pi4B with 4 GB of RAM and booted off of an SSd drive in one of the USB 3.0 connectors. I used short fat power cords to eliminate potential resistance issues that could throttle the pis. The other USB 3.0 port was dedicated to an external HDD where the movies and music are locted.

My primary sources will be added at the bottom of this file someday. The pis were set up as recommended by Raspberry, The standard pi config and command line changes were made, i.e. c groups were enabled. Swap was disabled in favor of ZRAM. The Pis are wired to the network on 1000 GB channels. I disabled bt and wifi to free up some resources (o the point of taking them out to the kernal). It frees up a tiny bit of resources.

The pis were overclocked:

    over_voltage = 6
    arm_freq = 1950
    gpu_freq = 650

GPU memory was limitied also. There are sources that claim you can go lower, but that was not so on my system.

    gpu_mem = 256

The required fan was added. The system rarely exceeds 60 C. They were argon fans, but I did not use the argon scripts. I used a new agent written in go. Maybe someone will port to rust, https://github.com/samonzeweb/argononefan.git

Dozzle and dashdot were used for logging and monitoring. I found that heavy monitoring systems like glances and netdata tend stress the pis and they will not play certian movies. so I am usung the lightest apps I could find for monitoring.

I disabled and removed everything associated with bluetooth and wifi. My servers are headless and wired. This was done to reduce strain on the pis. this involved disabling the systemd starts, and blacklisting the kernal mods.

Eventually, I want to compile the apps atively on the pi. This may be a bit of a stretch. The literature says a 10% performance boost with native compilation. That might give me enough juice to get after the video/sound sync that occasionally pops up. Docker also provides some interesting options, where you can have a container that spits ot a binary that can be incorporated into the build.

I have tried to integrate trafik into the mix, with limited sucess, I will keep working on that

If you have not guessed by now, I am not a computer scientist. I am a scientist, molecular biologist. I am working on AI/bio interfaces. Old fashioned stuff, like building out a knowledge base for ALzheimers where papers are combined to generate a synthesis of the topic with probability estimates of the 'truthiness' of each node. Maybe some new relationships may opo up. Slow going.

Refs:

Overclock: https://www.seeedstudio.com/blog/2020/02/12/how-to-safely-overclock-your-raspberry-pi-4-to-2-147ghz/
fan control: https://github.com/samonzeweb/argononefan.git
dashy: https://github.com/Lissy93/dashy/tree/master
