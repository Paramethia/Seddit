document.addEventListener("turbo:load", function() {
const subChoose = document.getElementById("sub-name-input");
const subsShow = document.getElementById("sub-selection");
const subList = document.querySelector(".subseddits-list");
const subTitle = document.querySelectorAll("#sub-name");
let open = false;

if (subChoose) {
    console.log("loaded")
    subsShow.onclick = () => {
        switch(open) {
            case false:
                subList.style.display = "block";
                subsShow.innerText = subsShow.innerText.replace("▽", "△");
                open = true;
            break;
            case true:
                subList.style.display = "none";
                subsShow.innerText = subsShow.innerText.replace("△", "▽");
                open = false;
            break;
        }
    }

    subTitle.forEach((element, index) => {
        element.onclick = () => {
            subChoose.value = subTitle[index].innerText;
            subList.style.display = "none";
            subsShow.innerText = subsShow.innerText.replace("△", "▽");
        }
    })
}

const fileUploadInput = document.querySelector('input[type="file"]');

if (fileUploadInput) {
    fileUploadInput.addEventListener("change", function() {
        let image = this.files[0];
        if (image && !image.type.startsWith("image/")) {
        alert("Only image files are allowed!");
        this.value = ""; // Clear the input
        } else {
        var reader = new FileReader();
            reader.onload = function(e) {
                var preview = document.getElementById("preview");
                preview.src = e.target.result;
                preview.style.display = "block"; // Show the preview
            };
            reader.readAsDataURL(image); // Convert file to Data URL
        }
    });
}

const sedTitle = document.getElementById("sed-title");
const sedContent = document.getElementById("sed-content");
const sedError = document.getElementById("sedding-error");
const sedButton = document.getElementById("Sed-b");

if (sedButton) {
    sedButton.onclick = (event) => {
        if (!sedTitle.value, !sedContent.value, !subChoose.value) {
            event.preventDefault();
            sedError.innerText = "The title or content of your sed it empty. Also make sure you chose a subseddit to post to."
            setTimeout(() => { sedError.innerText = "" }, 4200 );
        }
    }
}

function copyToClipboard(element) {
    const url = element.getAttribute("data-url");
  
    navigator.clipboard.writeText(url).then(() => {
      alert("Post link copied to clipboard!");
    }).catch(err => {
      console.error("Failed to copy: ", err);
    });
}

const optionsSpan = document.getElementById("sed-options");
const sedOptionsCon = document.querySelector(".options")

// Toggle menu visibility when clicking the button
if (optionsSpan) {
    optionsSpan.onclick = (event) => {
        event.stopPropagation(); // Prevent immediate closing
        sedOptionsCon.style.display = sedOptionsCon.style.display === "block" ? "none" : "block";
    };

    document.addEventListener("click", (event) => {
        if (!sedOptionsCon.contains(event.target) && event.target !== optionsSpan) {
            sedOptionsCon.style.display = "none";
        }
    })
}

});