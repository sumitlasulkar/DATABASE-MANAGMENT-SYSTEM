/***************************************************************
 *                      MONGODB INDEXING
 *   Complete theory + examples in one JS file (copy-paste ready)
 ***************************************************************/

/**********************
 *       WHAT IS INDEX?
 **********************
 An index is a special data structure in MongoDB that stores
 a small portion of data in an easy-to-search form.
 Indexes make search operations much faster.
 Without index = COLLECTION SCAN (slow)
 With index    = INDEX SCAN (fast)
*/

/**********************
 *    WHY INDEXING?
 **********************
 - Improves query performance
 - Fast searching and sorting
 - Reduces disk I/O
 - Helps large collections
*/

/**********************
 *   1) SINGLE FIELD INDEX
 **********************/
db.students.createIndex({ name: 1 });   // ascending
db.students.createIndex({ name: -1 });  // descending

/**********************
 *   2) COMPOUND INDEX
 **********************
 Used when queries use multiple fields.
 Order of fields MATTERS.
*/
db.students.createIndex({ name: 1, age: -1 });

/**********************
 *   3) UNIQUE INDEX
 **********************
 Prevents duplicate values.
*/
db.users.createIndex(
    { email: 1 },
    { unique: true }
);

/**********************
 *   4) TEXT INDEX
 **********************
 Used for text searching across fields.
*/
db.articles.createIndex({
    title: "text",
    content: "text"
});

// Text search
db.articles.find({
    $text: { $search: "mongodb indexing" }
});

/**********************
 *   5) HASHED INDEX
 **********************
 Used mainly for sharding.
*/
db.users.createIndex({ user_id: "hashed" });

/**********************
 *   6) MULTIKEY INDEX
 **********************
 Used for arrays.
 Example document:
 { name: "A", tags: ["red", "blue", "green"] }
*/
db.items.createIndex({ tags: 1 });

/**********************
 *   7) TTL INDEX (Time To Live)
 **********************
 Automatically deletes documents after given seconds.
*/
db.sessions.createIndex(
    { createdAt: 1 },
    { expireAfterSeconds: 3600 }
);

/**********************
 *   8) SPARSE INDEX
 **********************
 Only indexes documents where the field exists.
*/
db.users.createIndex(
    { phone: 1 },
    { sparse: true }
);

/**********************
 *   9) PARTIAL INDEX
 **********************
 Index only specific documents based on filter.
*/
db.users.createIndex(
    { age: 1 },
    { partialFilterExpression: { age: { $gt: 18 } } }
);

/**********************
 *   VIEW INDEXES
 **********************/
db.students.getIndexes();

/**********************
 *   DROP INDEX
 **********************/
db.students.dropIndex({ name: 1 });

/**********************
 *   HOW INDEX WORKS (DIAGRAM)
 **********************
 Collection (unsorted):
 [ 100, 20, 900, 50 ]

 Index (sorted):
 [ 20, 50, 100, 900 ]

 Search uses fast B-Tree lookup.
*/


/**********************
 *   ADVANTAGES
 **********************
 ✔ Fast reads
 ✔ Fast search & sort
 ✔ Improves query performance
*/

/**********************
 *   DISADVANTAGES
 **********************
 ✖ Extra storage required
 ✖ Slower writes (insert/update/delete)
 ✖ Too many indexes → slower performance
*/

/**********************
 *   BEST PRACTICES
 **********************
 - Create indexes on fields used in queries
 - Do NOT create unnecessary indexes
 - Use compound index when query uses multiple fields
 - Use explain() to check index usage:
*/
db.students.find({ age: 22 }).explain();

/*********************************************************
 * END OF FILE
 *********************************************************/