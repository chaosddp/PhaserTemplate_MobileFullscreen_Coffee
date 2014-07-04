
	class Boot
		preload: ->
    
Here we load the assets required for our preloader (in this case a background and a loading bar)

			@load.image "preloaderBackground", "images/preloader_background.jpg"
			@load.image "preloaderBar", "images/preloader_bar.png"
    
		creat: ->
      
	  		@input.maxPosition = 1
			@stage.disableVisibilityChange = true
      
			if @game.device.desktop
				@scale.scaleMode = Phaser.ScaleManager.SHOW_ALL
				@scale.minWidth = 480
				@scale.minHeight = 260
				@scale.maxWidth = 1024
				@scale.maxHeight = 768
				@scale.pageAlignHorizontally = true
				@scale.pageAlignVertically = true
				@scale.setScreenSize true
			else
				@scale.scaleMode  = Phaser.ScaleManager.SHOW_ALL
				@scale.minWidth = 480
				@scale.minHeight - 260
				@scale.maxWidth = 1024
				@scale.maxHeight = 768
				@scale.pageAlignHorizontally = true
				@scale.pageAlignVertically = true
				@scale.forceOrientation true, true
				@scale.hasResized.add @gameResized, @
				@scale.enterIncorrectOrientation.add @enterIncorrectOrientation, @
				@scale.leaveIncorrectOrientation.add @leaveIncorrectOrientation, @
				@scale.setScreenSize true

			@state.start "Preloader"
    
		gameResized: (width, height)->
  
This could be handy if you need to do any extra processing if the game resized.

A resize could happen if for example swapping orientation on a device

		enterIncorrectOrientation: ->
      
	  		@BasicGame.orientated = fasle
      
	  		document.getElementById("orientation").style.display = "block"
      
	  	leaveIncorrectOrientation: ->
      
	  		@BasicGame.orientated = true
      
	  		document.getElementById("orientation").style.display = "none"
	
	@BasicGame.Boot = Boot
      
    
    