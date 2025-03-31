document.addEventListener("turbo:load", function() {
    const subName = document.getElementById("subseddit-name");
    const subDesc = document.getElementById("subseddit-description");
    const subError = document.getElementById("subseddit-creation-error");
    const subCreateB = document.getElementById("Sub-create-button");
    
    function subNameCheck(subName) {
      return /^[a-zA-Z0-9._]+$/.test(subName);
    }
    
    if (subCreateB) {
        subName.addEventListener("input", function() {
            subName.value = subName.value.replace(/\s+/g, ""); // Removes all spaces
        });
    
        subCreateB.onclick = (event) => {
            if (subName.value, subDesc.value) {
                let validSubName = subNameCheck(subName.value)
                if (!validSubName) {
                    event.preventDefault();
                    subError.innerText = "Subseddit name has prohibited characters.";
                    setTimeout(() => {
                    subError.innerText = "";
                    }, 4000 );
                }
            } else {
                event.preventDefault();
                subError.innerText = "A name and description is required."
                setTimeout(() => { subError.innerText = ""}, 3700 );
            }
        }
    }
    
    const subShareB = document.getElementById("sub-share");
    
    if (subShareB) {
        subShareB.onclick = function () {
            const url = subShareB.getAttribute("data-url");
        
            navigator.clipboard.writeText(url).then(() => {
                console.log("Subseddit link copied to clipboard");
            }).catch(err => {
                console.error("Failed to copy: ", err);
            });
        }
    }
    
    const ownerOptionsS = document.getElementById("owner-options");
    const ownerOptionsCon = document.querySelector(".owner-options");
    let ownerOptionsOpen = false;
    
    if (ownerOptionsCon) {
        ownerOptionsS.onclick = () => {
            switch(ownerOptionsOpen) {
                case false:
                    ownerOptionsCon.style.display = "block";
                    ownerOptionsOpen = true;
                break;
                case true:
                    ownerOptionsCon.style.display = "none";
                    ownerOptionsOpen = false;
                break;
            }
        }
    }
});