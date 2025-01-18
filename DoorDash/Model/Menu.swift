import Foundation

class MenuItem: Codable {
    var name: String
    var price: Double
    var image: String
    
    var veg: Bool
    var description: String
    
    init(name: String, price: Double, image: String, veg: Bool, description: String) {
        self.name = name
        self.price = price
        self.image = image
        self.veg = veg
        self.description = description
    }
}


let menuItems: [MenuItem] = [
    MenuItem(
        name: "Fish and Chips",
        price: 12.99,
        image: "https://images.unsplash.com/photo-1579208030886-b937da0925dc?q=80&w=2970&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        veg: false,
        description: "Classic British battered cod served with golden chips, mushy peas, and tartar sauce."
    ),
    MenuItem(
        name: "Shepherd’s Pie",
        price: 11.99,
        image: "https://images.unsplash.com/photo-1601000938181-925c9bc969fa?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        veg: false,
        description: "A hearty dish of minced lamb and vegetables topped with creamy mashed potatoes."
    ),
    MenuItem(
        name: "Full English Breakfast",
        price: 9.99,
        image: "https://plus.unsplash.com/premium_photo-1664391818745-7d58e69c4e6c?q=80&w=3149&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        veg: false,
        description: "A traditional breakfast with eggs, sausages, bacon, beans, tomatoes, and toast."
    ),
    MenuItem(
        name: "Vegan Sunday Roast",
        price: 14.50,
        image: "https://plus.unsplash.com/premium_photo-1700575181938-4f4dd9e5b386?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        veg: true,
        description: "Roasted seasonal vegetables with vegan gravy, Yorkshire pudding, and roast potatoes."
    ),
    MenuItem(
        name: "Chicken Tikka Masala",
        price: 13.99,
        image: "https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?q=80&w=2970&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        veg: false,
        description: "Tender chicken in a creamy tomato-based curry sauce, served with basmati rice."
    ),
    MenuItem(
        name: "Mushroom Risotto",
        price: 12.50,
        image: "https://images.unsplash.com/photo-1637361875628-c8617fdda8db?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        veg: true,
        description: "Creamy risotto made with wild mushrooms, Parmesan cheese, and a hint of truffle oil."
    ),
    MenuItem(
        name: "Bangers and Mash",
        price: 10.99,
        image: "https://plus.unsplash.com/premium_photo-1726877132178-4d6bd6d33e07?q=80&w=3044&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        veg: false,
        description: "Traditional sausages served with mashed potatoes and a rich onion gravy."
    ),
    MenuItem(
        name: "Vegan Fish and Chips",
        price: 13.50,
        image: "https://plus.unsplash.com/premium_photo-1712932545455-2489f90aad8a?q=80&w=2969&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        veg: true,
        description: "Banana blossom 'fish' in a crispy batter served with chips, vegan tartar sauce, and peas."
    ),
    MenuItem(
        name: "Sticky Toffee Pudding",
        price: 6.99,
        image: "https://images.unsplash.com/photo-1604423907382-6eaa8b5ccb3a?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        veg: true,
        description: "A warm sponge cake made with dates and covered in a rich toffee sauce, served with cream."
    ),
    MenuItem(
        name: "Beef Wellington",
        price: 22.99,
        image: "https://images.unsplash.com/photo-1707616954302-de63d45c3135?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        veg: false,
        description: "Succulent beef tenderloin coated with mushroom duxelles and wrapped in puff pastry."
    ),
    MenuItem(
        name: "Ploughman’s Lunch",
        price: 9.99,
        image: "https://images.unsplash.com/photo-1505207957430-0378f105b2ba?q=80&w=3174&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        veg: false,
        description: "A rustic plate of cheddar cheese, pickles, apple, crusty bread, and chutney."
    ),
    MenuItem(
        name: "Vegetarian Ploughman’s Lunch",
        price: 9.99,
        image: "https://images.unsplash.com/photo-1505207957430-0378f105b2ba?q=80&w=3174&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        veg: true,
        description: "A vegetarian version with a variety of cheeses, pickles, apple, and fresh bread."
    ),
    MenuItem(
        name: "Cornish Pasty",
        price: 5.99,
        image: "https://images.unsplash.com/photo-1608039783021-6116a558f0c5?q=80&w=3024&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        veg: false,
        description: "Traditional pastry filled with beef, potatoes, and vegetables, perfect for a quick bite."
    ),
    MenuItem(
        name: "Vegetarian Cornish Pasty",
        price: 5.99,
        image: "https://images.unsplash.com/photo-1608039783021-6116a558f0c5?q=80&w=3024&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        veg: true,
        description: "A savory pastry filled with spiced vegetables, carrots, and potatoes."
    ),
    MenuItem(
        name: "Victoria Sponge Cake",
        price: 4.99,
        image: "https://plus.unsplash.com/premium_photo-1688385990418-f4429e0c4ded?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        veg: true,
        description: "A light sponge cake filled with jam and cream, perfect for afternoon tea."
    )
]
