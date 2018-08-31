# Description:
#   Selects a random dog fact
#
# Commands:
#   dag facts
#
# Author:
#   TC Baxter

facts = [
  ''':belle-dag: Belle loves sunbeams more than anything except belly rubs and bacon.''',
  ''':belle-dag: will not eat cheese. There may be pills hiding in there.''',
  ''':belle-dag: can't see or hear all that well anymore. She relies on her well-honed sniffer.''',
  ''':bubba: Bubba used to be scared of walking down the stairs,
      so Kate and Micah had to carry him downstairs each day.''',
  ''':bubba: Bubba’s favorite food is cottage cheese.''',
  ''':bubba: On walks, Bubba is easily intimidated — he’s typically scared of
      garbage cans and upturned paper grocery bags.''',
  ''':bubba: Bubba was originally going to be named “Tater Tot” (but Bubba was a better fit).''',
  ''':cooper: Cooper's full name is Wilford J Cooperbottom.''',
  ''':cooper: Cooper only likes two toys: his laser and destroying whatever toy
      Cupcake had a minute ago.''',
  ''':cupcake-dag: Cupcake does not like hats. At all.''',
  ''':cupcake-dag: Cupcake's full name is Princess Petunia Cupcake.''',
  ''':cupcake-dag: likes to nap on the back of the couch.''',
  ''':fox-dag: Fox and Luna are 18F dog twins.''',
  ''':fox-dag: Fox's favorite food is smoked salmon. She's fancy like that.''',
  ''':hugo: Hugo is named after Hugo Cabret, the literary child abandoned to
      raise himself in the infrastructure of a railway station,
      on account of his being abandoned by his prior owners.''',
  ''':hugo: Hugo can be convinced to crawl under a bed from one side to the other when amped up.''',
  ''':hugo: Hugo will do a somersault on command,
      but only in front of the bedroom closet where he originally learned the trick.''',
  ''':hugo: Hugo is terrified of humans wearing headbands with springy things on them,
      even if they are people he knows well.''',
  ''':laddie-dag: is scared of his own farts.''',
  ''':loki: Loki will give you the stare of death if you do not share an apple with him.''',
  ''':loki: Loki’s tongue is physically too large for his own mouth and just hangs out all day.''',
  ''':loki: Loki once ate an entire bag of Reese’s peanut butter cups, wrappers and all.
      He had sparkly :poop: for a week!''',
  ''':loki: Loki once decided it was a good idea to roll around in cow patties
      and run up to us like it was no big deal.''',
  ''':loki: Loki was named after the Nordic god of tricks and mischief,
      which fits his personality perfectly.''',
  ''':mahalo_goldeneye: Mahalo raced in Daytona Beach, Florida.''',
  ''':mason: Mason's middle name is Dreamsicle. It was his name when we adopted him
      (his sister was Creamsicle).''',
  ''':neko: Jessie dropped an apple once, and Neko grabbed it like a ball
      and went running around the house to show it off.''',
  ''':neko: Neko is part rottweiler, part pit bull, and part chow chow,
      which is the best and weirdest and most surprising thing.''',
  ''':pancho-dag: Pancho can read.''',
  ''':pancho-dag: Pancho is not color blind, he knows UPS brown.''',
  ''':pixie: Pixie is a rescue that was found on injured the side of the highway.''',
  ''':pixie: Pixie likes to give "puppy hugs" where she leans on you
      placing her paws around you.''',
  ''':pixie: Pixie loves to chase and bark at wheels.''',
  ''':pixie: Pixie's favorite chew toy is "her Tito", a plush Titos vodka bottle
      we were gifted from our neighbor who works in the food/bev industry :joy:.''',
  ''':pixie: Pixie really enjoys to go on hikes in the wilderness.''',
  ''':pixie: Pixie still sees her foster mom regularly
      and stays with her when we go out of town.''',
  ''':scully: Scully doesn't chew human things she's not supposed to.
      But she does pick up socks that are left on the floor and move them to other locations.''',
  ''':winry-headache: Winry was afraid of going up or down stairs,
      so when Greg moved into a house that had them,
      she just slept in the living room by herself until she got over it.''',
  ''':winry-headache: Winry ate a banana peel once when Greg wasn't looking.
      She was totally fine.''',
  ''':winry-headache: Winry has heterochromia - one eye is solid blue
      but the other is half blue,half brown.''',
  ''':zoey: Zoey thinks she is the cat police at our house:
      if they are fighting (usually playfully) with each other, she runs up to them,
      sits in front of them and whines until they stop.''',
  ''':zoey: Zoey loves to take baths. When I say, "time for a bath?!"
      she will run to the bathtub and sit down.''',
]

module.exports = (robot) ->
  robot.respond /dag fact(s)?/i, (res) ->
    res.send res.random facts
