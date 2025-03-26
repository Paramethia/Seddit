document.addEventListener("turbo:load", function() {
const loginUsernameInput = document.getElementById("login-username");
const loginPasswordInput = document.getElementById("login-password");
const loginB = document.getElementById("login-button");
const loginError = document.getElementById("login-error");

let validUsername;

loginUsernameInput.addEventListener("input", function(event) {
    var username = event.target.value;
    if (username) validUsername = usernameCheck(username)
});

function usernameCheck(username) {
    return /^[a-zA-Z0-9._]+$/.test(username);
}

loginB.onclick = (event) => {
    if (loginUsernameInput.value && loginPasswordInput.value) {
        if (!validUsername) {
            event.preventDefault();
            loginError.innerText = "Username has prohibited characters.";
            setTimeout(() => {
                loginError.innerText = "";
            }, 4000 );
        }
    } else {
        event.preventDefault();
        loginError.innerText = "Aren't you forgetting something?";
        setTimeout(() => {
            loginError.innerText = "";
        }, 4000 );
    }
}
});
