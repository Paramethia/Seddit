document.addEventListener("turbo:load", function() {
const subTitle = document.getElementById("subseddit-name");
const subDesc = document.getElementById("subseddit-description");
const subError = document.getElementById("subseddit-creation-error");
const subCreateB = document.getElementById("Sub-create-button");

if (subCreateB) {
    subCreateB.onclick = (event) => {
        if (!subTitle.value, !subDesc.value) {
            event.preventDefault();
            subError.innerText = "A title and description is required."
            setTimeout(() => { subError.innerText = ""}, 3700 );
        }
    }
}
});