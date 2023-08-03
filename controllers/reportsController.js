const path = require('path');
const mysql = require('mysql2');

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'supermarket',
});
function renderReportsPage(req, res) {
 res.render('reports')
}


const monthNames = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];

function graphdata(req, res) {
  const productName = req.params.product_name;

  const query = `SELECT sales, orderDate FROM salesdata WHERE subcategory = '${productName}'`;

  connection.query(query, (error, results) => {
    if (error) {
      console.error('Error executing MySQL query:', error);
      return res.status(500).json({ error: 'An error occurred' });
    }

    const graphData = results.map((row) => ({
      sales: row.sales,
      orderDate: new Date(row.orderDate).toISOString().split('T')[0],
    }));

    res.json(graphData);
  });
}



function getSalesData(req, res) {
  const query = `
    SELECT product.product_name, SUM(salesorder.quantity) AS total_quantity
    FROM salesorder
    JOIN product ON salesorder.product_id = product.product_id
    GROUP BY product.product_name`;

  connection.query(query, (error, results) => {
    if (error) {
      console.error('Error executing MySQL query:', error);
      return res.status(500).json({ error: 'An error occurred' });
    }

    const salesData = results.map(row => ({
      product_name: row.product_name,
      total_quantity: row.total_quantity
    }));

    res.json(salesData);
  });
}
module.exports = {
  renderReportsPage,
  graphdata,getSalesData
};
