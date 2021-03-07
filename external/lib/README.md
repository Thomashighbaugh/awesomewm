# External Libraries

The subdirectories available within this directory are entirely the work products of other developers, with some minimal modifications to make them function within this configuration.

These are not just random widget libraries, I also keep stable versions of all of the AwesomeWM related libararies and packages that I need for the confiiguration to work, taking advantage of Awesome looking through all of user's configuration directory when hunting for things referenced in the `require('')` portion of the various files.

Were I to use git submodules, my seemingly weekly reinstallations would be complicated by any change committed by any of the developers who maintain these packages and my modifications would need to be scripted into my installation script, which is a bit of a handful already let alone were I to throw that monkey wrench into the thing. 

Plus this repository is added to the Electric Tantra Linux, stripped of the `.git` directory of course, as it is where the Awesome configuration used there is from, so pulling in submodules during the already painful build process is not happening anytime soon (but who knows what tomorrow brings....)

Below is a manifest of the included projects describing the functionality they provide.

| Module             | Description                                                                                                                                                                                     |
| ------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Awesome Switcher   | macOS like Alt-Tab with client preview bar                                                                                                                                                      |
| Awesome WM Widgets | a whole host of widgets, specifically useful system monitoring widgets                                                                                                                          |
| Bling              | Not to be confused with another widgets library called `blingbling`it is also a 'utilities library' for awesome window manager that provides things like tiled wallpapers and window swallowing |
| Collision          |                                                                                                                                                                                                 |
| freedesktop        | a standard Linux menu system for inclusion in the menu                                                                                                                                          |
| poppin             | a handy means of simulating programs like Quake (drop down terminal)                                                                                                                            |
| Revelation         | a means of selecting from all open windows                                                                                                                                                      |
