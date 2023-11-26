
$(document).ready(function () {
    function get_poll() {
        var poll_id = $("#poll_id").val() | 1;

        // AJAX request to vote.php
        $.get("get_polls.php", {
            poll_id
        }, function (data) {
            if (data.success) {
                const poll = data.poll;
                $('#question').html(poll.question);
                $('#poll_id').val( poll.id);

                poll.options.forEach(o => {
                    var option = new Option(o.text, o.id);
                    $("#options").append(option);
                });

            } else {
                alert("Vote failed. " + data.message);
            }
        }, "json");
    }

    $("#votingForm").submit(function (event) {
        event.preventDefault();
        var poll_id = $("#poll_id") | 1;
        var option_id = $('#options').val();
        if(!option_id)
        {
            alert('Please select option');
            return;
        }
        // AJAX request to vote.php
        $.post("vote.php", {
            poll_id,
            option_id
        }, function (data) {
            if (data.success) {
                window.location.href =  window.location.origin + '/complete.html';
            } else {
                alert("Vote failed. " + data.message);
            }
        }, "json");
    });

    get_poll();
});