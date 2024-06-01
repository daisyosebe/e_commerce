const express = require('express');
const routes = require('./routes');
const sequelize = require('./config/connection'); // Import sequelize connection

const app = express();
const PORT = process.env.PORT || 3001;

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

const { Category, Product, Tag, ProductTag } = require('./models');
sequelize.sync({ force: false }).then(() => {
  console.log('Sequelize models synced to the database');
});

app.use(routes);

// sync sequelize models to the database, then turn on the server
app.listen(PORT, () => {
  console.log(`App listening on port ${PORT}!`);
});
