// CRUD operations

// Create operation
// to insert document in database

// single document
db.inventory.insertOne(
    {item: "canvas",qty: 100, tags: ["cotton"], size: { h:28, w:35.5, uom: "cm"}}
)

// multiple document
db.inventory.insertMany(
    [
        {item: "canvas",qty: 100, tags: ["cotton"], size: { h:28, w:35.5, uom: "cm"}, status: ["p"]},
        {item: "canvas",qty: 100, tags: ["cotton"], size: { h:28, w:35.5, uom: "cm"}, status: ["p"]},
        {item: "canvas",qty: 100, tags: ["cotton"], size: { h:28, w:35.5, uom: "cm"}, status: ["p"]},
        {item: "canvas",qty: 100, tags: ["cotton"], size: { h:28, w:35.5, uom: "cm"}, status: ["p"]},
        {item: "canvas",qty: 100, tags: ["cotton"], size: { h:28, w:35.5, uom: "cm"}, status: ["p"]}
    ]
)


// Read operation
// to access file present in database

// to fetch all documents
db.inventory.find()
db.inventory.find({})

// to fetch selective elements
// ex. fetch elements with qty 90
db.inventory.find({qty:90})
db.inventory.find({tags:{$in:["cotton","D"]}})
// opertors in Read operation
// AND - both condition should true then only data fetches or document
db.inventory.find({tags:"cotton", qty: {$lt: 100}})
// OR - one condition true then fetch data or document
db.inventory.find({$or: [{tags:"cotton"}, {qty: { $lt: 100 }}]})
// to directly fetch one single document not an array of entire documents
db.inventory.findOne({tags:{$in:["cotton","D"]}})


// Update operation
// to update an document presen in database

// to update one document
db.inventory.updateOne(
    {item: "canvas"},
    {
        $set: {"size.uom": "cm", status: "p"},
        $currentDate: {lastModified: true}
    }
)

// to update many documents
db.inventory.updateMany(
    {item: "canvas"},
    {
        $set: {"size.uom": "cm", status: "p"},
        $currentDate: {lastModified: true}
    }
)

// to replace one document
db.inventory.repalceOne(
    {item: "canvas"},
    {
        $set: {"size.uom": "cm", status: "p"},
        $currentDate: {lastModified: true}
    }
) 

// to replace many documents
db.inventory.replaceMany(
    {item: "canvas"},
    {
        $set: {"size.uom": "cm", status: "p"},
        $currentDate: {lastModified: true}
    }
)


// Delete opertion
// use to delete documents in database

// delete single element
db.inventory.deleteOne({status: "p"})
// delete all elements
db.inventory.deleteMany({})
db.inventory.deleteMany({status: "p"})

