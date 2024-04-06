// models/User.js
const { DataTypes } = require('sequelize');
const sequelize = require('server/sequelize.js');

const User = sequelize.define('User', {
  id: {
    type: DataTypes.UUID,
    primaryKey: true,
    defaultValue: DataTypes.UUIDV4,
  },
  email: {
    type: DataTypes.STRING,
    unique: true,
  },
  name: DataTypes.STRING,
  role: DataTypes.ENUM('STUDENT', 'FACULTY', 'ADMIN'),
});

module.exports = User;
