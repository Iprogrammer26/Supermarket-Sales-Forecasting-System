const path = require("path");
const db = require("../routes/db_config");
const fs = require('fs');
const csv = require('csv-parser');

function renderaddPage(req, res) {
  if (req.session.user && req.session.user.user_type === "Cashier") {
    res.render("add", { flash: req.flash() });
  } else {
    req.flash("error", "You are not authorized to access this page.");
    res.redirect("/");
  }
}

const createSalesOrder = (req, res) => {
  const {
    product_name,
    Date,
    Quantity,
    Temperature,
    AdvertisingCost,
    CompetitorCount,
    Promotion,
  } = req.body;

  // Create a connection to the database
  const connection = db.createConnection();

  // Start a transaction
  connection.beginTransaction((err) => {
    if (err) {
      console.error("Error starting transaction:", err);
      req.flash("error", "An error occurred while creating the sales order");
      res.redirect("/add");
      return;
    }

    // Fetch the product_id and price based on the product_name
    const getProductQuery =
      "SELECT product_id, price, available_quantity FROM product WHERE product_name = ?";

    connection.query(getProductQuery, [product_name], (err, results) => {
      if (err) {
        console.error("Error fetching product:", err);
        req.flash("error", "An error occurred while fetching the product");
        res.redirect("/add");
        connection.rollback(); // Rollback the transaction
        connection.end(); // Close the database connection
        return;
      }

      if (results.length === 0) {
        // If no product found, return an error
        req.flash("error", "Product not found");
        res.redirect("/add");
        connection.rollback(); // Rollback the transaction
        connection.end(); // Close the database connection
        return;
      }

      const product_id = results[0].product_id;
      const price = results[0].price;
      const available_quantity = results[0].available_quantity;
      const total = parseFloat(Quantity) * parseFloat(price);

      if (Quantity > available_quantity) {
        // If the requested quantity is greater than available quantity, return an error
        req.flash("error", "Insufficient quantity available");
        res.redirect("/add");
        connection.rollback(); // Rollback the transaction
        connection.end(); // Close the database connection
        return;
      }

      // Create the INSERT query for salesorder
const insertQuery =
"INSERT INTO salesorder (product_id, Date, Quantity, Temperature, AdvertisingCost, CompetitorCount, Promotion, Total) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

// Create the UPDATE query for product
const updateQuery =
"UPDATE product SET available_quantity = available_quantity - ? WHERE product_id = ? AND available_quantity >= ?";

// Execute the UPDATE query to deduct the quantity from available_quantity
connection.query(
updateQuery,
[Quantity, product_id, Quantity],
(err, updateResults) => {
  if (err) {
    console.error("Error updating product quantity:", err);
    req.flash(
      "error",
      "An error occurred while updating the product quantity"
    );
    res.redirect("/add");
    connection.rollback(); // Rollback the transaction
    connection.end(); // Close the database connection
    return;
  }

  if (updateResults.affectedRows === 0) {
    // If the update did not modify any rows, the available_quantity was less than the requested quantity
    req.flash("error", "Insufficient quantity available");
    res.redirect("/add");
    connection.rollback(); // Rollback the transaction
    connection.end(); // Close the database connection
    return;
  }

  // Execute the INSERT query for salesorder
  connection.query(
    insertQuery,
    [
      product_id,
      Date,
      Quantity,
      Temperature,
      AdvertisingCost,
      CompetitorCount,
      Promotion,
      total,
    ],
    (err, insertResults) => {
      if (err) {
        console.error("Error inserting sales order:", err);
        req.flash(
          "error",
          "An error occurred while creating the sales order"
        );
        res.redirect("/add");
        connection.rollback(); // Rollback the transaction
        connection.end(); // Close the database connection
        return;
      }

      // Commit the transaction
      connection.commit((err) => {
        if (err) {
          console.error("Error committing transaction:", err);
          req.flash(
            "error",
            "An error occurred while creating the sales order"
          );
          res.redirect("/add");
        } else {
          console.log("Data inserted and updated successfully");
          req.flash("success", "Sales order created successfully");
          res.redirect("/add");
        }
        connection.end(); // Close the database connection
      });
    }
  );
}
);

    });
  });
};


const addStock = (req, res, next) => {
  const { product_name, price, available_quantity } = req.body;

  // Create a connection to the database
  const connection = db.createConnection();

  // Check if the product already exists
  const checkProductQuery = "SELECT * FROM product WHERE product_name = ?";
  connection.query(checkProductQuery, [product_name], (err, results) => {
    if (err) {
      console.error("Error checking product:", err);
      req.flash("error", "An error occurred while checking the product");
      res.redirect("/add");
    } else {
      if (results.length > 0) {
        // Product already exists, perform an update
        const updateQuery =
          "UPDATE product SET available_quantity = available_quantity + ? WHERE product_name = ?";
        connection.query(updateQuery, [available_quantity, product_name], (err, updateResults) => {
          if (err) {
            console.error("Error updating product:", err);
            req.flash("error", "An error occurred while updating the product");
            res.redirect("/add");
          } else {
            console.log("Product updated successfully");
            req.flash("success", "Product updated successfully");
            res.redirect("/add");
          }
        });
      } else {
        // Product does not exist, perform an insert
        const insertQuery =
          "INSERT INTO product (product_name, price, available_quantity) VALUES (?, ?, ?)";
        connection.query(insertQuery, [product_name, price, available_quantity], (err, insertResults) => {
          if (err) {
            console.error("Error inserting product:", err);
            req.flash("error", "An error occurred while inserting the product");
            res.redirect("/add");
          } else {
            console.log("Product inserted successfully");
            req.flash("success", "Product inserted successfully");
            res.redirect("/add");
          }
        });
      }
    }

    // Close the database connection
    connection.end();
  });
};

function uploaded(req, res) {
  // Access the uploaded file
  const file = req.file;
  console.log(req.file);

  // Create a connection to the database
  const connection = db.createConnection();

  // Process the CSV file
  const filePath = path.join(__dirname, '..', 'uploads', file.filename); // Construct the file path
  fs.createReadStream(filePath)
    .pipe(csv())
    .on('data', (data) => {
      // Convert the date format to 'YYYY-MM-DD'
      const dateParts = data.OrderDate.split('/');
      const formattedDate = `${dateParts[2]}-${dateParts[1]}-${dateParts[0]}`;

      // Prepare the data to insert into the database with the updated column headers
      const newData = {
        OrderDate: formattedDate,
        Category: data.Category,
        SubCategory: data.SubCategory,
        Sales: data.Sales,
        Discount: data.Discount,
        Profit: data.Profit
      };

      // Insert data into the database
      const sql = 'INSERT INTO salesorder (OrderDate, Category, SubCategory, Sales, Discount, Profit) VALUES (?, ?, ?, ?, ?, ?)';
      const values = [newData.OrderDate, newData.Category, newData.SubCategory, newData.Sales, newData.Discount, newData.Profit];

      // Execute the database query to insert the data
      connection.query(sql, values, (error, results) => {
        if (error) {
          console.error('Error inserting data into the database:', error);
          // Handle the error here, for example, you can send an error response to the client
          res.status(500).json({ error: 'Error inserting data into the database' });
        }
      });
    })
    .on('end', () => {
      console.log('CSV file successfully processed');
      req.flash('success', 'CSV file successfully processed');
      res.redirect('/add'); // Redirect to a success page or desired route

      // Close the database connection
      connection.end();
    })
    .on('error', (error) => {
      console.error('Error processing CSV file:', error);
      // Handle the error here, for example, you can send an error response to the client
      res.status(500).json({ error: 'Error processing CSV file' });

      // Close the database connection
      connection.end();
    });
}

module.exports = {
  renderaddPage,
  createSalesOrder,
  addStock,
  uploaded
};
