//
//  GameModel.swift
//  AppTeamAcademyFinal
//
//  Created by asimraja on 4/13/24.
//

import Foundation

struct Game : Codable, Identifiable, Equatable, Hashable {
    let id: Int
    let name: String
    let description: String
    let year: String
    let image: String
    let genres: [Genre]
}

enum Genre: String, Codable {
    case adventure = "Adventure"
    case indie = "Indie"
    case rpg = "RPG"
    case platformer = "Platformer"
    case puzzle = "Puzzle"
    case strategy = "Strategy"
    case pointAndClick = "Point-and-click"
    case action = "Action"
    // etc etc whatever else I wanna add
}

extension Game {
    
    static var allGames: [Game] = [Game.puttPuttZoo,
                                   Game.puttPuttParade,
                                   Game.Xenoblade1,
                                   Game.puttPuttRace,
                                   Game.puttPuttTime,
                                   Game.puttPuttBalloon,
                                   Game.witcher3,
                                   Game.minecraft,
                                   Game.puttPuttCircus,
                                   Game.tearsOfTheKingdom,
                                   Game.puttPuttMoon,
                                   ]
    
    static var puttPuttZoo: Game {
        Game(id: 1,
             name: "Putt-Putt Saves the Zoo",
             description: "Little purple car Putt-Putt must help the local zoo that's about to have its grand opening and find the missing baby animals that got lost while exploring the place.",
             year: "1995",
             image: "PuttPuttZoo",
             genres: [Genre(rawValue: "Point-and-click")!])
    }
    static var puttPuttParade: Game {
        Game(id: 2,
             name: "Putt-Putt Joins the Parade",
             description: "On a sunny morning in Cartown, Putt-Putt turns on his radio and hears an announcement about a pet parade event. Though excited at this news, Putt-Putt acknowledges that he doesn't have a pet and thus wouldn't qualify to participate. He meets with the parade's manager, Smokey, who encourages him to find a pet and a balloon for the parade as well as a car wash in order to enter the parade.",
             year: "1992",
             image: "PuttPuttParade",
             genres: [Genre(rawValue: "Point-and-click")!])
    }
    static var puttPuttMoon: Game {
        Game(id: 3,
             name: "Putt-Putt Goes to the Moon",
             description: "Putt-Putt and Pep are invited by a scientist named Mr. Firebird to visit his Fireworks Factory. At the factory, Pep chases a butterfly, only to cause a firecracker to emerge and launch Putt-Putt into outer space. Putt-Putt lands on the Moon, where he begins searching for a way to return home.",
             year: "1993",
             image: "PuttPuttMoon",
             genres: [Genre(rawValue: "Point-and-click")!])
    }
    static var puttPuttRace: Game {
        Game(id: 4,
             name: "Putt-Putt Enters the Race",
             description: "While playing with Pep, Putt-Putt receives an invitation from Redline Rick to enter the Cartown 500 race. Excited, Putt-Putt goes to the Speedway to sign up. At the speedway, Redline Rick tells Putt-Putt that he needs a special kind of fuel, more durable tires, a safety helmet for Pep to wear, and a racing flag. Determined to enter the race, Putt-Putt decides to collect those items around Cartown.",
             year: "1999",
             image: "PuttPuttRace",
             genres: [Genre(rawValue: "Point-and-click")!])
    }
    static var puttPuttTime: Game {
        Game(id: 5,
             name: "Putt-Putt Travels Through Time",
             description: "Putt-Putt visits Mr. Firebird's laboratory with the intention of showing him his new school supplies. At the lab, Mr. Firebird demonstrates a machine made to view different time periods like a television. The demonstration turns chaotic, however, when the machine opens a portal that sucks Putt-Putt's items and Pep into four different dimensions: Stone Age, Medieval, Old West, and the Distant Future. Since the portal can't be shut down until everything is brought back from the other eras, Putt-Putt is forced enter the portal to search for everything.",
             year: "1997",
             image: "PuttPuttTime",
             genres: [Genre(rawValue: "Point-and-click")!])
    }
    static var puttPuttCircus: Game {
        Game(id: 6,
             name: "Putt-Putt Joins the Circus",
             description: "Upon arriving at the circus, Putt-Putt learns from B.J. Sweeny that all of the circus' acts are having problems. He shows Putt-Putt a piece of paper, showing the performers of the five main performers: Honko the Clown, The Flying Porkowskis, Phillipe the Flea, Reginald the Lion and Katie Cannonball. Putt-Putt volunteers to help around the circus, which Sweeny agrees to.",
             year: "2000",
             image: "PuttPuttCircus",
             genres: [Genre(rawValue: "Point-and-click")!])
    }
    static var puttPuttBalloon: Game {
        Game(id: 7,
             name: "Putt-Putt and Pep's Balloon-o-Rama",
             description: "Putt-Putt and Pep have balloons, but Pep accidentally releases them, so the two embark on a journey across various locations in prior Putt-Putt adventures, to find and pop balloons of many kinds, by having Putt-Putt bounce Pep into the air to hit them. Their journey eventually leads them to the surface of the Moon once again, which they reach by boarding a spaceship. After Pep pops every single balloon in the levels and he and Putt-Putt return to Earth, the latter commends the former's balloon-popping skills.",
             year: "1996",
             image: "PuttPuttBalloon",
             genres: [Genre(rawValue: "Action")!])
    }
    static var puttPuttStick: Game {
        Game(id: 7,
             name: "Putt-Putt and Pep's Dog on a Stick",
             description: "Putt-Putt goes with Pep to the recycling dump to deposit old bottles and cans. While Pep takes the recyclable trash inside the dump, he finds a pogo stick in good condition and starts bouncing on it. The two friends then go around the dump looking for good bones.",
             year: "1996",
             image: "PuttPuttStick",
             genres: [Genre(rawValue: "Action")!])
    }
    // PuttPuttStick's image messes up the list for some reason. Omitting it for now
    static var witcher3: Game {
        Game(id: 8,
             name: "The Witcher 3: Wild Hunt",
             description: "The world is in chaos. The air is thick with tension and the smoke of burnt villages. The fearsome Empire of Nilfgaard has struck again, ravaging the helpless Northern Kingdoms. The once mighty who tried to use Geralt for their own gain are now gone. In these uncertain times, no one can say what fortune holds in store, who will bring peace to the world and who will cause it only misery. But a force darker and deadlier emerges.",
             year: "2015",
             image: "Witcher3",
             genres: [Genre(rawValue: "Action")!, Genre(rawValue: "RPG")!])
    }
    static var minecraft: Game {
        Game(id: 9,
             name: "Minecraft",
             description: "Minecraft is a blocky sandbox game where players use blocks to create structures, craft items, and go on adventures. It's available on many platforms, including smartphones, tablets, computers, and most modern consoles. The game has no set goal, and players can explore, battle, or befriend creatures.",
             year: "2011",
             image: "Minecraft",
             genres: [Genre(rawValue: "Adventure")!])
    }
    static var tearsOfTheKingdom: Game {
        Game(id: 10,
             name: "The Legend of Zelda: Tears of the Kingdom",
             description: "In this sequel to the Legend of Zelda: Breath of the Wild game, you’ll decide your own path through the sprawling landscapes of Hyrule and the mysterious islands floating in the vast skies above. Can you harness the power of Link’s new abilities to fight back against the malevolent forces that threaten the kingdom?",
             year: "2023",
             image: "TearsOfTheKingdom",
             genres: [Genre(rawValue: "Action")!, Genre(rawValue: "Adventure")!])
    }
    static var Xenoblade1: Game {
        Game(id: 11,
             name: "Xenoblade Chronicles",
             description: "The setting of Xenoblade Chronicles originates from a world that was nothing but an endless ocean until two titans, the Bionis and the Mechonis,[f] came into existence and battled each other until only their frozen corpses remained. In the eons following their battle, they became the home for multiple forms of life. The Bionis is home to organic lifeforms, most prominently the humanoid Homs, who are virtually identical to humans in appearance and biology; the diminutive and furry Nopon; and the avian humanoid High Entia, whose lives span centuries. Conversely, the Mechonis is home to the mechanical humanoid Machina, whose lifespans span several millennia.[10][19][20] Life forms emit a substance known as ether, which can be used both as a form of magic and as a source of fuel. The Monado – the namesake of Xenoblade – is a mystical ether-controlling sword that the Homs wield in the battle against the Mechonis, which grants visions of the future to its wielder when fully controlled.",
             year: "2012",
             image: "Xenoblade1",
             genres: [Genre(rawValue: "Action")!, Genre(rawValue: "Adventure")!, Genre(rawValue: "RPG")!])
    }
    static var Persona3Reload: Game {
        Game(id: 12,
             name: "Persona 3 Reload",
             description: "Persona 3 Reload[c] is a 2024 role-playing video game developed and published by Atlus. Reload is a remake of Persona 3 (2006), the fourth main installment of the Persona series, itself a part of the larger Megami Tensei franchise. As with the original game, the protagonist is a high school student returning to his home city a decade after his parents were killed in a fatal car crash. He soon gains the potential to summon a Persona–the physical manifestation of his inner spirit, and joins the Specialized Extracurricular Execution Squad (S.E.E.S.), a group of like-minded Persona users. Together, they are tasked with defeating Shadows and uncovering the mystery of the Dark Hour.",
             year: "2024",
             image: "Persona3Reload",
             genres: [Genre(rawValue: "Adventure")!, Genre(rawValue: "RPG")!])
    }
    static var LastOfUs2: Game {
        Game(id: 13,
             name: "The Last of Us: Part 2",
             description: "A continuation of the critically acclaimed 2013 game, The Last of Us",
             year: "2020",
             image: "LastOfUs2",
             genres: [Genre(rawValue: "Adventure")!, Genre(rawValue: "RPG")!])
    }
}
