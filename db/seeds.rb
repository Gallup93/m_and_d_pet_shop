shelter1 = Shelter.create(name: "Randy's Rodent Ranch", address: "555 Hamster Ave", city: "Richmond", state: "VA", zip: "12345")
shelter2 = Shelter.create(name: "Turkey Paradise", address: "876 Sandwich Lane", city: "Cheyenne", state: "WY", zip: "23456")
shelter3 = Shelter.create(name: "Lots O Lizards", address: "2987 Big Pond Pkwy", city: "Jacksonville", state: "FL", zip: "14356")
shelter4 = Shelter.create(name: "Friends of the Sea", address: "91634 Sandy Shores", city: "San Diego", state: "CA", zip: "90210")

s1_pet1 = shelter1.pets.create(name: "Geraldo", 
                                    image: "https://images.freeimages.com/images/large-previews/4bc/rodent-1383599.jpg", 
                                    age: 2,
                                    sex: "male",
                                    description: "Cute with an attitude")
s1_pet2 = shelter1.pets.create(name: "Paula", 
                                    image: "https://images.freeimages.com/images/large-previews/1f1/prairiedog-1515344.jpg", 
                                    age: 9,
                                    sex: "female",
                                    description: "Has a bad habit of digging holes")
s1_pet3 = shelter1.pets.create(name: "Harold", 
                                    image: "https://images.freeimages.com/images/large-previews/45c/squirrel-1381519.jpg", 
                                    age: 15,
                                    sex: "male",
                                    description: "Just an old curmudgeon")


s2_pet1 = shelter2.pets.create(name: "Belinda", 
                                    image: "https://images.freeimages.com/images/large-previews/790/turkey-1368576.jpg", 
                                    age: 4,
                                    sex: "female",
                                    description: "Does not like November")
s2_pet2 = shelter2.pets.create(name: "Marcus", 
                                    image: "https://images.freeimages.com/images/large-previews/777/turkey-1397218.jpg", 
                                    age: 1,
                                    sex: "male",
                                    description: "Enjoys chips and salsa")
s2_pet3 = shelter2.pets.create(name: "Juanita", 
                                    image: "https://images.freeimages.com/images/large-previews/a7a/turkey-1498320.jpg", 
                                    age: 6,
                                    sex: "female",
                                    description: "Do not mention the nose...")


s3_pet1 = shelter3.pets.create(name: "Gregory", 
                                    image: "https://images.freeimages.com/images/large-previews/54e/lizard-1394369.jpg", 
                                    age: 9,
                                    sex: "male",
                                    description: "Can be bribed with Cognac")
s3_pet2 = shelter3.pets.create(name: "Sheila", 
                                    image: "https://images.freeimages.com/images/large-previews/fff/lizard-2-1390935.jpg", 
                                    age: 2,
                                    sex: "female",
                                    description: "Not a fan of hats")
s3_pet2 = shelter3.pets.create(name: "Carl", 
                                    image: "https://images.freeimages.com/images/large-previews/244/komodo-dragon-1563168.jpg", 
                                    age: 52,
                                    sex: "male",
                                    description: "Does not play well with others")



s4_pet1 = shelter4.pets.create(name: "Leona", 
                                    image: "https://images.freeimages.com/images/large-previews/055/fish-1544906.jpg", 
                                    age: 8,
                                    sex: "female",
                                    description: "Slighty toxic past")
s4_pet2 = shelter4.pets.create(name: "Timothy", 
                                    image: "https://images.freeimages.com/images/large-previews/bfa/spotted-fish-1372266.jpg", 
                                    age: 2,
                                    sex: "male",
                                    description: "Very timid but sweet")
s4_pet3 = shelter4.pets.create(name: "Sarah", 
                                    image: "https://images.freeimages.com/images/large-previews/d1a/shark-1384087.jpg", 
                                    age: 10,
                                    sex: "female",
                                    description: "Not ideal for your pool")

