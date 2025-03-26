document.addEventListener("turbo:load", function() {
const regUsernameInput = document.getElementById("registration-username");
const regEmailInput = document.getElementById("registration-email");
const regPasswordInput = document.getElementById("registration-password");
const regPasswordInput2 = document.getElementById("registration-password-again")
const regB = document.getElementById("register-button");
const regError = document.getElementById("registration-error");

let validUsername;

regUsernameInput.addEventListener("input", function(event) {
    var username = event.target.value;
    if (username) validUsername = usernameCheck(username)
});

function usernameCheck(username) {
    return /^[a-zA-Z0-9._]+$/.test(username);
}

const realEmailDomains = [
    "gmail.com", "yahoo.com", "outlook.com", "hotmail.com", "aol.com",
    "icloud.com", "protonmail.com", "zoho.com", "gmx.com", "yandex.com",
    "mail.com", "live.com", "msn.com", "att.net", "comcast.net",
    "me.com", "mac.com", "fastmail.com"
];

function emailCheck(email) {
    const emailDomain = email.split("@")[1];
    return realEmailDomains.includes(emailDomain);
}

regB.onclick = (event) => {
    var email = regEmailInput.value;
    var password = regPasswordInput.value;
    var passwordC = regPasswordInput2.value;
    if (regUsernameInput.value && email && password && passwordC) {
        if (!validUsername) {
            event.preventDefault();
            regError.innerText = "Username has prohibited characters.";
            setTimeout(() => {
                regError.innerText = "";
            }, 4000 );
        }
        let validEmail = emailCheck(email);
        if (!validEmail) {
            event.preventDefault();
            regError.innerText = "That's a fake email.";
            setTimeout(() => {
                regError.innerText = "";
            }, 3200 );
        }
        let passwordsMatch = password === passwordC;
        if (!passwordsMatch) {
            event.preventDefault();
            regError.innerText = "Passwords do not match";
            setTimeout(() => {
                regError.innerText = "";
            }, 3200 );
        }
    } else {
        event.preventDefault();
        regError.innerText = "Aren't you forgetting something?";
        setTimeout(() => {
            regError.innerText = "";
        }, 4000 );
    }
}
});