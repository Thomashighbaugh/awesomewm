# README 
## Awesome Window Manager Configuration

This repository houses my heavily customized AwesomeWM configuration. This configuration has been the result of my blending of some of the ideas and functionality I liked in various `popular` configurations, like the [Glorious Dotfiles] and [elenapan's configuration] to name a few, while expanding into its own direction entirely. 

<img src="./Screenshots/awesomescreenshot.png" alt="recent screenshot">
## Directory Structure

No subdirectories name noodle here, I have tried to keep the names as informative and functional as possible, nonetheless I have decided to provide you with this key just to reduce ambiguity as much as possible. 

| Subdirectory | Contents |
|--------------|----------|
| binding | Key bindings |
| layout | wibar, wallpaper and wibar module configurations |
| lib | external libraries stored locally for consistency purposes | 
| lib/awesome-switcher | macOS like alt-tab |
| lib/awesome-wm-widgets | statusbar widgets |
| lib/freedesktop | ability to use standard Linux application menu |
| lib/poppin | dropdown application launcher |
| lib/revelation | show all windows on all screens, select window for focus with button press |
| main | general configurations like signals, rules, layouts, etc. |
| scripts | rofi themes and autorun script |
| themes | the styling applied to the theme | 


## Under the Hood
I went through and experimented with a lot of other configs before arriving at this one, which works specifically for me, and in almost all of them was dissatisfied enough to abandon hopes of modifying someone else's code and being done with it. In that process I have come across varieties of different ideas about how and what to code into one's awesome configuration that in no case is ever spelled out in the README.md, so I am being the change I want to see in the world and giving you what I was thinking in as succinit a format as I am able. 

| Feature | Why |
|---------|-----|
| Modular configuration across several directories | Because reading a 2,500 line config file is dizzying |
| Included rofi scripts | This is split from my main dotfiles repo, thus may be used without the rest, so including rofi configs makes sense |
| Lib directory full of external dependencies | minimize the dependency installations needed to run the config | 
| No scripts/wibar modules running async callbacks | because one sanctified config nearly melted my PC with its attempts to get MPV running when I don't use or install it on my systems |
| Global namespace | this makes cross dependencies less troublesome, even if you still require them at the beginning of the file, sometimes it won't work due to you or to the fickle nature of lua, this minimizes that immensely |
| Not all jammed into a directory with my annoyingly long user name as its title | meaning you can plug and play with much of this in your own configuration if you so please |
| Annoying title ASCII art on each file | because it helps me keep track of what the hell I am doing, plus why not its Linux  |
| Each file is split into sections | making it clear what is going on in them, for others to understand and me in a few months when I rewrite the config again |
| Call the Windows key the Windows Key | I mean come on, its not voldemort and saying its name isn't going to implicate us in some horrorific lawsuit, or worse mean that Bill Gates is going to show up to our house at 3 am asking to be let in the window.  |
| Modified Titlebar Icons to make sense | I really like these titlebar icons, but needed to adjust the shapes to fit what I expect them to do, so I used inkscape and I rotated, simple as that. |
| 
