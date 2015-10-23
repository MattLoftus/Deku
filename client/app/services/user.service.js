(function() {
  'use strict';

  angular.module('app')
    .factory('User', User);

  User.$inject = ['$http', '$window', '$state'];

  function User($http, $window, $state) {

    var services = {
      signin: signin,
      signout: signout,
      signup: signup,
      getFollowers: getFollowers,
      getPhoto: getPhoto,
      getProfile: getProfile,
      getStatuses: getStatuses,
      updateProfile: updateProfile
    };

    return services;

    function signin(data) {
      return $http.post('/auth/signin', data)
        .then(function successCallback(res) {
          return res.data;
        }, function errorCallback(res) {
          throw res.status;
        });
    }

    function signout() {
      delete $window.localStorage.token;
      delete $window.localStorage.username;
      $state.transitionTo('signin');
    }

    function signup(data) {
      return $http.post('/auth/signup', data)
        .then(function successCallback(res) {
          return res.data;
        }, function errorCallback(res) {
          throw res.status;
        });
    }

    // retrieve followers AND following lists 
    function getFollowers(username) {
      return $http.get('/follower/' + username)
        .then(function successCallback(res) {
          return res.data;
        }, function errorCallback(res) {
          console.log('Error retrieving followers');
        });
    }

    // retrieve a user's profile photo
    function getPhoto(username) {
      // TODO: request URL
      return $http.get()
        .then(function successCallback(res) {
          // TODO
        }, function errorCallback(res) {
          console.log('Error retrieving profile photo');
        });
    }

    // retrieve user profile information
    function getProfile(username) {
      return $http.get('/users/' + username)
        .then(function successCallback(res) {
          return res.data;
        }, function errorCallback(res) {
          console.log('Error retrieving user profile');
        });
    }

    // retrieve user statuses
    function getStatuses(username) {
      return $http.get('/status/' + username)
        .then(function successCallback(res) {
          return res.data.statuses;
        }, function errorCallback(res) {
          console.log('Error retrieving statuses');
        });
    }

    // update an existing users profile info
    function updateProfile(data) {
      var url = '/users/' + $window.localStorage.username;

      return $http.put(url, data)
        .then(function successCallback(res) {
          return res.data;
        }, function errorCallback(res) {
          console.log('Error updating user profile');
        });
    }
  }
})();
