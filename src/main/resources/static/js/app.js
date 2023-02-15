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
	
    element.classList.add("pill");
}
// Remove pill
function removePill(element){
    element.classList.remove("pill");
}

// Add pill
function addUserInfoPill(element){
	
    element.classList.add("user-info-pill");
}
// Remove pill
function removeUserInfoPill(element){
    element.classList.remove("user-info-pill");
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