// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener("turbo:load", function() {
let screenWidth = screen.width;
console.log("Screen width:", screenWidth);
let windowWidth = window.innerWidth;
console.log("Window width:", windowWidth);

const sedditLogo = document.getElementById("Seddit-logo");
const sideBar = document.querySelector(".Side-bar");

let sideBarOpen = false;

if (screenWidth <= 780 || windowWidth <= 780) {
    sedditLogo.onclick = () => {
        switch(sideBarOpen) {
            case false:
                sideBar.style.display = "inline-block";
                sideBarOpen = true;
                console.log("opened")
            break;
            case true:
                sideBar.style.display = "none";
                sideBarOpen = false;

        }
        
    }

    if (sideBar.style.display = "none") {
        document.addEventListener("click", (event) => {
            if (!sideBar.contains(event.target) && event.target !== sedditLogo) {
                sideBar.style.display = "none";
                sideBarOpen = false;
            }
        })
    }
}

const createSedSpan = document.getElementById("nav-span");
const createSedtt = document.getElementById("create-sed-tt");
let ttTimeout;

if (createSedSpan) {
    createSedSpan.onmouseover = () => { ttTimeout = setTimeout(() => { createSedtt.style.display = 'inline' }, 500)  }
    createSedSpan.onmouseout = () => { 
        clearTimeout(ttTimeout); 
        createSedtt.style.display = 'none';
    }
}

const notification = document.getElementById("notice");

if (notification.innerText !== "") { 
    notification.style.display = "inline-block";
    setTimeout(() => { notification.style.display = "none" }, 3400 );
}
/*
const observer = new MutationObserver((mutationsList) => {
    for (const mutation of mutationsList) {
        if (mutation.type === "characterData" || mutation.type === "childList") {
            notification.style.visibility = "show";
            setTimeout(() => { notification.style.visibility = "hide" }, 2200 );
        }
    }
});

// Observe changes in text content
observer.observe(notification, { subtree: true, characterData: true, childList: true });
*/

const options = document.getElementById("options");
const optionsCon = document.querySelector(".Options");
const vPtt = document.getElementById("view-profile-tt")
const userIcon = document.getElementById("user-icon");
const userSpan = document.getElementById("user");
let showing = false;


options.onclick = () => {
    switch(showing) {
    case false:
        options.style.color = "#964c03";
        optionsCon.style.display = "block";
        showing = true;
    break;
    case true:
        options.style.color = "lightgrey";
        optionsCon.style.display = "none";
        showing = false;
    break;
    }
}

document.addEventListener("click", (event) => {
    if (!optionsCon.contains(event.target) && event.target !== options) { 
        optionsCon.style.display = "none";
        showing = false;
        options.style.color = "lightgrey";
    }
})

userSpan.onmouseover = () => {
    userIcon.classList.remove("fa-regular");
    userIcon.classList.add("fa-solid");
    //vPtt.style.display = "inline";
}
userSpan.onmouseleave = () => {
    userIcon.classList.remove("fa-solid");
    userIcon.classList.add("fa-regular");
    //svPtt.style.display = "none";
}
});