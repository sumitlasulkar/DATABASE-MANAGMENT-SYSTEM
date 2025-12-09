/***************************************************************
 *                     MONGODB OPERATORS
 *   All important operators grouped + definitions in comments.
 *   Copy-paste ready JavaScript file.
 ***************************************************************/


/***************************************************************
 *                  1) COMPARISON OPERATORS
 ***************************************************************
 $eq     → equal to
 $ne     → not equal to
 $gt     → greater than
 $gte    → greater than or equal to
 $lt     → less than
 $lte    → less than or equal to
 $in     → matches any value in an array
 $nin    → not in array
***************************************************************/

db.users.find({
    age: { $gte: 18, $lte: 30 }      // between 18 and 30
});

db.products.find({
    category: { $in: ["mobile", "laptop"] }
});


/***************************************************************
 *                  2) LOGICAL OPERATORS
 ***************************************************************
 $and   → all conditions true
 $or    → at least one condition true
 $not   → negates expression
 $nor   → neither condition true
***************************************************************/

db.users.find({
    $and: [{ age: { $gte: 18 } }, { city: "Pune" }]
});

db.users.find({
    $or: [{ active: true }, { premium: true }]
});


/***************************************************************
 *                  3) ELEMENT OPERATORS
 ***************************************************************
 $exists → checks if field exists or not
 $type   → matches BSON type (string, number, bool, array...)
***************************************************************/

db.users.find({ email: { $exists: true } });

db.users.find({ age: { $type: "number" } });


/***************************************************************
 *                  4) ARRAY OPERATORS
 ***************************************************************
 $all        → match all values
 $size       → match array size
 $elemMatch  → match specific element condition
***************************************************************/

db.items.find({ tags: { $all: ["new", "sale"] } });

db.items.find({ ratings: { $size: 5 } });

db.items.find({
    reviews: { $elemMatch: { rating: { $gte: 4 }, user: "Sumit" } }
});


/***************************************************************
 *                  5) EVALUATION OPERATORS
 ***************************************************************
 $regex     → pattern matching
 $expr      → use aggregation expressions
 $jsonSchema→ validate documents
***************************************************************/

db.users.find({ name: { $regex: /^S/i } });

db.sales.find({
    $expr: { $gt: ["$amount", "$discount"] }
});


/***************************************************************
 *                  6) UPDATE OPERATORS
 ***************************************************************
 $set      → update or add field
 $unset    → remove field
 $inc      → increment number
 $mul      → multiply value
 $rename   → rename field
 $push     → add value to array
 $pop      → remove from array
 $pull     → remove matching elements
 $addToSet → push only if unique
 $min      → keep lower value
 $max      → keep higher value
***************************************************************/

db.users.updateOne(
    { name: "Sumit" },
    { $set: { city: "Pune" } }
);

db.users.updateOne(
    { name: "Sumit" },
    { $inc: { score: 10 } }
);

db.users.updateOne(
    { name: "Sumit" },
    { $push: { skills: "MongoDB" } }
);


/***************************************************************
 *                  7) AGGREGATION OPERATORS
 ***************************************************************
 $match     → filter documents
 $group     → group by field
 $sort      → sort ascending/descending
 $project   → shape output fields
 $limit     → limit results
 $skip      → skip documents
 $sum       → sum values
 $avg       → average
 $min       → minimum
 $max       → maximum
 $first     → first value in group
 $last      → last value in group
 $count     → count documents
***************************************************************/

db.orders.aggregate([
    { $match: { status: "delivered" } },
    { $group: { _id: "$userId", totalAmount: { $sum: "$amount" } } },
    { $sort: { totalAmount: -1 } }
]);


/***************************************************************
 *            8) TEXT SEARCH OPERATORS
 ***************************************************************
 $text   → search text index
 $search → search string
 $meta   → return metadata (e.g., textScore)
***************************************************************/

db.products.createIndex({ name: "text", description: "text" });

db.products.find({
    $text: { $search: "laptop fast" }
});


/***************************************************************
 *            9) GEOSPATIAL OPERATORS
 ***************************************************************
 $geoWithin      → inside area
 $geoIntersects  → intersects geometry
 $near           → nearest points
 $nearSphere     → nearest using spherical geometry
***************************************************************/

/* Example */
db.places.find({
    location: {
        $near: {
            $geometry: { type: "Point", coordinates: [72.88, 19.07] },
            $maxDistance: 2000
        }
    }
});


/***************************************************************
 *            10) BITWISE OPERATORS
 ***************************************************************
 $bitsAllSet
 $bitsAnySet
 $bitsAllClear
 $bitsAnyClear
***************************************************************/

db.flags.find({
    permissions: { $bitsAllSet: [1, 4] }
});


/***************************************************************
 *                     END OF FILE
 ***************************************************************/