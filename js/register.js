$(document).ready(function () {
    $("#registrationForm").submit(function (event) {
        event.preventDefault();
        var first_name = $("#first_name").val();
        var last_name = $("#last_name").val();
        var username = $("#username").val();
        var password = $("#password").val();

        // if (!validateEmail(username)) {
        //     alert('Email is invalid!');
        //     return;
        // }

        // AJAX request to register.php
        $.post("register.php", {
            first_name,
            last_name,
            username,
            password
        }, function (data) {
            if (data.success) {
                window.location.href = window.location.origin

            } else {
                alert("Registration failed. " + data.message);
            }
        }, "json");
    });

    function validateEmail(email) {
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return emailRegex.test(email);
    }
});