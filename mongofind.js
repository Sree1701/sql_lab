// 🟢 1. Create Database
use Inventory

// 🟢 2. Insert Documents into products collection
db.products.insertMany([
  {
    _id: 1,
    name: "xPhone",
    price: 799,
    releaseDate: ISODate("2011-05-14"),
    spec: { ram: 4, screen: 6.5, cpu: 2.66 },
    color: ["white", "black"],
    storage: [64, 128, 256]
  },
  {
    _id: 2,
    name: "xTablet",
    price: 899,
    releaseDate: ISODate("2011-09-01"),
    spec: { ram: 16, screen: 9.5, cpu: 3.66 },
    color: ["white", "black", "purple"],
    storage: [128, 256, 512]
  }
])

// 🔵 3. Display all documents
db.products.find()

// 🔵 4. Display product with _id = 2
db.products.find({ _id: 2 })

// 🔵 5. Display first document
db.products.findOne()

// 🟡 6. Display name and price of _id = 5
db.products.find(
  { _id: 5 },
  { name: 1, price: 1 }
)

// 🟣 7. Products where price = 899
db.products.find(
  { price: 899 },
  { name: 1, price: 1 }
)

// 🟣 8. Products where RAM = 4
db.products.find(
  { "spec.ram": 4 },
  { name: 1, "spec.ram": 1 }
)

// 🟠 9. Products where color contains black
db.products.find(
  { color: "black" },
  { name: 1, color: 1 }
)

// 🟠 10. Products with releaseDate = 2020-05-14
db.products.find(
  { releaseDate: ISODate("2020-05-14") },
  { name: 1, releaseDate: 1 }
)

// 🔴 11. Products where price < 799
db.products.find(
  { price: { $lt: 799 } },
  { name: 1, price: 1 }
)

// 🔴 12. Products where screen < 7
db.products.find(
  { "spec.screen": { $lt: 7 } },
  { name: 1, "spec.screen": 1 }
)

// 🔴 13. Storage has element < 128
db.products.find(
  { storage: { $lt: 128 } },
  { name: 1, storage: 1 }
)

// 🟤 14. Price is 699 or 799
db.products.find(
  { price: { $in: [699, 799] } },
  { name: 1, price: 1 }
)

// 🟤 15. Color contains black or white
db.products.find(
  { color: { $in: ["black", "white"] } },
  { name: 1, color: 1 }
)

// ⚫ 16. Price is not 699 or 799
db.products.find(
  { price: { $nin: [699, 799] } },
  { name: 1, price: 1 }
)

// ⚫ 17. Color not black or white
db.products.find(
  { color: { $nin: ["black", "white"] } },
  { name: 1, color: 1 }
)

// 🟩 18. Price = 899 AND color white/black
db.products.find(
{
  $and: [
    { price: 899 },
    { color: { $in: ["white", "black"] } }
  ]
},
{
  name: 1,
  price: 1,
  color: 1
}
)

// 🟩 19. Price < 699 OR > 799
db.products.find(
{
  $or: [
    { price: { $lt: 699 } },
    { price: { $gt: 799 } }
  ]
},
{
  name: 1,
  price: 1
}
)

// 🔷 20. Sort by RAM ascending
db.products.find(
{},
{ name: 1, spec: 1 }
).sort({ "spec.ram": 1 })

// 🔷 21. Sort by releaseDate descending
db.products.find(
{},
{ name: 1, releaseDate: 1 }
).sort({ releaseDate: -1 })

// 🔷 22. Sort by price and name ascending
db.products.find(
{},
{ name: 1, price: 1 }
).sort({ price: 1, name: 1 })

// 🏆 23. Most expensive product
db.products.find(
{},
{ name: 1, price: 1 }
).sort({ price: -1 }).limit(1)