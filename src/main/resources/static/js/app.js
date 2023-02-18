// Add pill
function addPill(element) {

  element.classList.add("pill");
}
// Remove pill
function removePill(element) {
  element.classList.remove("pill");
}

// Add pill
function addUserInfoPill(element) {

  element.classList.add("user-info-pill");
}
// Remove pill
function removeUserInfoPill(element) {
  element.classList.remove("user-info-pill");
}

// Reveal password
function revealPassword(element) {
  element.classList.add("invisible")
  document.getElementById("password-visible").classList.remove("invisible")
  document.getElementById("pw").setAttribute("type","text")
}

// Hide pasword
function hidePassword(element) {
  element.classList.add("invisible")
  document.getElementById("password-hidden").classList.remove("invisible")
  document.getElementById("pw").setAttribute("type","password")
}