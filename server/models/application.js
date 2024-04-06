// models/Application.js
const { DataTypes } = require('sequelize');
const sequelize = require('server/sequelize.js');
const User = require('server/models/user.js');
const Project = require('server/models/project.js');

const Application = sequelize.define('Application', {
  id: {
    type: DataTypes.UUID,
    primaryKey: true,
    defaultValue: DataTypes.UUIDV4,
  },
  status: DataTypes.STRING,
  submissionDate: DataTypes.DATE,
  comments: DataTypes.STRING,
});

Application.belongsTo(User, { as: 'student', foreignKey: 'studentId' });
Application.belongsTo(Project, { as: 'project', foreignKey: 'projectId' });

module.exports = Application;
