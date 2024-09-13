// Initialiser la carte
var map = L.map('map').setView([43.3, 5.4], 12);

L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
}).addTo(map);

var sentiersData = []; // Tableau pour stocker les données des sentiers

// Fonction pour centrer la carte sur un point
function centerMapOnPoint(lat, lng) {
    map.setView([lat, lng], 14); // Zoom à 14 ou ajustez en fonction de vos besoins
}

// Récupérer les points d'intérêt depuis le serveur avec AJAX
fetch('getSentiers.php')
    .then(response => response.json())
    .then(data => {
        sentiersData = data; // Stocker les données des sentiers

        // Ajouter les marqueurs à la carte pour chaque point
        data.forEach(function(point) {
            var marker = L.marker([point.latitude, point.longitude]).addTo(map);

            var popupContent = `
                <b>${point.name}</b><br>
                Difficulté: ${point.difficulte}<br>
                Longueur: ${point.longueur_km} km<br>
                <p>${point.description}</p>
            `;

            marker.bindPopup(popupContent);
        });

        // Ajouter les sentiers à la liste
        var sentiersList = document.getElementById('sentiers-list');
        sentiersList.innerHTML = ''; // Vider la liste avant de la remplir

        data.forEach(function(point) {
            var sentierDiv = document.createElement('div');
            sentierDiv.classList.add('sentier');
            
            // Ajouter le contenu du sentier dans le div
            sentierDiv.innerHTML = `
                <img src="${point.image_url}" alt="Image de ${point.name}" class="sentier-image">
                <h3>${point.name}</h3>
                <p><b>Difficulté :</b> ${point.difficulte}</p>
                <p><b>Longueur :</b> ${point.longueur_km} km</p>
                <p><b>Description :</b> ${point.description}</p>
            `;
            
            // Sélectionner l'image dans le sentierDiv pour lui ajouter un événement click
            var sentierImage = sentierDiv.querySelector('img');

            // Ajouter l'événement click sur l'image uniquement
            sentierImage.addEventListener('click', function(event) {
                event.stopPropagation(); // Stopper la propagation pour éviter que le click se propage au parent
                centerMapOnPoint(point.latitude, point.longitude);
            });

            // Ajouter le div à la liste des sentiers
            sentiersList.appendChild(sentierDiv);
        });
    })
    .catch(error => {
        console.error('Erreur lors du chargement des sentiers:', error);
    });

// Gestion du bouton "Découvrir" pour faire défiler vers la section des sentiers
document.getElementById('discover-btn').addEventListener('click', function(event) {
    event.preventDefault();

    document.querySelector('#sentiers-section').scrollIntoView({
        behavior: 'smooth',
        block: 'start'
    });
});
