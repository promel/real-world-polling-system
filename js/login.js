$(document).ready(function () {
    $("#loginForm").submit(function (event) {
        event.preventDefault();
        var username = $("#username").val();
        var password = $("#password").val();

        // AJAX request to login.php
        $.post("login.php", {
            username: username,
            password: password
        }, function (data) {
            if (data.success) {
                window.location.href =  window.location.origin + '/voting.html';
            } else {
                alert("Login failed. " + data.message);
            }
        }, "json");
    });
});