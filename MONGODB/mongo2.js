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

/***************************************************************
 *                 MONGODB MAP-REDUCE (FULL NOTES)
 *     This file contains complete theory + examples + code.
 ***************************************************************/

/**********************
 *  WHAT IS MAP-REDUCE?
 **********************
 Map-Reduce is a data processing technique in MongoDB.
 It is used for complex aggregation using 3 phases:
 1) Map
 2) Reduce
 3) Finalize (optional)
 It is useful for large datasets and custom logic.
*/

/**********************
 *       MAP PHASE
 **********************
 - Map scans each document
 - Emits (key, value) pairs
 Example:
   emit(this.category, 1);
*/
var mapFunction = function () {
    emit(this.category, 1);
};

/**********************
 *     REDUCE PHASE
 **********************
 - Groups values with same key
 - Performs sum, count, avg, etc.
*/
var reduceFunction = function (key, values) {
    return Array.sum(values);
};

/**********************
 *   FINALIZE PHASE (OPTIONAL)
 **********************
 - Used for final transformation
*/
var finalizeFunction = function (key, reducedValue) {
    return reducedValue;
};

/**********************
 *     COMPLETE EXAMPLE
 **********************
 Collection: products
 {
   "_id": 1, "name": "Phone", "category": "Electronics"
 }
 {
   "_id": 2, "name": "Laptop", "category": "Electronics"
 }
 {
   "_id": 3, "name": "Shirt", "category": "Clothes"
 }
*/
db.products.mapReduce(
    function () { emit(this.category, 1); },
    function (key, values) { return Array.sum(values); },
    { out: "category_count" }
);

/**********************
 * EXPECTED OUTPUT:
 * { "_id": "Electronics", "value": 2 }
 * { "_id": "Clothes", "value": 1 }
 ***********************/


/**********************
 *      SIMPLE DIAGRAM
 **********************
 INPUT COLLECTION
        ↓
   MAP FUNCTION
        ↓
   GROUP BY KEY
        ↓
   REDUCE FUNCTION
        ↓
 OUTPUT COLLECTION
*/


/**********************
 *   WHEN TO USE MAP-REDUCE?
 **********************
 - Complex operations
 - Custom JavaScript logic
 - Large data processing
 - When aggregation pipeline is not enough
*/


/**********************
 *       ADVANTAGES
 **********************
 - Powerful & flexible
 - Good for huge datasets
 - Supports JavaScript functions
 - Can run on distributed systems
*/


/**********************
 *    DISADVANTAGES
 **********************
 - Slower compared to Aggregation Pipeline
 - Uses JavaScript → performance slower
 - Not good for real-time
 - Aggregation pipeline preferred now
*/


/*******************************************************
 *   MAP-REDUCE VS AGGREGATION PIPELINE (SUMMARY)
 *******************************************************
 Map-Reduce:
  - Slower
  - Uses JS functions
  - Can implement very complex logic
  - Heavy processing

 Aggregation Pipeline:
  - Faster
  - Built-in operators
  - Recommended for 99% cases
  - High performance
*/


/*********************************************************
 *                 MORE EXAMPLES
 *********************************************************/

/**********************
 * 1) TOTAL PRICE PER CATEGORY
 **********************/
db.products.mapReduce(
    function () {
        emit(this.category, this.price);
    },
    function (key, values) {
        return Array.sum(values);
    },
    { out: "total_price_per_category" }
);

/**********************
 * 2) MAX PRICE PER CATEGORY
 **********************/
db.products.mapReduce(
    function () {
        emit(this.category, this.price);
    },
    function (key, values) {
        return Math.max.apply(null, values);
    },
    { out: "max_price_per_category" }
);

/**********************
 * 3) AVERAGE PRICE PER CATEGORY
 **********************/
db.products.mapReduce(
    function () {
        emit(this.category, this.price);
    },
    function (key, values) {
        return Array.sum(values) / values.length;
    },
    { out: "avg_price_per_category" }
);


/*********************************************************
 * END OF FILE
 *********************************************************/


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