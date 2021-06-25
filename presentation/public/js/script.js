/* Consigne :
------------- 
1 - Créer un tableau contenant le chemin de quelques images.
2 - Lors du clic sur le bouton NEXT, passer à l'image suivante du tableau.
3 - Lors du clic sur le bouton PREV, passer à l'image précédente du tableau.
4 - Lors du clic sur le bouton PLAY, on lance la lecture automatique des images du tableau;
    le changement se fera toutes les 3,5 secondes
*/

// 1-Déclaration des variables
var header = document.querySelector("header");
var prev = document.querySelector(".prev");
var play = document.querySelector(".play");
var next = document.querySelector(".next");
var index = 0;
var images = [
    "1.Premiere page.png",
    "2.Deuxieme page.png",
    "3.Troisieme page.png",
    "4.Quatrieme page.png",
    "5.Cinquieme page.png"
];
var timer = undefined;

// 2-Déclaration des fonctions
function afficher() {
    // On affiche l'image correspondante à l'index
    header.style.backgroundImage = "url('public/img/" + images[index] + "')";
    //console.log("Vous êtes sur l'image n° " + index);
}
function suivant() {
    // On incrémente
    index ++;

    // On replace la valeur de l'index
    if (index >= images.length) {
        index = 0;
    }

    afficher();
}
function precedent() {
    // On décrémente
    index --;

    // On replace la valeur de l'index
    if (index < 0) {
        index = images.length - 1;
    }
    
    afficher();
}
function togglePlay() {
    if (timer === undefined) {
        // Play
        console.log("play started");
        play.innerHTML = "<b>Pause ?</b>";
        timer = setInterval(function() {
            suivant();
        }, 3500);
    } else {
        // Pause
        console.log("play stopped");
        play.innerHTML = "<b>Play !</b>";
        timer = clearInterval(timer);
    }
}

// 3-Ajout des écouteurs
prev.addEventListener("click", function() {
    precedent();
});
next.addEventListener("click", function() {
    suivant();
});
play.addEventListener("click", function() {
    togglePlay();
});

window.addEventListener("keyup", function(e) {
    //console.log(e.code); // Le console.log() ici, permet de récupèrer l'évenement actuellement appelé "e"

    // Récupèration de la touche associée au code - Avec un switch
    switch(e.code) {
        case 'ArrowLeft': precedent(); break;
        case 'ArrowRight': suivant(); break;
        case 'Space': togglePlay(); break;
    }

    // Récupèration de la touche associée au code - Avec des conditions
    // if (e.code == 'ArrowLeft') {
    //     console.log(e.code);
    // }
    // if (e.code == 'ArrowRight') {
    //     console.log(e.code);
    // }
    // if (e.code == 'Space') {
    //     console.log(e.code);
    // }
});

// 4-Chargement par défaut
afficher();
