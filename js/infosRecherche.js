
/*

 _______         ___
|_     _|.-----.'  _|.-----.-----.
 _|   |_ |     |   _||  _  |__ --|
|_______||__|__|__|  |_____|_____|
                       __
.--------.--.--.-----.|__|.-----.--.--.-----.
|        |  |  |__ --||  ||  _  |  |  |  -__|
|__|__|__|_____|_____||__||__   |_____|_____|
                             |__|

 */


$('#tabrecherche').on('click', '.infosmusique', () =>
    {

        let idmusique = $(event.target).closest('.infosmusique').attr('value');
        console.error(idmusique);
        ajaxRequest('GET', '../php/request.php/infosMusique', musiqueModal, 'idmusique='+idmusique);
    }
);

function musiqueModal(infos) {
    console.warn(infos);
    let temps = Math.round((infos['temps_musique']/60000) * 100) / 100
    $('#modalMusiqueTitle').html(infos['titre_musique']);
    $('#modalMusiqueInner').html('<p class="info"> Nom Artiste : '+ infos['nom_artiste'] +' </p>' +
                                        '<p class="info"> Nom Album : '+ infos['titre_album'] +' </p>' +
                                        '<p class="info"> Temps Musique : '+ temps +' min </p>');

}

/*

 _______         ___                         __ __
|_     _|.-----.'  _|.-----.-----.   .---.-.|  |  |--.--.--.--------.
 _|   |_ |     |   _||  _  |__ --|   |  _  ||  |  _  |  |  |        |
|_______||__|__|__|  |_____|_____|   |___._||__|_____|_____|__|__|__|

 */

$('#tabrecherche').on('click', '.infosalbum', () =>
    {

        let idalbum = $(event.target).closest('.infosalbum').attr('value');
        console.error(idalbum);
        ajaxRequest('GET', '../php/request.php/infosAlbum', albumModal, 'idalbum='+idalbum);
    }
);

function albumModal(infos) {

    $('#modalMusiqueTitle').html(infos['titre_album']);
    $('#modalMusiqueInner').html('<p class="info"> Nom Artiste : '+ infos['nom_artiste'] +' </p>' +
        '<p class="info"> Date : '+ infos['date_album'] +' </p>' +
        '<p class="info"> Genre : '+ infos['genre_album'] +' </p>');

}