
hug1 = Scene("images/backgrounds/grandma_hug.jpg")
hug2 = Scene("images/backgrounds/diana_hug.jpg")
house = Scene("images/backgrounds/house.jpg")

diana = Sprite("Diana")
diana:image("normal", "images/sprites/Diana_normal.png")
diana:image("smile", "images/sprites/Diana_smile.png")
diana:image("questioning", "images/sprites/Diana_questioning.png")
diana:image("worried2", "images/sprites/Diana_worried_2.png")

grandma = Sprite("Grandma")
grandma:image("normal", "images/sprites/Grandma_normal.png")
grandma:image("laugh", "images/sprites/Grandma_laugh.png")
grandma:image("confident", "images/sprites/Grandma_confident.png")
grandma:image("unimpressed", "images/sprites/Grandma_unimpressed.png")

lrs = Sprite("Little Red")
lrs:image("smile", "images/sprites/LR_smile.png")
lrs:image("normal", "images/sprites/LR_normal.png")
lrs:image("unimpressed", "images/sprites/LR_unimpressed.png")
lrs:image("questioning", "images/sprites/LR_questioning.png")

g = Character("Grandma", "0x95143cff")
d = Character("Diana", "0x1faa8cff")

hug1:show()
narrator:say("I run to her and wrap my arms around her. She's warm and she still has that same cinnamon and vanilla incense smell.")
g:say("My little Rose!")
lr:say("Grandma!")
narrator:say("That's my Grandma, she's always been supportive of me ever since I could remember. I'm sad to be away from my parents, but as long as I'm living with my Grandma, I'm sure things will be fine.")

house:show()
music:play("sounds/music/Grandma.ogg")

narrator:say("We head upstairs into her apartment and it smells richly of herbs and incense. There are jars with natural remedies neatly arranged on shelves and her old fat cat, Macaron, is sleeping on a chair.")

lrs:show("normal", "left", 0.5)
grandma:show("normal", "right", 0.5)

g:say("How was the trip here, you must be tired! Do you need anything to drink? I can make us some ginger tea.")
lrs:show("smile", "left")
lr:say("That would be great, thank you grandma.")
lrs:show("normal", "left")
grandma:hide(0.5)
narrator:say("Grandma always knows how to make make me feel better.")
grandma:show("laugh", "right", 0.5)
narrator:say("She comes back with chamomoile tea and I take it graciously.")
grandma:show("normal", "right")
g:say("It's been so long since you last visited me. The city's grown since then, eh?")
lr:say("Yeah, the buildings weren't as big, and that's about all I can remember.")
grandma:show("laugh", "right")
g:say("But look at you! The buildings grew taller, but you've grown more beautiful and strong.")
lrs:show("smile", "left")
lr:say("Hehe, I'm a full 5 feet and 1 inch.")
grandma:show("confident", "right")
g:say("That's a full 1 inch from last time. You'd better stop growing so fast *joking*")
grandma:show("laugh", "right")
narrator:say("Grandma's laughter is as bubbly as her warm personality. It's already calming my nerves.")
lr:say("I'll try, Grandma.")
grandma:show("normal", "right")
lrs:show("normal", "left")

g:say("Here, come on, let's put your things in your room.")
lrs:hide(0.5)
grandma:hide(0.5)
narrator:say("We move my stuff over to my new room, which used to be Grandma's sewing room, oh, did I tell you? She also makes beautiful clothing and jewelry. She made me the little bow that I wear in my hair all the time. She can do anything.")
lrs:show("normal", "left", 0.5)
grandma:show("confident", "right", 0.5)
g:say("Oh, you know I wouldn't let my grandbaby stay in the big city by hersel. By the way, if you ever have any trouble, I have a mean spell that can make people regret being born.")

grandma:show("normal", "right")
lrs:show("smile", "left")
lr:say("Grandma...thanks...")
music:set_volume(32)
sound:play("sounds/effects/TextAlert.wav")
lrs:show("questioning", "left")
lr:say("Oh, it's a text from Diana. She said she's outside.")
sound:play("sounds/effects/DoorKnock.wav")
g:say("Go, go! start your psychic detective adventure!")
sound:play("sounds/effects/HeavyFootstepsRunning.wav")

hug2:show()
grandma:hide()
lrs:hide()
diana:hide()

narrator:say("I chuckle and head over to the door to open it, but before I can, my best friend, Diana comes running in and picks me up, pretty much putting me in a chokehold. This is just how she shows love, her being part giant and super strong and all, but I can barely breathe!")
music:set_volume(128)
d:say("RED!")
d:say("Long time no see, Red. I've really missed you!")
lr:say("I've missed you...yoo...Diana!")
d:say("Ooh, oops.")
house:show()
diana:show("worried2", "right")
lrs:show("unimpressed", "left")
narrator:say("She puts me down and I can finally feel the air return to my lungs.")
d:say("Sorry...")
lrs:show("smile", "left")
lr:say("It's okay")
lrs:hide(0.5)
diana:show("normal", "center")
narrator:say("That's Diana. She's my best friend in the whole world and the one who got me this new job. she's been a detective for 3 years now, and although she's pretty new herself, she knows what she's doing. I trust that she can help a newbie like me out, and I'm glad I get to work with my best friend again.")

diana:show("smile", "left")
grandma:show("normal", "right", 0.5)
d:say("Hey Grandma Suri!")
narrator:say("Diana hugs my grandma and my grandma looks like she's getting squished.")
grandma:show("unimpressed", "right")
g:say("Diana! Please don't choke me, dear, I want to live to be 71.")
diana:show("worried2", "left")
d:say("I won't!")
diana:show("normal", "left")
grandma:show("normal", "right")
narrator:say("It's great to see everyone again. I haven't seen them in so long.")
diana:show("normal", "left")
d:say("I hate to cut this reunion short, but I have to take Red to meet the Cheif right now. He's a nice guy, but a stickler for being on time.")
narrator:say("Diana likes calling me Red. In fact, almost everyone does. It may or may not be due to the fact that I love wearing red all the time...")
grandma:show("confident", "right")
g:say("That's fine, we'll catch up later. In the meantime, I need to make a few healing ointments for some clients. You two, have fun and catch some bad guys.")
g:say("Bring them back here, too, and I'll put them in their place.")
diana:show("smile", "left")
d:say("Hehe! You know we will!")
narrator:say("Oh boy...", ITALIC_FONT)
diana:show("normal", "left")
grandma:show("normal", "right")
black:show()
narrator:say("We both head out to see the Chief and I'm ready to start my job as a psychic detective. I'm stil very nervous, but I'm glad I have Grandma and Diana, though. With them by my side, it won't be so bad.")
narrator:say("Even so, I've been having strange dreams lately before I came here. I hope there's nothing to them...")



