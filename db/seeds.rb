# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
weapons = Category.create(name: "weapons")
armor = Category.create(name: "armor")
unique_items = Category.create(name: "unique items")
faces = Category.create(name: "faces")
wedding_supplies = Category.create(name: "wedding supplies")

user = User.create(username:"Nicole", password:"test", address:"2122 Concord Lane. Superior, CO 80027",email:"nicolekmarino@gmail.com")
admin = User.create(username:"Admin", password:"test", address:"admin street Denver CO 80027",email:"admin.com",role:1)

weapons.items.create(name: "Ice", img: "Ice.jpg", price: 100.00, description: "Ice was a Valyrian steel greatsword and an heirloom of House Stark. Ice had been in the possession of House Stark for generations and was kept in a special scabbard made from the pelt of a wolf.")
weapons.items.create(name: "Oathkeeper", img: "Oathkeeper.jpg", price: 100.00, description: "Oathkeeper is one of two Valyrian steel longswords made from Ice, the greatsword of House Stark, under orders of Lord Tywin Lannister.")
weapons.items.create(name: "Longclaw", img: "Longclaw.jpg", price: 350.00, description: "Longclaw is a Valyrian steel sword that remained in the possession of House Mormont for five centuries.")

weapons.items.create(name: "Needle", img: "Needle.jpg", price: 49.99, description: "Needle is a thin sword wielded by Arya Stark. It was given to her by Jon Snow, who had it made by Mikken, the blacksmith of Winterfell.")
weapons.items.create(name: "Gregor 'The Mountain' Clegane's Bare Hands", img: "TheMountain.jpg", price: 99.99, description: "Do you have a trial by combat coming up? These have been proven to help.")

armor.items.create(name: "Jaime Lannister's Armor", img: "JaimesArmor.jpg", price: 300.00, description: "It's protected him thus far, hasn't it? Must be pretty decent.")
armor.items.create(name: "Gendry's Helmet", img: "GendrysHelmet.jpg", price: 400.00, description: "The great Ned Stark complimented the helmet and even offered to purchase it! Gendry refused, because apparently he has some special connection with it, but that's why it's so expensive (because we stole it from Gendry when he wasn't looking).")
armor.items.create(name: "Ned's Shield", img: "StarkShield.jpg", price: 120.00, description: "He sure isn't using it anymore. We assure you that it would've worked if he'd been carrying it when he needed it.")

unique_items.items.create(name: "Ned's Head", img: "NedsHead.jpg", price: 90.90, description: "Once was one of a kind.")
unique_items.items.create(name: "Hodor Door Stop", img: "Hodor-door-stopper.jpg", price: 14.44, description: "Useful for all those 'White Walker apocalypse' scenarios you might find yourself in.")
unique_items.items.create(name: "Three Eyed Raven", img: "ThreeEyedRaven.jpg", price: 15.44, description: "Because what good is a raven with only two eyes?")
unique_items.items.create(name: "Direwolf", img: "Direwolf.jpg", price: 15333.44, description: "Basically a big ass dog, but one-thousand times more loyal.", retired: true)
unique_items.items.create(name: "Dragon Eggs", img: "DragonEggs.jpg", price: 1538458433.74, description: "We'll have to get back to you on how these work. So far just this one blonde lady in Essos has figured it out, but she had to set them on fire, and we're not sure that's the best solution. I mean, seriously, these things are too expensive and rare to just toss haphazardly into a fire.", retired: true)

faces.items.create(name: "Tyrion Lannister", img: "TyrionsFace.jpg", price: 5000.00, description: "Are you a servant of the Many-Faced God? Are you trying out for the group of assassins known as the Faceless Men? Well why not try looking like Tyrion Lannister? It'd be really easy to get into any brothels.")
faces.items.create(name: "Jaqen H'ghar", img: "JaqenHgharFace.jpg", price: 8000.00, description: "Are you a servant of the Many-Faced God? Are you trying out for the group of assassins known as the Faceless Men? Well why not try looking like one of them? You can pretend to be a less cool version of Jaqen H'ghar (because no one is as cool as the real Jaqen H'ghar).")
faces.items.create(name: "Jon Snow", img: "JonsFace.jpg", price: 7000.00, description: "Are you a servant of the Many-Faced God? Are you trying out for the group of assassins known as the Faceless Men? Well why not try looking like Jon Snow? He was just a bastard son of Ned Stark, but things are certainly looking up for him.")
faces.items.create(name: "Box Set", img: "FaceBoxSet.jpg", price: 10000.00, description: "Are you a servant of the Many-Faced God? Are you trying out for the group of assassins known as the Faceless Men? Well why not try looking like Jon Snow? Or Daenerys Targaryen? This box set includes: Jon Snow, Daenerys Targaryen, Robb Stark, Sansa Stark, Oberyn Martell, and Cersei Lannister.")

wedding_supplies.items.create(name: "Garbage Bags", img: "GarbageBags.jpg", price: 20.00, description: "Weddings are messy. Contain the mess in these wonderful black garbage bags. Now with the odor-blocking power of Febreze(TM)!")
wedding_supplies.items.create(name: "Bleach", img: "Bleach.jpg", price: 30.00, description: "For those really tough stains. Great on tile floors, and can even be used to get that dress back to a pearly white!")
wedding_supplies.items.create(name: "Cleaning Gauntlets", img: "YellowGloves.jpg", price: 7.00, description: "Don't you hate it when you get someone else's blood on your hands (both metaphorically speaking AND literally)? Avoid the literal version with these rubber gloves!")
wedding_supplies.items.create(name: "Frey Pie", img: "FreyPie.jpg", price: 0.00, description: "Don't you hate it when you eat your own sons?")
