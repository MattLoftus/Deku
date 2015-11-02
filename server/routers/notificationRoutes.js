var notificationController = require('../controllers/notificationController.js');

module.exports = function (app) {
  app.get('/:userID', notificationController.getNotifications);

  app.post('/:username', notificationController.addNotification);

  app.delete('/:userID', notificationController.deleteNotifications);
}