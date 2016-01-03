angular.module('candidatesCtrl', [])

// inject the Comment service into our controller
        .controller('candidatesController', function ($scope, $http, Candidates) {

            // object to hold all the data for the new comment form
            $scope.candidateData = {};

            // loading variable to show the spinning loading icon
            $scope.loading = true;

            // get all the comments first and bind it to the $scope.comments object
            // use the function we created in our service
            // GET ALL COMMENTS ==============
            Candidates.get()
                    .success(function (data) {
                        $scope.candidates = data;
                        $scope.loading = false;
                    });

            // function to handle submitting the form
            // SAVE A COMMENT ================
            $scope.submitCandidates = function () {
                $scope.loading = true;

                // save the comment. pass in comment data from the form
                // use the function we created in our service
                Candidates.save($scope.candidateData)
                        .success(function (data) {
                            // if successful, we'll need to refresh the comment list
                            $scope.candidateData = {};
                            Candidates.get()
                                    .success(function (getData) {
                                        $scope.candidates = getData;
                                        $scope.loading = false;
                                    });

                        })
                        .error(function (data) {
                            console.log(data)
                        });
            };

            // function to handle deleting a comment
            // DELETE A COMMENT ====================================================
            $scope.deleteCandidate = function (id) {
                $scope.loading = true;

                // use the function we created in our service
                Candidates.destroy(id)
                        .success(function (data) {

                            // if successful, we'll need to refresh the comment list
                            Candidates.get()
                                    .success(function (getData) {
                                        $scope.candidates = getData;
                                        $scope.loading = false;
                                    });

                        })
                        .error(function (data) {
                            console.log(data);
                        });
            };

        });