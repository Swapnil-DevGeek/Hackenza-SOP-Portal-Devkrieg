// models/Project.js
const { DataTypes } = require('sequelize');
const sequelize = require('server/sequelize.js');
const User = require('server/models/user.js');

const Project = sequelize.define('Project', {
  id: {
    type: DataTypes.UUID,
    primaryKey: true,
    defaultValue: DataTypes.UUIDV4,
  },
  title: DataTypes.STRING,
  description: DataTypes.STRING,
  researchArea: DataTypes.STRING,
  startDate: DataTypes.DATE,
  endDate: DataTypes.DATE,
});

Project.belongsTo(User, { as: 'faculty', foreignKey: 'facultyId' });

module.exports = Project;
