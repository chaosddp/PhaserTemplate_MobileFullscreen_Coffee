
	class Preloader
		
		constructor: (@background, @preloadBar, @ready=false)->
			
		preload: ->
			
These are the assets we loaded in Boot.js
A nice sparkly background and a loading progress bar 

			@background = @add.sprite 0, 0, "preloaderBackground"
			@preloadBar = @add.sprite 300, 400, "preloaderBar"
			
This sets the preloadBar sprites as a loader sprite.
What that does is automatically crop the sprite from 0 to full-width as the files below are loaded in.

			@load.setPreloadSprite @preloadBar
			
Here we load the rest of the assets our game needs.
Add your assets here

			@load.image "titlepage", "image/title.jpg"
			@load.atlas "playButton", "images/play_button.png", "images/play_button.json"
			@load.audio "titleMusic", ["audio/main_menu.mp3"]
			@load.bitmapFont "caslon", "fonts/caslon.png", "fonts/caslon.xml"
			
		create: ->
			
Once the load has finished we disable the crop because we're going to sit in the update loop for a short while as the music decodes

			@preloadBar.cropEnabled = false
			
		update: ->
			
You donot actually need to do this, but i find it gives a much smoother game experience.
Basically it will wait for our audio file to be decoded before proceeding to the MainMenu.
You can jump right into the menu if you want and still play the music, but you'll have a few secods of delay while the MP3 decodes - so if you need your music to be in-sync with your menu, it's best to wait for it to decode here first, then carry on.
If you donot have any music in your game then put the game.state.start line into the create function and delete the update function completely.

			if @cache.isSoundDecoded("titleMusic") and @ready is false
				
				@ready = true
				@state.start "MainMenu"