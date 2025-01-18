import Foundation

class Restaurant: Codable {
    var id: UUID
    var name: String
    var rating: Double
    var viewCount: Double
    var cuisine: [String]
    var location: String
    var distance: Double
    var deliveryTime: Int
    var image: String
    var categories: String
    var speciality: String
    
    init(id: UUID, name: String, rating: Double, viewCount: Double, cuisine: [String], location: String, distance: Double, deliveryTime: Int, image: String, categories: String, speciality: String) {
        self.id = id
        self.name = name
        self.rating = rating
        self.viewCount = viewCount/1000
        self.cuisine = cuisine
        self.location = location
        self.distance = distance
        self.deliveryTime = deliveryTime
        self.image = image
        self.categories = categories
        self.speciality = speciality
    }
}

let RestaurantsArray: [Restaurant] = [
    Restaurant(
        id: UUID(),
        name: "Mapps Café",
        rating: 3.4,
        viewCount: 1200,
        cuisine: ["British", "Cafe"],
        location: "26 East Bay Lane, Hackney Wick, London E15 2GW, UK",
        distance: 1.2,
        deliveryTime: 25,
        image: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/13/1b/d4/6d/20180524-133428-largejpg.jpg?w=1000&h=600&s=1",
        categories: "Cafe",
        speciality: "Full English Breakfast"
    ),
    Restaurant(
           id: UUID(),
           name: "The Real Greek",
           rating: 4.4,
           viewCount: 2200,
           cuisine: ["Greek", "Mediterranean"],
           location: "Westfield Stratford City, London E20 1EJ, UK",
           distance: 0.5,
           deliveryTime: 30,
           image: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/19/64/87/0f/the-real-greek-strand.jpg?w=1400&h=800&s=1",
           categories: "Greek",
           speciality: "Greek Mezze"
       ),
       Restaurant(
           id: UUID(),
           name: "Pizza East",
           rating: 4.2,
           viewCount: 1800,
           cuisine: ["Italian", "Pizza"],
           location: "Westfield Stratford City, London E20 1EJ, UK",
           distance: 0.6,
           deliveryTime: 30,
           image: "https://i0.wp.com/beastmag.co.uk/wp-content/uploads/2019/02/zzetta-pizza-east-london.png?w=600&ssl=1",
           categories: "Pizza",
           speciality: "Wood-Fired Pizzas"
       ),
       Restaurant(
           id: UUID(),
           name: "The Stratford Brasserie",
           rating: 4.5,
           viewCount: 1500,
           cuisine: ["European", "Brasserie"],
           location: "1A Stratford Place, London E15 1XE, UK",
           distance: 0.7,
           deliveryTime: 45,
           image: "https://media-cdn.tripadvisor.com/media/photo-s/18/61/4b/8f/the-stratford-brasserie.jpg",
           categories: "Brasserie",
           speciality: "Grilled Steaks"
       ),
       Restaurant(
           id: UUID(),
           name: "The Capital Kebab House",
           rating: 4.6,
           viewCount: 2300,
           cuisine: ["Middle Eastern", "Kebab"],
           location: "170 High Street, London E15 2JP, UK",
           distance: 1.1,
           deliveryTime: 25,
           image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzAK_RjMzuVsVp7hTuK3UptEWffwa3VwiLvg&s",
           categories: "Kebab",
           speciality: "Chicken Kebab"
       ),
       Restaurant(
           id: UUID(),
           name: "The Breakfast Club",
           rating: 4.7,
           viewCount: 2000,
           cuisine: ["Breakfast", "Brunch"],
           location: "12-16 The Piazza, Covent Garden, London WC2E 8HD, UK",
           distance: 2.0,
           deliveryTime: 40,
           image: "https://tb-static.uber.com/prod/image-proc/processed_images/9fb712d8008141bd337054ac92bdbdd2/30be7d11a3ed6f6183354d1933fbb6c7.jpeg",
           categories: "Breakfast",
           speciality: "Full English Breakfast"
       ),
       Restaurant(
           id: UUID(),
           name: "Yard Sale Pizza",
           rating: 4.3,
           viewCount: 1600,
           cuisine: ["Pizza", "Italian"],
           location: "127 Roman Rd, Bethnal Green, London E2 0QN, UK",
           distance: 2.5,
           deliveryTime: 35,
           image: "https://media-cdn.tripadvisor.com/media/photo-s/1a/fe/11/cf/the-aubergine.jpg",
           categories: "Pizza",
           speciality: "Fresh Pizza"
       ),
       Restaurant(
           id: UUID(),
           name: "The Green Goose",
           rating: 4.2,
           viewCount: 1800,
           cuisine: ["American", "Burger"],
           location: "63 Grove Rd, Hackney, London E9 7JQ, UK",
           distance: 3.0,
           deliveryTime: 40,
           image: "https://img.cdn4dd.com/cdn-cgi/image/fit=cover,width=600,height=400,format=auto,quality=80/https://doordash-static.s3.amazonaws.com/media/store/header/171b0676-474a-4f25-9481-1047d167ed91.jpg",
           categories: "Burger",
           speciality: "Juicy Burgers"
       ),
       Restaurant(
           id: UUID(),
           name: "Bistrotheque",
           rating: 4.4,
           viewCount: 1400,
           cuisine: ["European", "French"],
           location: "23-27 Wadeson St, Bethnal Green, London E2 9DR, UK",
           distance: 3.4,
           deliveryTime: 50,
           image: "https://www.bistrotheque.com/files/_mediumImage/Skate-Wing.jpg",
           categories: "French",
           speciality: "Steak Frites"
       ),
       Restaurant(
           id: UUID(),
           name: "Fish House",
           rating: 4.7,
           viewCount: 2500,
           cuisine: ["Seafood", "British"],
           location: "115 Victoria Park Rd, London E9 7JN, UK",
           distance: 3.6,
           deliveryTime: 45,
           image: "https://fishhousepensacola.com/wp-content/uploads/sites/2/elementor/thumbs/jyEinDCg-scaled-e1593206131838-q3ugt0z91gjjsiuqyyivhg6ro75jojpgc1ufp33540.jpeg",
           categories: "Seafood",
           speciality: "Fish and Chips"
       ),
       Restaurant(
           id: UUID(),
           name: "The Spitalfields Pub & Kitchen",
           rating: 4.3,
           viewCount: 2200,
           cuisine: ["British", "Pub Food"],
           location: "65 Commercial St, London E1 6BD, UK",
           distance: 4.0,
           deliveryTime: 45,
           image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShIt8GY4RBUmK8sGZJWvbdBH-z_WbLVjFn1vfnVAFzfaHFzvgIFDz58Xd8WONB2ff8GG0&usqp=CAU",
           categories: "Pub",
           speciality: "Fish and Chips"
       ),
       Restaurant(
           id: UUID(),
           name: "Dishoom Shoreditch",
           rating: 4.8,
           viewCount: 3000,
           cuisine: ["Indian", "Bombay Cafe"],
           location: "7 Boundary St, Shoreditch, London E2 7JE, UK",
           distance: 4.2,
           deliveryTime: 50,
           image: "https://www.dishoom.com/_next/image/?url=https%3A%2F%2Fcdn.sanity.io%2Fimages%2Fdaku84np%2Fproduction%2Fbe6d8b3d12a09568b1ff08850ba42bd5f446cd34-1200x801.jpg%3Ffit%3Dmax%26auto%3Dformat&w=3840&q=75",
           categories: "Indian",
           speciality: "Bombay Platter"
       ),
       Restaurant(
           id: UUID(),
           name: "Hawksmoor Spitalfields",
           rating: 4.6,
           viewCount: 2800,
           cuisine: ["Steakhouse", "British"],
           location: "11 Artillery Ln, London E1 7LS, UK",
           distance: 4.5,
           deliveryTime: 60,
           image: "https://thehawksmoor.com/wp-content/uploads/2022/06/Heritage-tomato-salad-with-whipped-Graceburn-STARTER-1-Edit-XL.jpg",
           categories: "Steakhouse",
           speciality: "Dry-Aged Steaks"
       ),
       Restaurant(
           id: UUID(),
           name: "Padella",
           rating: 4.7,
           viewCount: 3200,
           cuisine: ["Italian", "Pasta"],
           location: "3 Southwark St, London SE1 1TQ, UK",
           distance: 4.8,
           deliveryTime: 40,
           image: "padella.jpg",
           categories: "Italian",
           speciality: "Handmade Pasta"
       ),
       Restaurant(
           id: UUID(),
           name: "Flat Iron",
           rating: 4.4,
           viewCount: 2600,
           cuisine: ["Steakhouse", "British"],
           location: "17 Beak St, London W1F 9RW, UK",
           distance: 5.1,
           deliveryTime: 55,
           image: "flat_iron.jpg",
           categories: "Steakhouse",
           speciality: "28-Day Aged Steaks"
       ),
       Restaurant(
           id: UUID(),
           name: "Dishoom Covent Garden",
           rating: 4.9,
           viewCount: 3500,
           cuisine: ["Indian", "Bombay Cafe"],
           location: "12 Upper St Martin's Lane, London WC2H 9FB, UK",
           distance: 5.3,
           deliveryTime: 60,
           image: "dishoom_covent_garden.jpg",
           categories: "Indian",
           speciality: "Chicken Ruby"
       ),
       Restaurant(
           id: UUID(),
           name: "Borough Market",
           rating: 4.8,
           viewCount: 4000,
           cuisine: ["International", "Market"],
           location: "8 Southwark St, London SE1 1TL, UK",
           distance: 5.5,
           deliveryTime: 50,
           image: "borough_market.jpg",
           categories: "Market",
           speciality: "Fresh Produce"
       ),
       Restaurant(
           id: UUID(),
           name: "Sketch",
           rating: 4.7,
           viewCount: 3800,
           cuisine: ["Modern European", "Fine Dining"],
           location: "9 Conduit St, Mayfair, London W1S 2XG, UK",
           distance: 5.8,
           deliveryTime: 70,
           image: "sketch_Restaurant.jpg",
           categories: "Fine Dining",
           speciality: "The Glade"
       ),
       Restaurant(
           id: UUID(),
           name: "The Ivy",
           rating: 4.6,
           viewCount: 3400,
           cuisine: ["British", "Modern European"],
           location: "1-5 West St, London WC2H 9NQ, UK",
           distance: 6.1,
           deliveryTime: 65,
           image: "the_ivy.jpg",
           categories: "Modern European",
           speciality: "Shepherds Pie"
       ),
       Restaurant(
           id: UUID(),
           name: "Rules",
           rating: 4.5,
           viewCount: 3000,
           cuisine: ["British", "Traditional"],
           location: "35 Maiden Ln, Covent Garden, London WC2E 7LB, UK",
           distance: 6.3,
           deliveryTime: 60,
           image: "rules_Restaurant.jpg",
           categories: "British",
           speciality: "Roast Beef"
       ),
       Restaurant(
           id: UUID(),
           name: "The Wolseley",
           rating: 4.8,
           viewCount: 3600,
           cuisine: ["European", "Viennese"],
           location: "160 Piccadilly, St. James's, London W1J 9EB, UK",
           distance: 6.6,
           deliveryTime: 70,
           image: "the_wolseley.jpg",
           categories: "European",
           speciality: "Wiener Schnitzel"
       ),
    Restaurant(
        id: UUID(),
        name: "The Cow Stratford",
        rating: 3.5,
        viewCount: 1100,
        cuisine: ["British", "Pub"],
        location: "Westfield Stratford City, London E20 1GL, UK",
        distance: 2.0,
        deliveryTime: 35,
        image: "the_cow.jpg",
        categories: "Pub",
        speciality: "Craft Beer and Burgers"
    ),
    Restaurant(
        id: UUID(),
        name: "Italian Focaccia",
        rating: 3.8,
        viewCount: 1400,
        cuisine: ["Italian"],
        location: "The Street, Stratford City, London E20 1GL, UK",
        distance: 2.1,
        deliveryTime: 40,
        image: "italian_focaccia.jpg",
        categories: "Italian",
        speciality: "Focaccia Sandwiches"
    ),
    Restaurant(
        id: UUID(),
        name: "TapaVino",
        rating: 3.6,
        viewCount: 870,
        cuisine: ["Spanish", "Tapas"],
        location: "Unit 24, Hackney Bridge, London E15 2GW, UK",
        distance: 1.5,
        deliveryTime: 30,
        image: "tapavino.jpg",
        categories: "Tapas",
        speciality: "Chorizo & Manchego"
    ),
    Restaurant(
        id: UUID(),
        name: "The White Horse",
        rating: 3.2,
        viewCount: 780,
        cuisine: ["Pub", "British"],
        location: "Greenway, Olympic Park, London E15 2PJ, UK",
        distance: 1.7,
        deliveryTime: 25,
        image: "the_white_horse.jpg",
        categories: "Pub",
        speciality: "Cask Ales and Sunday Roast"
    ),
    Restaurant(
        id: UUID(),
        name: "The Silver Spoon Diner",
        rating: 3.5,
        viewCount: 890,
        cuisine: ["American", "British"],
        location: "Silverstone Circuit, Towcester NN12 8TN, UK",
        distance: 60.0,
        deliveryTime: 75,
        image: "silver_spoon.jpg",
        categories: "Diner",
        speciality: "Classic Milkshakes and Burgers"
    ),
    Restaurant(
        id: UUID(),
        name: "Pit Stop Grill",
        rating: 3.3,
        viewCount: 950,
        cuisine: ["Grill", "Burgers"],
        location: "Towcester, Silverstone Circuit NN12 8TN, UK",
        distance: 61.2,
        deliveryTime: 70,
        image: "pit_stop.jpg",
        categories: "Grill",
        speciality: "Barbecue Platters"
    ),
    Restaurant(
        id: UUID(),
        name: "Hackney Wick Pizza",
        rating: 3.9,
        viewCount: 2000,
        cuisine: ["Italian", "Pizza"],
        location: "8 Queen's Yard, Hackney Wick, London E9 5EN, UK",
        distance: 1.1,
        deliveryTime: 20,
        image: "hackney_wick_pizza.jpg",
        categories: "Pizza",
        speciality: "Neapolitan Pizza"
    ),
    Restaurant(
        id: UUID(),
        name: "Limehouse Thai",
        rating: 3.8,
        viewCount: 1350,
        cuisine: ["Thai"],
        location: "Stratford High Street, London E15 2QQ, UK",
        distance: 1.9,
        deliveryTime: 35,
        image: "limehouse_thai.jpg",
        categories: "Thai",
        speciality: "Pad Thai and Green Curry"
    )
]


