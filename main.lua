local equalizer = require "plugin.equalizer"
local json = require("json")
local backgroundMusic = audio.loadStream("song1.mp3")
equalizer.initEqualizer(1,0)
math.randomseed( os.time() )
audio.play( backgroundMusic, { channel=1, loops=-1 } )
local bg = display.newRect( display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight )
local logo = display.newText( "Equalizer Plugin", 0, 0, native.systemFontBold, 20 )
logo.x, logo.y = display.contentCenterX, 50
bg:setFillColor( .8,0,0 )
local widget = require("widget")
local reverbButton
local reverbSwitch = 0

-----------------------------------------
local function outputState()

	print("-----------------------------------------")
	print("getNumberOfBands()=",equalizer.getNumberOfBands())

	print("getBandLevel(0)=",equalizer.getBandLevel(0))
	print("getBandLevel(1)=",equalizer.getBandLevel(1))
	print("getBandLevel(2)=",equalizer.getBandLevel(2))
	print("getBandLevel(3)=",equalizer.getBandLevel(3))
	print("getBandLevel(4)=",equalizer.getBandLevel(4))




	print("getBandLevelRange(0)=",equalizer.getBandLevelRange(0))
	print("getBandLevelRange(1)=",equalizer.getBandLevelRange(1))
	print("getBandLevelRange(2)=",equalizer.getBandLevelRange(2))

	print("getBandFreqRange(0)=",equalizer.getBandFreqRange(0))
	print("getBandFreqRange(1)=",equalizer.getBandFreqRange(1))
	print("getBandFreqRange(2)=",equalizer.getBandFreqRange(2))

	print("getCenterFreq(0)=",equalizer.getCenterFreq(0))
	print("getCenterFreq(1)=",equalizer.getCenterFreq(1))
	print("getCenterFreq(2)=",equalizer.getCenterFreq(2))

	



end
----------------------------------





local equalizerButton
local equalizerSwitch = 0
equalizerButton = widget.newButton( {
	label = "Enable Equalizer",
	id = "equalizer",
	onEvent = function ( e )
		if (e.phase == "began") then
			equalizerSwitch = (equalizerSwitch+1)%2
			if (equalizerSwitch == 0) then
				equalizerButton:setLabel("Enable Equalizer")
				outputState()
				equalizer.setBandLevel(4,0)
			else
				equalizerButton:setLabel("Disable Equalizer")
				equalizer.setBandLevel(4,1500) -- note 1000 = 10.00, 
				outputState()

			end
		end
	end
} )
equalizerButton.x, equalizerButton.y = display.contentCenterX, display.contentCenterY-30