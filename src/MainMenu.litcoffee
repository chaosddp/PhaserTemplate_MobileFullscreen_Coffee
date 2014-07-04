
	class MainMenu
	
		constructor: (@music, @playButton)->
		
		create: ->
			
We've already preloaded our assets, so let's kick right into the main menu.
		
			@music = @add.audio "titleMusic"
			@music.play()
			
			@add.sprite 0, 0, "titlepage"
			
			@playButton = @add.Button 400, 600, "playButton", @startGame, @, "buttonOver", "buttonOut", "buttonOver"
			
		update: ->
			
		startGame: (pointer)->
		
			@music.stop()
			
			@state.start "Game"
	
	@BasicGame.MainMenu = MainMenu