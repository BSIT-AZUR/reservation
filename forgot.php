<style>
    #uni_modal .modal-content>.modal-footer,
    #uni_modal .modal-content>.modal-header {
        display: none;
    }
</style>
<div class="container-fluid">
    <h3 class="float-left">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </h3>
    <div class="row">
        <div class="col-lg-5 border-right">
            <h3 class="text-center">Login</h3>
            <hr>
            <form action="" id="login-form">
                <div class="form-group">
                    <label for="" class="control-label">Username</label>
                    <input type="text" class="form-control form" name="username" required>
                </div>
                <div class="form-group">
                    <label for="" class="control-label">Password</label>
                    <input type="password" class="form-control form" name="password" required>
                </div>

                <a style="font-family: Poppin; padding: 10px;" href="forgot.php">Forgot Password</a>

                <label class="checkbox" for="myCheckboxId">
                    <input checked class="checkbox-input" type="checkbox" name="myCheckboxName" id="myCheckboxId">
                    <div class="checkbox-box"></div>
                    I agree with <a style="font-family: Poppin; padding: 10px;" href="policy.php">Terms and Conditions</a>
                </label>

                <div class="form-group d-flex justify-content-end">
                    <button class="btn btn-primary btn-flat">Login</button>
                </div>
            </form>
        </div>
        <div class="col-lg-7">
            <h3 class="text-center">Create New Account</h3>
            <hr class='border-primary'>
            <form action="" id="registration">
                <div class="form-group">
                    <label for="" class="control-label">Firstname</label>
                    <input type="text" class="form-control form-control-sm form" name="firstname" required>
                </div>
                <div class="form-group">
                    <label for="" class="control-label">Lastname</label>
                    <input type="text" class="form-control form-control-sm form" name="lastname" required>
                </div>
                <div class="form-group">
                    <label for="" class="control-label">Email</label>
                    <input type="email" class="form-control form-control-sm form" name="email" required>
                </div>
                <div class="form-group">
                    <label for="" class="control-label">Contact</label>
                    <input type="number" maxlength="11" class="form-control form-control-sm form" name="contact" required>
                </div>
                <div class="form-group">
                    <label for="" class="control-label">Username</label>
                    <input type="text" class="form-control form-control-sm form" name="username" required>
                </div>
                <div class="form-group">
                    <label for="" class="control-label">Password</label>
                    <input type="password" class="form-control form-control-sm form" name="password" required>
                </div>
                <div class="form-group d-flex justify-content-end">
                    <button class="btn btn-primary btn-flat">Register</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>

    document.querySelectorAll('input[type="number"]').forEach(input =>{
        input.oninput = () => {
            if(input.value.length > input.maxLength) input.value = input.value.slice(0, input.maxLength)
        }
    });
    
    $(function() {
        $('#registration').submit(function(e) {
            e.preventDefault();
            start_loader()
            if ($('.err-msg').length > 0)
                $('.err-msg').remove();
            $.ajax({
                url: _base_url_ + "classes/Master.php?f=register",
                method: "POST",
                data: $(this).serialize(),
                dataType: "json",
                error: err => {
                    console.log(err)
                    alert_toast("an error occured", 'error')
                    end_loader()
                },
                success: function(resp) {
                    if (typeof resp == 'object' && resp.status == 'success') {
                        alert_toast("Account succesfully registered", 'success')
                        setTimeout(function() {
                            location.reload()
                        }, 2000)
                    } else if (resp.status == 'failed' && !!resp.msg) {
                        var _err_el = $('<div>')
                        _err_el.addClass("alert alert-danger err-msg").text(resp.msg)
                        $('#registration').prepend(_err_el)
                        end_loader()

                    } else {
                        console.log(resp)
                        alert_toast("an error occured", 'error')
                        end_loader()
                    }
                }
            })
        })
        $('#login-form').submit(function(e) {
            e.preventDefault();
            start_loader()
            if ($('.err-msg').length > 0)
                $('.err-msg').remove();
            $.ajax({
                url: _base_url_ + "classes/forgot.php?f=forget",
                method: "POST",
                data: $(this).serialize(),
                dataType: "json",
                error: err => {
                    console.log(err)
                    alert_toast("an error occured", 'error')
                    end_loader()
                },
                success: function(resp) {
                    if (typeof resp == 'object' && resp.status == 'success') {
                        alert_toast("Login Successfully", 'success')
                        setTimeout(function() {
                            location.reload()
                        }, 2000)
                    } else if (resp.status == 'incorrect') {
                        var _err_el = $('<div>')
                        _err_el.addClass("alert alert-danger err-msg").text("Incorrect Credentials.")
                        $('#login-form').prepend(_err_el)
                        end_loader()

                    } else {
                        console.log(resp)
                        alert_toast("an error occured", 'error')
                        end_loader()
                    }
                }
            })
        })
    })
</script>