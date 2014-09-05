car = Scene("images/backgrounds/car.jpg")
black = Scene("images/backgrounds/black.jpg")

car:animate( {
	{ "images/effects/lights1.png", 500 },
	{ "images/effects/lights2.png", 500 },
} ) 

lr = Character("Little Red", COLOR_RED)
--lr:image("normal", "images/avatars/lr.png")
--lr:avatar("normal")

--[[
black:show()
sound:play("sounds/effects/CarStart.wav")
novel:pause(14)
--]]

car:show()

music:set_volume(80)

sound:play("sounds/effects/Traffic.wav", true)
music:play("sounds/music/Taxi.ogg")

narrator:say("This place is so different from back home... it's so busy, it almost seems like it's alive. But I guess that's to be expected.") 

narrator:say("Home is a sleepy town, farthest thing from a city that you could get.")
narrator:say("There was dirt, friendly neighbors, and more dirt... this place, though, this is the exact opposite.")
narrator:say("The buildings are tall and I don't think I've ever seen so many lights in my life.")
narrator:say("All the stories Grandma and Diana had told me about this place could have prepared me for this.")
narrator:say("But I'm not scared, I'm excited.")
narrator:say("This is a new adventure and I'm ready to start my life as a psychic detective.")
narrator:say("Let me start by saying that I'm human.")
narrator:say("This world, though, is full of all kinds of different people. Some are a little different than others. ")
narrator:say("There are those that live in water, for example, and those that can't even touch it. Some are very small, and some are super huge. ")
narrator:say("There are people like my old teacher, a fairy who would reward us for good behavior with little gold stars that floated and sparkled. ")
narrator:say("There are people who live in the dark, some that fear it... yeah, lots of different kinds of people.")
narrator:say("There are also people like me, plain old regular humans.")
narrator:say("Well, that's not entirely true. Somehow, I managed to get psychic abilities")
narrator:say("Someone far back in my family must have had powers or something, but anyway, I'm grateful for them.")
narrator:say("Whether it's strange, fuzzy dreams or sudden hunches, I've helped people find their beloved pets in more than one case. ")
narrator:say("But this time, here in this big, bustling city, I can save lives.")

music:stop()
sound:stop()

black:show()
sound:play("sounds/effects/CarArrivingFootsteps.wav")
narrator:say("The taxi stops and I can see my grandma standing outside of the entrance of her apartment building.")
sound:stop()


