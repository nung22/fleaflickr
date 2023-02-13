// Add active
function addActive(element){
    element.classList.add("active","text-dark");
}

// Remove active
function removeActive(element){
    element.classList.remove("active","text-dark");
}

// Add pill
function addPill(element){
	
    element.classList.add("hover","text-dark");
}

// Remove pill
function removePill(element){
    element.classList.remove("hover","text-dark");
}

// Add shadow
function addShadow(element){
    element.classList.add("shadow");
}

// Remove shadow
function removeShadow(element){
    element.classList.remove("shadow");
}

function displayConfirmation(){
    document.querySelector(".logout-popup").classList.remove("visually-hidden");
}

function hideConfirmation(){
    document.querySelector(".logout-popup").classList.add("visually-hidden");
}

function addUnderline(element){
    element.classList.add("text-decoration-underline");
}

// Remove active
function removeUnderline(element){
    element.classList.remove("text-decoration-underline");
}