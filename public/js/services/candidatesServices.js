angular.module('candidatesServices', [])

.factory('Candidates', function($http) {

    return {
        // get all the comments
        get : function() {
            return $http.get('/api/candidates');
        },

        // save a comment (pass in comment data)
        save : function(candidateData) {
            return $http({
                method: 'POST',
                url: '/api/candidates',
                headers: { 'Content-Type' : 'application/x-www-form-urlencoded' },
                data: $.param(candidateData)
            });
        },

        // destroy a comment
        destroy : function(id) {
            return $http.delete('/api/candidates/' + id);
        }
    }
});

