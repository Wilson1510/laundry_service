const modal = document.getElementById("myModal");
const openModalButton = document.querySelectorAll('.openModalButton');
const closeModalButton = document.getElementById("closeModalButton");
const hiddenField = document.getElementById('hiddenField');

const dropdown = document.querySelector('.dropdown');
const content = document.querySelector('.dropdown-content');
const body = document.querySelector('body');

openModalButton.forEach(function(button){
    button.addEventListener("click", function(){
        event.preventDefault();
        modal.style.display = "block";
        const buttonid = event.target.getAttribute('data-id');
        hiddenField.value = buttonid;
    })
})

closeModalButton.addEventListener("click", function() {
    modal.style.display = "none"; // Menyembunyikan modal
});

dropdown.addEventListener("click", function(){
    content.style.display = "block";
})

window.addEventListener("click", function(event) {
    if (event.target === modal) {
        modal.style.display = "none";
    }
    else if(event.target === body){
        content.style.display = "none";
    }
});