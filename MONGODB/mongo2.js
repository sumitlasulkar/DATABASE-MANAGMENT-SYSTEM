// to fetch one single document
db.inventory.find().limit(1)
// to skip first document
db.inventory.find().skip(1)
// to sort elements in increasing order
db.inventory.find().sort({qty: 1})
// to sort elements in decreasing order
db.inventory.find().sort({qty: -1})
//pagination: if there are 10 pages and you want to fetch last ones
db.blogs.find().skip(0).limit(10)


// Operators and complex quries
// $in and $ or are operators, operators are presented by $ sign
// there are many operators learn it through mongo db documentation
db.inventory.find({$or: [{tags:"cotton"}, {qty: { $lt: 100 }}]})
db.inventory.findOne({tags:{$in:["cotton","D"]}})


// Aggregation pipeline in mongodb
// used when we want that our query run in steps and we can use it again and again
// you can add more stages like sort, learn through documentation
db.orders.aggregate([
    // stage1: filter document by condition
   {
    $match: {qty: 100}
   },
   // stage2: only documents which never come under condition or reaining elements
   {
    $group: {item: "canvas", totalQty: {$sum: "$qty"}}
   }
])