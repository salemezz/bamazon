var mysql = require("mysql");
var inquirer = require("inquirer");

var connection = mysql.createConnection({
  host: "127.0.0.1",
  port: 3306,
  user: "root",
  password: "bootcamp05",
  database: "bamazon_db"
});

connection.connect(function (err) {
  if (err) throw err;
  console.log("connected as id " + connection.threadId + "\n");
  itemSelection();
});

function itemSelection() {
  connection.query("SELECT * FROM bamazon_db.products",
    function (err, res) {
      if (err) throw err;
      for (var i = 0; i < res.length; i++) {
        console.log(
          "\x1b[41mID: " +
          res[i].item_id +
          " || Item: " +
          res[i].product_name +
          " || Price: " +
          res[i].price +
          " || Stock: " +
          res[i].stock_quantity + "\x1b[0m"
        );
      }
      console.log("\n=====================================================================");
      inquirer
        .prompt([
          {
            type: "input",
            message: "Select product via ID",
            name: "id_selection"
          },
          {
            type: "input",
            message: "Enter Desired Quantity",
            name: "quantity_selection"
          }
        ])
        .then(function (input) {
          if (res[input.id_selection - 1].stock_quantity === 0) {
            console.log("\n\x1b[5mOut of Stock\x1b[0m\n");
          } else if (res[input.id_selection - 1].stock_quantity < input.quantity_selection) {
            console.log("\n\x1b[5mOnly " + res[input.id_selection - 1].stock_quantity + " in Stock\x1b[0m\n");
          } else {
            console.log("\n\x1b[5mIn Stock\x1b[0m\n");
            updateProduct(input, res);
          }
        });
    });
}
function updateProduct(input, res) {
  console.log("Updating all " + res[input.id_selection - 1].product_name + " quantities...\n");
  var query = connection.query(
    "UPDATE products SET ? WHERE ?",
    [
      {
        stock_quantity: res[input.id_selection - 1].stock_quantity - input.quantity_selection
      },
      {
       item_id: input.id_selection
      }
    ],
    function (err, res) {
      console.log(res.affectedRows + " products updated!\n");
      connection.end();
    }
  );
  console.log(query.sql);
}
