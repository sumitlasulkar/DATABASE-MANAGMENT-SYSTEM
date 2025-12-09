/* 
=========================================
        MONGODB CRUD OPERATIONS
=========================================
*/

// ---------------------------
// 1. CREATE (INSERT)
// ---------------------------

// Insert one document
db.students.insertOne({
    name: "Sumit",
    age: 19,
    branch: "Computer Engineering"
});

// Insert many documents
db.students.insertMany([
    { name: "Rahul", age: 20, branch: "IT" },
    { name: "Amit", age: 21, branch: "CS" },
    { name: "Sneha", age: 22, branch: "ENTC" }
]);


// ---------------------------
// 2. READ (FIND)
// ---------------------------

// Find all documents
db.students.find();

// Find with condition
db.students.find({ age: 20 });

// Find one document
db.students.findOne({ name: "Sumit" });

// Projection (show selected fields)
db.students.find(
    { age: 20 },
    { name: 1, branch: 1, _id: 0 }
);

// Find using operators
db.students.find({ age: { $gt: 18 } });   // greater than
db.students.find({ age: { $lt: 25 } });   // less than
db.students.find({ age: { $in: [19, 21] } });


// ---------------------------
// 3. UPDATE
// ---------------------------

// Update one document
db.students.updateOne(
    { name: "Sumit" },
    { $set: { age: 20 } }
);

// Update many documents
db.students.updateMany(
    { branch: "CS" },
    { $set: { branch: "Computer Science" } }
);

// Increment field
db.students.updateOne(
    { name: "Rahul" },
    { $inc: { age: 1 } }
);

// Rename field
db.students.updateMany(
    {},
    { $rename: { branch: "department" } }
);

// Remove a field
db.students.updateOne(
    { name: "Amit" },
    { $unset: { department: "" } }
);


// ---------------------------
// 4. DELETE
// ---------------------------

// Delete one document
db.students.deleteOne({ name: "Sumit" });

// Delete many documents
db.students.deleteMany({ age: { $lt: 20 } });


// ---------------------------
// 5. REPLACE DOCUMENT
// ---------------------------

db.students.replaceOne(
    { name: "Rahul" },
    { name: "Rahul", age: 23, department: "AI" }
);


// ---------------------------
// 6. DROP COLLECTION & DATABASE
// ---------------------------

// Drop entire collection
db.students.drop();

// Drop entire database
db.dropDatabase();

/* 
=========================================
       END OF MONGODB CRUD FILE
=========================================
*/