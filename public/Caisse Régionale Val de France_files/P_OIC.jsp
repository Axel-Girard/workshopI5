







/**
 *	Remplace tout les caractères accentués d'une chaine de characters par leur équivalent non accentué
 *	@param	str la chaine de characters entrantes
 *	@return	 la chaine en argument sans les accentuations
 */
function removeDiacritics (str) {
	var diacriticsMap = {
		A:/[\u0041\u24B6\uFF21\u00C0\u00C1\u00C2\u1EA6\u1EA4\u1EAA\u1EA8\u00C3\u0100\u0102\u1EB0\u1EAE\u1EB4\u1EB2\u0226\u01E0\u00C4\u01DE\u1EA2\u00C5\u01FA\u01CD\u0200\u0202\u1EA0\u1EAC\u1EB6\u1E00\u0104\u023A\u2C6F]/g,
		AA:/[\uA732]/g,
		AE:/[\u00C6\u01FC\u01E2]/g,
		AO:/[\uA734]/g,
		AU:/[\uA736]/g,
		AV:/[\uA738\uA73A]/g,
		AY:/[\uA73C]/g,
		B:/[\u0042\u24B7\uFF22\u1E02\u1E04\u1E06\u0243\u0182\u0181]/g,
		C:/[\u0043\u24B8\uFF23\u0106\u0108\u010A\u010C\u00C7\u1E08\u0187\u023B\uA73E]/g,
		D:/[\u0044\u24B9\uFF24\u1E0A\u010E\u1E0C\u1E10\u1E12\u1E0E\u0110\u018B\u018A\u0189\uA779]/g,
		DZ:/[\u01F1\u01C4]/g,
		Dz:/[\u01F2\u01C5]/g,
		E:/[\u0045\u24BA\uFF25\u00C8\u00C9\u00CA\u1EC0\u1EBE\u1EC4\u1EC2\u1EBC\u0112\u1E14\u1E16\u0114\u0116\u00CB\u1EBA\u011A\u0204\u0206\u1EB8\u1EC6\u0228\u1E1C\u0118\u1E18\u1E1A\u0190\u018E]/g,
		F:/[\u0046\u24BB\uFF26\u1E1E\u0191\uA77B]/g,
		G:/[\u0047\u24BC\uFF27\u01F4\u011C\u1E20\u011E\u0120\u01E6\u0122\u01E4\u0193\uA7A0\uA77D\uA77E]/g,
		H:/[\u0048\u24BD\uFF28\u0124\u1E22\u1E26\u021E\u1E24\u1E28\u1E2A\u0126\u2C67\u2C75\uA78D]/g,
		I:/[\u0049\u24BE\uFF29\u00CC\u00CD\u00CE\u0128\u012A\u012C\u0130\u00CF\u1E2E\u1EC8\u01CF\u0208\u020A\u1ECA\u012E\u1E2C\u0197]/g,
		J:/[\u004A\u24BF\uFF2A\u0134\u0248]/g,
		K:/[\u004B\u24C0\uFF2B\u1E30\u01E8\u1E32\u0136\u1E34\u0198\u2C69\uA740\uA742\uA744\uA7A2]/g,
		L:/[\u004C\u24C1\uFF2C\u013F\u0139\u013D\u1E36\u1E38\u013B\u1E3C\u1E3A\u0141\u023D\u2C62\u2C60\uA748\uA746\uA780]/g,
		LJ:/[\u01C7]/g,
		Lj:/[\u01C8]/g,
		M:/[\u004D\u24C2\uFF2D\u1E3E\u1E40\u1E42\u2C6E\u019C]/g,
		N:/[\u004E\u24C3\uFF2E\u01F8\u0143\u00D1\u1E44\u0147\u1E46\u0145\u1E4A\u1E48\u0220\u019D\uA790\uA7A4]/g,
		NJ:/[\u01CA]/g,
		Nj:/[\u01CB]/g,
		O:/[\u004F\u24C4\uFF2F\u00D2\u00D3\u00D4\u1ED2\u1ED0\u1ED6\u1ED4\u00D5\u1E4C\u022C\u1E4E\u014C\u1E50\u1E52\u014E\u022E\u0230\u00D6\u022A\u1ECE\u0150\u01D1\u020C\u020E\u01A0\u1EDC\u1EDA\u1EE0\u1EDE\u1EE2\u1ECC\u1ED8\u01EA\u01EC\u00D8\u01FE\u0186\u019F\uA74A\uA74C]/g,
		OI:/[\u01A2]/g,
		OO:/[\uA74E]/g,
		OU:/[\u0222]/g,
		OE:/[\u008C\u0152]/g,
		oe:/[\u009C\u0153]/g,
		P:/[\u0050\u24C5\uFF30\u1E54\u1E56\u01A4\u2C63\uA750\uA752\uA754]/g,
		Q:/[\u0051\u24C6\uFF31\uA756\uA758\u024A]/g,
		R:/[\u0052\u24C7\uFF32\u0154\u1E58\u0158\u0210\u0212\u1E5A\u1E5C\u0156\u1E5E\u024C\u2C64\uA75A\uA7A6\uA782]/g,
		S:/[\u0053\u24C8\uFF33\u1E9E\u015A\u1E64\u015C\u1E60\u0160\u1E66\u1E62\u1E68\u0218\u015E\u2C7E\uA7A8\uA784]/g,
		T:/[\u0054\u24C9\uFF34\u1E6A\u0164\u1E6C\u021A\u0162\u1E70\u1E6E\u0166\u01AC\u01AE\u023E\uA786]/g,
		TZ:/[\uA728]/g,
		U:/[\u0055\u24CA\uFF35\u00D9\u00DA\u00DB\u0168\u1E78\u016A\u1E7A\u016C\u00DC\u01DB\u01D7\u01D5\u01D9\u1EE6\u016E\u0170\u01D3\u0214\u0216\u01AF\u1EEA\u1EE8\u1EEE\u1EEC\u1EF0\u1EE4\u1E72\u0172\u1E76\u1E74\u0244]/g,
		V:/[\u0056\u24CB\uFF36\u1E7C\u1E7E\u01B2\uA75E\u0245]/g,
		VY:/[\uA760]/g,
		W:/[\u0057\u24CC\uFF37\u1E80\u1E82\u0174\u1E86\u1E84\u1E88\u2C72]/g,
		X:/[\u0058\u24CD\uFF38\u1E8A\u1E8C]/g,
		Y:/[\u0059\u24CE\uFF39\u1EF2\u00DD\u0176\u1EF8\u0232\u1E8E\u0178\u1EF6\u1EF4\u01B3\u024E\u1EFE]/g,
		Z:/[\u005A\u24CF\uFF3A\u0179\u1E90\u017B\u017D\u1E92\u1E94\u01B5\u0224\u2C7F\u2C6B\uA762]/g,
		a:/[\u0061\u24D0\uFF41\u1E9A\u00E0\u00E1\u00E2\u1EA7\u1EA5\u1EAB\u1EA9\u00E3\u0101\u0103\u1EB1\u1EAF\u1EB5\u1EB3\u0227\u01E1\u00E4\u01DF\u1EA3\u00E5\u01FB\u01CE\u0201\u0203\u1EA1\u1EAD\u1EB7\u1E01\u0105\u2C65\u0250]/g,
		aa:/[\uA733]/g,
		ae:/[\u00E6\u01FD\u01E3]/g,
		ao:/[\uA735]/g,
		au:/[\uA737]/g,
		av:/[\uA739\uA73B]/g,
		ay:/[\uA73D]/g,
		b:/[\u0062\u24D1\uFF42\u1E03\u1E05\u1E07\u0180\u0183\u0253]/g,
		c:/[\u0063\u24D2\uFF43\u0107\u0109\u010B\u010D\u00E7\u1E09\u0188\u023C\uA73F\u2184]/g,
		d:/[\u0064\u24D3\uFF44\u1E0B\u010F\u1E0D\u1E11\u1E13\u1E0F\u0111\u018C\u0256\u0257\uA77A]/g,
		dz:/[\u01F3\u01C6]/g,
		e:/[\u0065\u24D4\uFF45\u00E8\u00E9\u00EA\u1EC1\u1EBF\u1EC5\u1EC3\u1EBD\u0113\u1E15\u1E17\u0115\u0117\u00EB\u1EBB\u011B\u0205\u0207\u1EB9\u1EC7\u0229\u1E1D\u0119\u1E19\u1E1B\u0247\u025B\u01DD]/g,
		f:/[\u0066\u24D5\uFF46\u1E1F\u0192\uA77C]/g,
		g:/[\u0067\u24D6\uFF47\u01F5\u011D\u1E21\u011F\u0121\u01E7\u0123\u01E5\u0260\uA7A1\u1D79\uA77F]/g,
		h:/[\u0068\u24D7\uFF48\u0125\u1E23\u1E27\u021F\u1E25\u1E29\u1E2B\u1E96\u0127\u2C68\u2C76\u0265]/g,
		hv:/[\u0195]/g,
		i:/[\u0069\u24D8\uFF49\u00EC\u00ED\u00EE\u0129\u012B\u012D\u00EF\u1E2F\u1EC9\u01D0\u0209\u020B\u1ECB\u012F\u1E2D\u0268\u0131]/g,
		j:/[\u006A\u24D9\uFF4A\u0135\u01F0\u0249]/g,
		k:/[\u006B\u24DA\uFF4B\u1E31\u01E9\u1E33\u0137\u1E35\u0199\u2C6A\uA741\uA743\uA745\uA7A3]/g,
		l:/[\u006C\u24DB\uFF4C\u0140\u013A\u013E\u1E37\u1E39\u013C\u1E3D\u1E3B\u017F\u0142\u019A\u026B\u2C61\uA749\uA781\uA747]/g,
		lj:/[\u01C9]/g,
		m:/[\u006D\u24DC\uFF4D\u1E3F\u1E41\u1E43\u0271\u026F]/g,
		n:/[\u006E\u24DD\uFF4E\u01F9\u0144\u00F1\u1E45\u0148\u1E47\u0146\u1E4B\u1E49\u019E\u0272\u0149\uA791\uA7A5]/g,
		nj:/[\u01CC]/g,
		o:/[\u006F\u24DE\uFF4F\u00F2\u00F3\u00F4\u1ED3\u1ED1\u1ED7\u1ED5\u00F5\u1E4D\u022D\u1E4F\u014D\u1E51\u1E53\u014F\u022F\u0231\u00F6\u022B\u1ECF\u0151\u01D2\u020D\u020F\u01A1\u1EDD\u1EDB\u1EE1\u1EDF\u1EE3\u1ECD\u1ED9\u01EB\u01ED\u00F8\u01FF\u0254\uA74B\uA74D\u0275]/g,
		oi:/[\u01A3]/g,
		ou:/[\u0223]/g,
		oo:/[\uA74F]/g,
		p:/[\u0070\u24DF\uFF50\u1E55\u1E57\u01A5\u1D7D\uA751\uA753\uA755]/g,
		q:/[\u0071\u24E0\uFF51\u024B\uA757\uA759]/g,
		r:/[\u0072\u24E1\uFF52\u0155\u1E59\u0159\u0211\u0213\u1E5B\u1E5D\u0157\u1E5F\u024D\u027D\uA75B\uA7A7\uA783]/g,
		s:/[\u0073\u24E2\uFF53\u00DF\u015B\u1E65\u015D\u1E61\u0161\u1E67\u1E63\u1E69\u0219\u015F\u023F\uA7A9\uA785\u1E9B]/g,
		t:/[\u0074\u24E3\uFF54\u1E6B\u1E97\u0165\u1E6D\u021B\u0163\u1E71\u1E6F\u0167\u01AD\u0288\u2C66\uA787]/g,
		tz:/[\uA729]/g,
		u: /[\u0075\u24E4\uFF55\u00F9\u00FA\u00FB\u0169\u1E79\u016B\u1E7B\u016D\u00FC\u01DC\u01D8\u01D6\u01DA\u1EE7\u016F\u0171\u01D4\u0215\u0217\u01B0\u1EEB\u1EE9\u1EEF\u1EED\u1EF1\u1EE5\u1E73\u0173\u1E77\u1E75\u0289]/g,
		v:/[\u0076\u24E5\uFF56\u1E7D\u1E7F\u028B\uA75F\u028C]/g,
		vy:/[\uA761]/g,
		w:/[\u0077\u24E6\uFF57\u1E81\u1E83\u0175\u1E87\u1E85\u1E98\u1E89\u2C73]/g,
		x:/[\u0078\u24E7\uFF58\u1E8B\u1E8D]/g,
		y:/[\u0079\u24E8\uFF59\u1EF3\u00FD\u0177\u1EF9\u0233\u1E8F\u00FF\u1EF7\u1E99\u1EF5\u01B4\u024F\u1EFF]/g,
		z:/[\u007A\u24E9\uFF5A\u017A\u1E91\u017C\u017E\u1E93\u1E95\u01B6\u0225\u0240\u2C6C\uA763]/g
	};
	for (var x in diacriticsMap) {
		// Iterate through each keys in the above object and perform a replace
		str = str.replace(diacriticsMap[x], x);
	}
	return str;
}
/* ****************************************************************************
 *	Début: Tracking
 **************************************************************************** */
/**
 * Génère les requêtes de tracking lors des clics
 */
function trackingClickTag(canal){
	var nomSite = "Vitrine";
	var page;
	if(typeof OICTOPISBAM != "undefined" && OICTOPISBAM == true){
		page = g_TagPageBAM;
		nomSite = "BAM";
	}else if(typeof OICTOPISBAM == "undefined" || OICTOPISBAM == false){
		page = processXtParam(Xt_param);
	}
	if(typeof cmCreateManualLinkClickTag != "undefined"){
		cmCreateManualLinkClickTag('/?cm_re=' + canal + '-_-' + nomSite + '-_-' + page, page, 'OIC-Bouton Vert');
	}
}
/**
 * Génère les requêtes de tracking pour les formulaires
 */
function trackingEventTag( idEvent, numEtape, idCatEvent){
	var idCatEventPlusAppli = idCatEvent;
	if(typeof OICTOPISBAM != "undefined" && OICTOPISBAM == true){
		idCatEventPlusAppli += "_BAM";
	}else if(typeof OICTOPISBAM == "undefined"){
		idCatEventPlusAppli += "_Vitrine";
	}
	if(typeof cmCreateConversionEventTag != "undefined"){
		cmCreateConversionEventTag(idEvent, numEtape, idCatEventPlusAppli);
	}
 }
/**
 * Génère les requêtes de tracking lors de l'ouverture du bouton vert
 */
function trackingPageTag(){
	if(typeof cmCreatePageviewTag != "undefined"){
		cmCreatePageviewTag("Ouverture Bouton Vert");
	}
}
/* ****************************************************************************
 *	Fin: Tracking
 **************************************************************************** */
/**
 * 	initiation des cartes utilisées dans l'outil Mail, WCB et RDV
 * 	ajoute la fonction 'autocomplete' pour le champ de recherche d'agence
 */
function initMap() {
	 if(jQuery('#oic-map_mail').length > 0)
		map = new google.maps.Map(document.getElementById('oic-map_mail'), {center: new google.maps.LatLng(46.99, 2.24), zoom: 5, disableDefaultUI: true});
	 if(jQuery('#oic-map_wcb').length > 0)
		mapWCB = new google.maps.Map(document.getElementById('oic-map_wcb'), {center: new google.maps.LatLng(46.99, 2.24), zoom: 5, disableDefaultUI: true});
	if(jQuery('#oic-map_rdv').length > 0)
		mapRDV = new google.maps.Map(document.getElementById('oic-map_rdv'), {center: new google.maps.LatLng(46.99, 2.24), zoom: 5, disableDefaultUI: true});
	var input = document.getElementById('oic_mail_geoc_form_agence')
	if(jQuery("#oic_mail_geoc_form_agence").length){
		var autocomplete = new google.maps.places.Autocomplete(input);
		autocomplete.addListener('place_changed', function() {
			jQuery("#oic_mail_btn_lien_autour_de_moi_confirmation").click();
			return;
		});
	}
	var inputWCB = document.getElementById('oic_wcb_geoc_form_agence');
	if(jQuery("#oic_wcb_geoc_form_agence").length){
		var autocompleteWCB = new google.maps.places.Autocomplete(inputWCB);
		autocompleteWCB.addListener('place_changed', function() {
			jQuery("#oic_wcb_btn_lien_autour_de_moi_confirmation").click();
			return;
		});
	}
	var inputRDV = document.getElementById('oic_rdv_geoc_form_agence');
	if(jQuery("#oic_rdv_geoc_form_agence").length){
		var autocompleteRDV = new google.maps.places.Autocomplete(inputRDV);
		autocompleteRDV.addListener('place_changed', function() {
			jQuery("#oic_rdv_btn_lien_autour_de_moi_confirmation").click();
			return;
		});
	}
}
// variables globales utilisées pour les cartes gmap
var map; var mapWCB;var mapRDV;
var markers = [];var markersWCB = [];var markersRDV = [];
// variable pour isoler la version de jQuery
var jQueryOIC;
/*
 * Le bouton vert n'est pas affiché sur ces pages pour plusieurs raisons:
 *	- régler le conflit causé par plusieurs appels à l'API gmap
 *	- ces pages ne devraient faire partie d'aucun marché
 */
if(window.location.pathname != "/trouvez-une-agence-pres-de-chez-vous.html" && window.location.pathname != "/banque-assurance.html"){
jQuery.getScript( "//www.ca-valdefrance.fr/Vitrine/ObjCommun/DCIV2/js/v_16_1/jQuery/jquery-1.12.1.min.js", function( data, textStatus, jqxhr ) {
jQuery.getScript( "//www.ca-valdefrance.fr/Vitrine/ObjCommun/DCIV2/js/v_16_1/jQueryUi/jquery-ui.js", function( data, textStatus, jqxhr ) {
jQuery.getScript( "//www.ca-valdefrance.fr/Vitrine/ObjCommun/DCIV2/js/jquery.validate.js", function( data, textStatus, jqxhr ) {
jQuery.getScript( "//www.ca-valdefrance.fr/Vitrine/ObjCommun/js/formulaires/formValidation.js", function( data, textStatus, jqxhr ) {
jQuery.getScript( "//www.ca-valdefrance.fr/Vitrine/ObjCommun/DCIV2/js/v_16_1/select2.js", function( data, textStatus, jqxhr ) {
	jQueryOIC = jQuery.noConflict(true);
	var jours = ['Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi', 'Dimanche'];
	
	// variable pour le tracking du canal mail servant à indiquer si l'utilisateur à selectionné une agence en particulier ou non lorsqu'il soumet le formulaire
	var oicMailAgenceParticuliere = false;
	
	// constantes qui identifient les différents canaux
	var OIC_MAIL = "MAIL";var OIC_WCB = "WCB";var OIC_RDV = "RDV";
	
	// date du serveur lors de la génération de la page
	// CANOUS-21179 Modification du traitement de la Date pour IE & Safari
	var initDateServeur = new Date(2017,11,28,11,46,15);
	// date du client lors de l'affichage de la page
	var initDateClient = new Date();
	/**
	 *	Ajouter le captcha au formulaire d'id idElement
	 */
	function obtenirCaptcha(idElement){
		jQueryOIC.ajax({
			type:'get',
			headers:{'Origin': "//www.ca-valdefrance.fr"},
			url: "//www.ca-valdefrance.fr/Vitrine/ModExt/FO/OIC/getCaptchaOic.jsp",
			data: {"oic": "true"},
			success: function(result){
				jQueryOIC("#" + idElement).empty();
				if(typeof jQueryOIC(result).find('root').html() != "undefined"){
					jQueryOIC("#" + idElement).append(jQueryOIC(result).find('root').html().trim().replace('<img', '<img style="width:100%"'));
					jQueryOIC('input[name="tmp-captcha-value"]').addClass('oic-captcha');
					jQueryOIC("#" + idElement).append('<span class="form-error-bouton spanHiddenCaptcha oic-display_none_el">Veuillez saisir le texte de l\'image ci-dessus</span>');
					jQueryOIC('.oic-captcha').blur(function(){jQueryOIC(this).removeClass('valid');});
				}
			}
		});
	}
	/**
	 *	Objet JS Agence
	 */
	function Agence(id, nom, adresse, codepostal, ville, email, telephone, lng, lat, horaires){
		this.id = id;
		this.nom = nom;
		this.adresse = adresse;
		this.codepostal = codepostal;
		this.ville = ville;
		this.email = email;
		this.telephone = telephone;
		this.lng = lng;
		this.lat = lat;
		this.horaires = horaires;
	}
	/**
	 *	Méthode de l'objet Agence qui génère le code html des horaires d'une agence
	 */
	Agence.prototype.genererHtmlHorairesAgences = function(){
		var htmlResult =	'<ul class="oic_horaire_agence">';
		if(this.horaires.lundi != "fermé")		htmlResult +=	'<li><span>Lun</span><span>' + this.horaires.lundi + '</span></li>';
		if(this.horaires.mardi != "fermé")		htmlResult +=	'<li><span>Mar</span><span>' + this.horaires.mardi + '</span></li>';
		if(this.horaires.mercredi != "fermé")	htmlResult +=	'<li><span>Mer</span><span>' + this.horaires.mercredi + '</span></li>';
		if(this.horaires.jeudi != "fermé")		htmlResult +=	'<li><span>Jeu</span><span>' + this.horaires.jeudi + '</span></li>';
		if(this.horaires.vendredi != "fermé")	htmlResult +=	'<li><span>Ven</span><span>' + this.horaires.vendredi+ '</span></li>';
		if(this.horaires.samedi != "fermé")		htmlResult +=	'<li><span>Sam</span><span>' + this.horaires.samedi + '</span></li>';
		if(this.horaires.dimanche != "fermé")	htmlResult +=	'<li><span>Dim</span><span>' + this.horaires.dimanche + '</span></li>';
		htmlResult +=		'</ul>';
		return htmlResult;
	}
	/**
	 * 	Indique si un outil actuellement disponible
	 * 	@param horaire les horaires de disponibilités de l'outil
	 *	@return true si l'outil est actuellement disponible
				false si l'outil n'est pas disponible actuellement
	 */
	function outilDispo(horaire){
		if(horaire == "fermé"){
			return false;
		}
		var horairesDuJour = new String(horaire).split("|");
		var matin = horairesDuJour[0].split("-");
		var debutMatin = new Date().setHours(matin[0].split("h")[0], matin[0].split("h")[1], 0, 0);
		var finMatin = new Date().setHours(matin[1].split("h")[0], matin[1].split("h")[1], 0, 0);
		// si les horaires sont au format AAhBB-CChDD|EEhFF-GGhHH
		if(horairesDuJour.length > 1){
			var soir = horairesDuJour[1].split("-");
			var debutSoir = new Date().setHours(soir[0].split("h")[0], soir[0].split("h")[1], 0, 0);
			var finSoir = new Date().setHours(soir[1].split("h")[0], soir[1].split("h")[1], 0, 0);
		}
		var nowClient = new Date();
		//l'heure actuelle du serveur vaut l'heure initiale du serveur à la génération de la jsp + le temps écoulé depuis le début de la navigation
		var nowServeur = new Date(initDateServeur.getTime() + (nowClient.getTime() - initDateClient.getTime()));
		var maintenant = new Date().setHours(nowServeur.getHours(), nowServeur.getMinutes(), nowServeur.getSeconds(), 0);
		// si les horaires sont au format AAhBB-CChDD|EEhFF-GGhHH
		if(horairesDuJour.length > 1){
			if(( maintenant > debutMatin && maintenant < finMatin ) || ( maintenant > debutSoir && maintenant < finSoir)){
				return true
			}else{
				return false;
			}
		}
		// si les horaires sont au format AAhBB-CChDD
		if(( maintenant > debutMatin && maintenant < finMatin )){
			return true
		}else{
			return false;
		}
	}
	/**
	 *	Objet JS Horaire
	 */
	function Horaire(lundi, mardi, mercredi, jeudi, vendredi, samedi, dimanche){
		this.lundi = lundi;
		this. mardi = mardi;
		this.mercredi = mercredi;
		this.jeudi = jeudi;
		this.vendredi = vendredi;
		this.samedi = samedi;
		this.dimanche = dimanche;
	}
	/**
	 *	Génère l'ensemble des balises <option> relatifs aux jours où l'agence est ouverte
	 */
	Horaire.prototype.genererOptionJoursOuverts = function(){
		var tableauHoraires = [this.lundi, this.mardi, this.mercredi, this.jeudi, this.vendredi, this.samedi, this.dimanche];
		var strResult = '<option value=""></option>';
		for(var i =0; i < tableauHoraires.length; i++){
			if(tableauHoraires[i] != "fermé"){
				strResult += '<option value="' + jours[i] + '">' + jours[i] + '</option>';
			}
		}
		strResult +='<option value="indifférent">Indifférent</option>';
		return strResult;
	}
	/**
	 * 	@param	numJour le numéro du jour de la semaine
	 *	Génère l'ensemble des balises <option> contenant les tranches horaires d'une heure pendant les horaires d'ouverture de l'agence
	 */
	Horaire.prototype.genererTranchesHorairesPourLeJour = function(numJour){
		var tableauHoraires = [this.lundi, this.mardi, this.mercredi, this.jeudi, this.vendredi, this.samedi, this.dimanche];
		var horairesDuJour = tableauHoraires[numJour].split("|");
		var matin = horairesDuJour[0].split("-");
		var debutMatin = new Date().setHours(matin[0].split("h")[0], matin[0].split("h")[1], 0, 0);
		var finMatin = new Date().setHours(matin[1].split("h")[0], matin[1].split("h")[1], 0, 0);
		var strResult = '<option value=""></option>';
		var heureActuelle;	var labelOption;
		// si on est pas dans une heure pile
		if(new Date(debutMatin).getMinutes() != 0){
			heureActuelle = new Date().setHours(new Date(debutMatin).getHours() + 1, 0, 0, 0);
		} else {
			heureActuelle = debutMatin;
		}
		while( new Date().setHours(new Date(heureActuelle).getHours() + 1, 0, 0, 0) <= finMatin){
			labelOption = 'Entre '+ new Date(heureActuelle).getHours() +'h00 et ' + (new Date(heureActuelle).getHours() + 1) + 'h00';
			strResult +=  '<option value="' + labelOption + '">' + labelOption + '</option>';
			heureActuelle = new Date().setHours(new Date(heureActuelle).getHours() + 1);
		}
		// si les horaires sont au format AAhBB-CChDD|EEhFF-GGhHH
		if(horairesDuJour.length > 1){
			var soir = horairesDuJour[1].split("-");
			var debutSoir = new Date().setHours(soir[0].split("h")[0], soir[0].split("h")[1], 0, 0);
			var finSoir = new Date().setHours(soir[1].split("h")[0], soir[1].split("h")[1], 0, 0);
			if(new Date(debutSoir).getMinutes() != 0){
				heureActuelle = new Date().setHours(new Date(debutSoir).getHours() + 1, 0, 0, 0);
			} else {
				heureActuelle = debutSoir;
			}
			while( new Date().setHours(new Date(heureActuelle).getHours() + 1, 0, 0, 0) <= finSoir){
				labelOption = 'Entre '+ new Date(heureActuelle).getHours() +'h00 et ' + (new Date(heureActuelle).getHours() + 1) + 'h00';
				strResult +=  '<option value="' + labelOption + '">' + labelOption + '</option>';
				heureActuelle = new Date().setHours(new Date(heureActuelle).getHours() + 1);
			}
		}
		return strResult;
	}
	/**
	 *	Génère l'ensemble des balises <option> contenant les tranches horaires par défaut
	 */
	Horaire.prototype.genererTranchesHorairesParDefaut = function(){
		var tranchesHorairesParDefaut = ['Entre 8h et 10h00','Entre 10h00 et 12h00','Entre 12h00 et 14h00','Entre 14h00 et 16h00','Entre 16h00 et 18h00','Entre 18h00 et 20h00','Indifférent'];
		var strResult = '<option value=""></option>';
		for(var i = 0; i < tranchesHorairesParDefaut.length; i++){
			strResult += '<option value="'+ tranchesHorairesParDefaut[i] +'">' + tranchesHorairesParDefaut[i] + '</option>';
		}
		return strResult;
	}
	/**
	 *	Indique si les horaires d'ouverture des agences sont renseignées pour tous les jours ou non
	 *	@return: true si tous les horaires sont renseignés
	 *			 false s'il existe au moins un horaire non renseigné
	 */
	Horaire.prototype.horaireRenseigneOuNon = function(){
		if(this.lundi == "" || this.mardi == "" || this.mercredi == "" || this.jeudi == "" || this.vendredi == "" || this.samedi == "" || this.dimanche == "") return false;
		return true;
	}
	/**
	 *	Indique si l'outil est actuellement disponible au client
	 *	@return		true si l'outil est disponibilité
	 *				false sinon
	 */
	Horaire.prototype.outilDispoAujourdhui = function(){
		var tableauHoraires = [this.dimanche, this.lundi, this.mardi, this.mercredi, this.jeudi, this.vendredi, this.samedi];
		return outilDispo(tableauHoraires[new Date().getDay()]);
	}

	// initilisation des horaires du canal chat à partir des informations rentrées dans le CMS
	var horairesChat = new Horaire(
		"9h30-12h00|14h30-17h30",
		"9h30-12h00|14h30-17h30",
		"9h30-12h00|14h30-17h30",
		"9h30-12h00|14h30-17h30",
		"9h30-12h00|14h30-17h30",
		"9h30-12h00|14h30-17h30",
		"fermé"
	);
	// initilisation des horaires du canal téléphone à partir des informations rentrées dans le CMS
	var horairesTel = new Horaire(
		"9h00-14h00|14h00-18h00",
		"9h00-14h00|14h00-18h00",
		"9h00-14h00|14h00-18h00",
		"9h00-14h00|14h00-18h00",
		"9h00-14h00|14h00-18h00",
		"9h00-10h00|10h00-12h00",
		"fermé"
	);
	/**
	 *	Génère le html du formulaire de décloisonnement du bouton vert, utilisé pour les canaux mail et priseRDV
	 */
	function construireFormDecloisement(){
		var formDecloi = 	'<form name="bamaccessoic" id="bamaccessoic" class="oic-display_none_el" autocomplete="off" method="post" action="' + chemin + '"><input type="hidden" name="TOP_ORIGINE" value="V"><input type="hidden" name="vitrine" value="O"><input type="hidden" name="largeur_ecran" value="800"><input type="hidden" name="hauteur_ecran" value="600"><input type="hidden" name="origine" value="vitrine"><input type="hidden" name="situationTravail" value="BANQUAIRE"><input type="hidden" name="canal" value="WEB"><input type="hidden" name="typeAuthentification" value="CLIC_ALLER"><input type="hidden" name="urlOrigine" value="https://www.ca-valdefrance.fr"><input type="hidden" name="tracking" value="O"><input type="hidden" name="idtcm" value=""></form>';
		return formDecloi;
	}
	/**
	 *	Génère le html relatif à l'outil mail
	 */
	function construirePanneauMail(){
		var panneauMail = "";
		panneauMail += 	'<div id="oic_mail" class="oic-display_none_el">' +
						'	<ul id="oic_mail_ul_titre" >' +
						'		<li class="oic_mail_li_titre_img"><img src="//www.ca-valdefrance.fr/Vitrine/ObjCommun/DCIV2/img/OIC/mail-01.png"></li>' +
						'		<li class="oic_mail_li_titre">CONTACTEZ<br>PAR MAIL</li>' +
						'	</ul>';
		if(typeof OICTOPISBAM == "undefined" || OICTOPISBAM == false){
			panneauMail +=	'	<div id="oic_mail_client_ca">' +
							'		<h2 class="oic_mail_h2_titre oic-typo_contenu_slider oic_mail_line_height">Vous êtes client<br>Crédit Agricole</h2>' +
							'		<p class="oic_mail_h2_p oic-typo_contenu_slider">Nous vous invitons à utiliser<br>votre messagerie client</p>' +
							'		<a id="oic_acces_bam_mail" class="oic_btn_lien">ACCÉDER À VOS COMPTES</a>' +
							'	</div>';
		}
		panneauMail +=	'	<div id="oic_mail_non_client">';
		if(typeof OICTOPISBAM == "undefined" || OICTOPISBAM == false){
			panneauMail +=	'		<h2 class="oic_mail_h2_titre oic-typo_contenu_slider oic_mail_line_height">Vous n\'êtes pas client<br>Crédit Agricole</h2>';
		}
		
		panneauMail +=	'		<div id="oic_mail_li_motifs" class="';
		
		panneauMail +=	'oic_form">' +
						'			<p>Veuillez indiquer le motif<br>de votre demande:</p>' +
						'			<select id="oic_mail_adresser_mail_agence_form" name="contact-motif" tabindex="-1" class="select2-hidden-accessible" aria-hidden="true">' +
						'				<option value="">Veuillez indiquer le motif</option>';
		var motifAutre = '';
	
		panneauMail += "<option value=\"p-443570\">Assurance</option>";
	
		motifAutre += "<option value=\"p-443573\">Autre message</option>";
	
		panneauMail += "<option value=\"p-443576\">Crédit conso</option>";
	
		panneauMail += "<option value=\"p-443579\">Demande d'info</option>";
	
		panneauMail += "<option value=\"p-443582\">Demande de RDV</option>";
	
		panneauMail += "<option value=\"p-443585\">Epargne</option>";
	
		panneauMail += "<option value=\"p-443588\">Réclamation</option>";
	
		panneauMail += motifAutre;
		panneauMail +=	'			</select>' +
						'		</div>' +
						'		<div  id="oic_mail_motif_form" class="oic-display_none_el oic_form">' +
						'			<form id="oic-mail-form" name="oic_mail_autre" method="POST">' +
						'				<span class="oic_champ_obligatoire">* Champ obligatoire</span>' +
						'			  	<div class="oic-mail-form-item">' +
						'					<label>Civilité<abbr class="oic-mandatory" title="Champ obligatoire">*</abbr></label><br>' +
						'					<input id="oic_mail_civilite_m" class="user-success" type="radio" name="oic_mail_1.oic_mail_civilite_1" value="M"></input>' +
						'					<label for="oic_mail_civilite_m" class="oic_mail_label">M</label>' +
						'					<input id="oic_mail_civilite_mme" class="user-success" type="radio" name="oic_mail_1.oic_mail_civilite_1" value="Mme"></input>' +
						'					<label for="oic_mail_civilite_mme" class="oic_mail_label">Mme</label><br>' +
						'					<span id="spanHiddenCivilite" class="form-error-bouton spanHidden">Veuillez saisir la civilité</span>' +
						'				</div>' +
						'			   <div class="oic-mail-form-item">' +
						'					 <label>Prénom<abbr class="oic-mandatory" title="Champ obligatoire">*</abbr></label>' +
						'					<input type="text" class="user-success" name="oic_mail_1.oic_mail_prenom_1" placeholder="Votre prénom" prénom" aria-required="true" minlength="2" maxlength="100" ></input>' +
						'			   </div>' +
						'			   <div class="oic-mail-form-item">' +
						'					<label>Nom<abbr class="oic-mandatory" title="Champ obligatoire">*</abbr></label>' +
						'					<input type="text" class="user-success" name="oic_mail_1.oic_mail_nom_1" placeholder="Votre nom"  aria-required="true"  minlength="2" maxlength="100"></input>' +
						'			   </div>' +
						'			   <div class="oic-mail-form-item">' +
						'					<label>Email<abbr class="oic-mandatory" title="Champ obligatoire">*</abbr></label>' +
						'					<input class="user-success" type="text" name="oic_mail_1.oic_mail_adresse_mail_1" placeholder="adresse@email.com" aria-required="true" maxlength="100"></input>' +
						'			   </div>' +
						'			   <div class="oic-mail-form-item">' +
						'					<label>Téléphone<abbr class="oic-mandatory" title="Champ obligatoire">*</abbr></label>' +
						'					<input type="text" class="user-success"  id="form_contact_mail_telephone" name="oic_mail_1.oic_mail_num_telephone_1" placeholder="Votre téléphone" aria-required="true"  minlength="10" maxlength="10"></input>' +
						'			   </div>' +
						'			   <div class="oic-mail-form-item">' +
						'					<label>Message<abbr class="oic-mandatory" title="Champ obligatoire">*</abbr></label>' +
						'					<textarea id="form_contact_mail_message" class="user-success" name="oic_mail_1.oic_mail_message_1" aria-required="true"  placeholder="20 caractères minimum" minlength="20" maxlength="500"></textarea>' +
						'			   </div>' +
						'			   <div class="oic-mail-form-item">' +
						'					<input name="oic_mail_1.routAg-id_eds_agence_1" type="hidden"></input>' +
						'			   </div>' +
						'			   <div class="oic-mail-form-item">' +
						'					<input name="oic_mail_1.oic_agence_choisie_1" type="hidden"></input>' +
						'			   </div>' +
						'				<div id="oic-mail-captcha" class="oic-mail-form-item">' +
						'				</div>' +
						'			   <div class="oic-mail-form-item">' +
						'					<input id="oic_mail_affichage_mentions_CNIL" type="checkbox" name="CNIL" class="inpCheckbox user-success"/>' +
						'					<label for="oic_mail_affichage_mentions_CNIL">Je certifie avoir pris connaissance des <a id="oic-lien-cnil" href ="#oic_mentions_CNIL">mentions CNIL</a></label><br />' +
						'					<span id="spanHiddenCnil" class="form-error-bouton spanHidden">Veuillez cocher les mentions CNIL</span>' +
						'			   </div> ' +
						'			   <div class="oic-mail-form-item">' +
						'					<input type="submit" value="ENVOYER" class="button-normal-submit">' +
						'			   </div>' +
						'			</form>' +
						'		</div>' +
						'		<div id="oic_mentions_CNIL" class="oic-display_none_el oic_mentions_CNIL"><p>Conformément à l\'article 32 de la loi « Informatique et Libertés » du 6 janvier 1978, nous vous informons que la communication des données à caractère personnel indiquée par un astérisque est obligatoire. Le défaut de communication de ces données aura pour seule conséquence de ne pas nous permettre de prendre en compte votre demande de prise de contact. Nous vous informons que la Caisse Régionale de Crédit Agricole Val de France (ci-après « la Banque ») est le responsable du traitement et que les données à caractère personnel qui seront collectées pourront faire l\'objet d\'un traitement automatisé ou non pour les finalités suivantes : prise de contact, connaissance du client, gestion de la relation bancaire et financière, prospection et animation commerciale, étude statistique. Vos opérations et vos données à caractère personnel sont couvertes par le secret professionnel auquel nous sommes tenus. Toutefois, vous autorisez expressément la Banque à communiquer ces données (nom, adresse, numéro de téléphone, email) à : - toute entité du Groupe Crédit Agricole à des fins de prospection commerciale ou en cas de mise en commun de moyens ou de regroupement de sociétés; - nos sous-traitants pour les seuls besoins de la sous-traitance; - à nos partenaires pour vous permettre de bénéficier des avantages de ces partenariats; - à des instituts d\'enquêtes ou de sondages, agissant pour le compte de la Banque ou du Groupe Crédit Agricole, à des fins statistiques, sachant que vous n\'êtes pas tenu de répondre à leurs sollicitations et que vos données seront détruites après traitement. En outre, pour satisfaire aux obligations légales et réglementaires, la Banque peut être tenue de communiquer ces informations à des autorités judiciaires ou administratives légalement habilitées. La liste des entités du Groupe Crédit Agricole susceptibles d\'être bénéficiaires d\'informations vous concernant pourra vous être communiquée sur simple demande de votre part à l\'adresse suivante: Crédit Agricole Val de France - CS 50069 - 28008 CHARTRES Cedex. Vous pouvez, à tout moment, conformément à la loi, accéder aux informations vous concernant, les faire rectifier, vous opposer à leur traitement pour motif légitime, à leur communication à des tiers ou à leur utilisation à des fins commerciales, en écrivant par lettre simple à l\'adresse suivante Crédit Agricole Val de France - CS 50069 - 28008 CHARTRES Cedex. Les frais de timbre consécutifs à l\'exercice de votre droit d\'opposition à l\'utilisation de vos données à des fins de prospection seront remboursés par simple demande de votre part.<br/></p></div>'+
						'		<div id="oic_mail_confirm" class="oic-display_none_el">' +
						'			<h2 class="oic_mail_h2_titre_btn_fermer oic-typo_contenu_slider">Votre message a été envoyé.<br/><br/>Nous vous remercions pour votre confiance.<br/></h2>' +
						'			<a href="#" class="oic_btn_lien oic_mail_btn_lien_Fermer oic-btn_close_contact">FERMER</a>' +
						'		</div>' +
						'	</div>' +
						'</div>';
		return panneauMail;
	}
	/**
	 *	Génère le html relatif à l'outil chat
	 */
	function construirePanneauChat(){
		var panneauChat = 	'<div id="oic_chat" class="oic-display_none_el"><span id="vvc_placeholder_56fbe9a54d3801685a8b4606" hidden></span>' +
				'	<div id="oic_chat-texte_indisponibilite">Nous sommes désolé...<br/><br/>Le service est indisponible pour le moment.<br/><br/>Nous vous invitons à nous contacter par un autre canal.<br/></div>' +
				'</div>';
		return panneauChat;
	}
	/**
	 *	Génère le html relatif à l'outil telephone
	 *	@param isBAM : boolean indique si on se trouve dans une page BAM ou Vitrine
	 */
	function construirePanneauTelephone(isBAM){
		var panneauTelephone = '<div id="oic_wcb"  class="oic-display_none_el">' +
								'	<ul id="oic_wcb_ul_titre"  class="oic-display_none_el" >' +
								'		<li class="oic_wcb_li_titre_img"><img src="//www.ca-valdefrance.fr/Vitrine/ObjCommun/DCIV2/img/OIC/tel-01.png"></li>' +
								'		<li class="oic_wcb_li_titre">CONTACTEZ<br>PAR TELEPHONE</li>' +
								'	</ul>' +
								'	<div id="oic-wcb_texte_indisponibilite" class="oic-display_none_el">Nos conseillers « Assurances » sont à votre disposition du Lundi  au Vendredi de 9h à 18h.<br/> <br/>Pour tout autre projet, nous sommes à votre disposition du Mardi au Vendredi de 9h à 19h et le samedi de 9h à 13h.<br/><br/>Au plaisir d’échanger prochainement avec vous !<br/></div>';
		// si le client a une agence
		if(isBAM && typeof OICIDAGENCE != "undefined" && OICIDAGENCE != null){
			panneauTelephone +=	'	<div id="oic_wcb_appelez_nous"  class="oic-display_none_el"></div>';
		} else {
	
			panneauTelephone += '	<div id="oic_wcb_appelez_nous"  class="oic-display_none_el">' +
								'		<p> Appelez-nous</p>'+
								'		<div id="oic_wcb_bloc_tel">';
	
			panneauTelephone +=	'			<span class="oic_wcb_libelle">ASSURANCES</span>';
	
	
			panneauTelephone +=	'			<span class="oic_wcb_tel">' + '02.37.27.30.31' + '</span>';
	
			panneauTelephone +=	'			<span class="oic_prix_appel_local">Du lundi au vendredi de 9h à 18h</span>';
	
			panneauTelephone +=	'			<span class="oic_wcb_libelle">CRÉDITS</span>';
	
	
			panneauTelephone +=	'			<span class="oic_wcb_tel">' + '02 37 88 32 70' + '</span>';
	
			panneauTelephone +=	'			<span class="oic_prix_appel_local">Du mardi au vendredi de 9h à 19h et le samedi de 9h à 13h</span>';
	
			panneauTelephone +=	'			<span class="oic_wcb_libelle">BANQUE AU QUOTIDIEN &amp; ÉPARGNE</span>';
	
	
			panneauTelephone +=	'			<span class="oic_wcb_tel">' + '02 37 88 32 72' + '</span>';
	
			panneauTelephone +=	'			<span class="oic_prix_appel_local">Appel non surtaxé - prix d\'un appel variable selon votre opérateur</span>';
	
			panneauTelephone += '		</div></div>';
	
		}
	
			panneauTelephone +=	'	<div id="oic_wcb_etre_rappelle"  class="oic-display_none_el">' +
								'		<div class="oic_accordion_form_agence">' +
								'			<h2> DEMANDER A ETRE<br> RAPPELE(E)</h2>' +
								'			<div id="oic_wcb_etre_rappelle_content">' +
								'				<div id="oic_wcb_li_motifs" class="oic_wcb_form_contact">' +
								'					<p>Motif de votre demande:</p>' +
								'					<select id="oic_wcb_motif" name="contact-motif" tabindex="-1" class="select2-hidden-accessible" aria-hidden="true">' +
								'						<option value=""></option>';
	
			panneauTelephone += '						<option value="' + removeDiacritics("Assurances").replace(/\W+/g, "_") + '">Assurances</option>';
	
			panneauTelephone += '						<option value="' + removeDiacritics("Crédit Immobilier").replace(/\W+/g, "_") + '">Crédit Immobilier</option>';
	
			panneauTelephone += '						<option value="' + removeDiacritics("Banque au quotidien").replace(/\W+/g, "_") + '">Banque au quotidien</option>';
	
			panneauTelephone += '						<option value="' + removeDiacritics("Epargne").replace(/\W+/g, "_") + '">Epargne</option>';
	
			panneauTelephone += '						<option value="' + removeDiacritics("Crédit à la consommation").replace(/\W+/g, "_") + '">Crédit à la consommation</option>';
	
			panneauTelephone+=	'					</select>' +
								'					<span id="spanHiddenService" class="form-error-bouton spanHidden">Veuillez séléctionner un motif</span>' +
								'					<a id="oic_wcb_lien_service" class="oic_btn_lien">ACCEDER A CE SERVICE</a>' +
								'				</div>' +
								'			</div>' +
								'		</div>' +
								'	</div>';
	
	
		panneauTelephone += 	'	<div id="oic_wcb_geoc" class="oic-display_none_el">' +
								'		<div id="oic_wcb_geoc_form">' +
								'			<p>Contacter votre agence</p>' +
								'			<form>' +
								'				<fieldset>' +
								'					<div id="oic_wcb_btn_lien_autour_de_moi"class="oic_btn_lien oic_wcb_btn_lien oic_wcb_btn_lien_autour_de_moi">AUTOUR DE MOI</div>' +
								'					<label class="oic_localisation_agence">OU</label>' +
								'					<label id="oic_wcb_localisation_agence_message_erreur" class="oic_localisation_agence_message_erreur oic-display_none_el">Localisation non autorisée<br>' +
								'					Autorisez votre navigateur<br>' +
								'					ou saisissez votre CP<br>' +
								'					ou adresse en dessous</label>' +
								'				</fieldset>' +
								'				<fieldset>' +
								'					<input type="text" id="oic_wcb_geoc_form_agence" placeholder="Adresse, CP, ville">' +
								'					<label id="oic_wcb_btn_lien_autour_de_moi_confirmation" class="oic_btn_lien oic_wcb_submit_action_form oic_wcb_btn_lien oic_wcb_btn_lien_autour_de_moi_confirmation">' +
								'						<img src="//www.ca-valdefrance.fr/Vitrine/ObjCommun/DCIV2/img/OIC/fleche_ok.png">' +
								'					</label>' +
								'			</form>' +
								'				</fieldset>' +
								'		</div>' +
								'		<div id="oic_wcb_geoc_map"  class="oic-display_none_el">' +
								'			<div id="oic_map_marker_wcb">' +
								'				<div id="oic-map_wcb"></div>' +
								'			</div>' +
								'		</div>' +
								'		<div id="oic_wcb_geoc_li_agence" class="oic_wcb_li_agence oic-display_none_el"></div>' +
								'	</div>';
	
		panneauTelephone += 	'	<div id="oic_wcb_confirm" class="oic-display_none_el">' +
								'			<h2 class="oic_mail_h2_titre_btn_fermer oic-typo_contenu_slider oic_mail_line_height">Votre demande a bien été transmise. Un conseiller du Crédit Agricole Val De France va vous contacter dans les meilleurs délais. Nous vous remercions pour votre confiance.<br/></h2>' +
								'			<a class="oic_btn_lien oic_wcb_btn_lien_Fermer oic-btn_close_contact">FERMER</a>' +
								'	</div>' +
								'</div>';
		return panneauTelephone;
	}
	/**
	 *	Génère le html relatif à l'outil prise de rendez-vous
	 */
	function construirePanneauRDV(){
		var panneauRDV = 	'<div id="oic_rdv" class="oic-display_none_el">' +
							'	<ul id="oic_rdv_ul_titre" >' +
							'		<li class="oic_rdv_li_titre_img"><img src="//www.ca-valdefrance.fr/Vitrine/ObjCommun/DCIV2/img/OIC/calendrier-01.png"></li>' +
							'		<li class="oic_rdv_li_titre">PRENDRE UN RDV</li>' +
							'	</ul>';
		if(typeof OICTOPISBAM == "undefined" || OICTOPISBAM == false){
			panneauRDV +=	'	<div id="oic_rdv_client_ca">' +
							'		<h2 class="oic_rdv_h2_titre oic-typo_contenu_slider oic_rdv_line_height">Vous êtes client<br>Crédit Agricole</h2>' +
							'		<p class="oic_rdv_h2_p oic-typo_contenu_slider">Nous vous invitons à utiliser<br>la prise de rendez-vous client</p>' +
							'		<a id="oic_acces_bam_rdv" class="oic_btn_lien oic_rdv_btn_lien_acces_compte">ACCÉDER À VOS COMPTES</a>' +
							'	</div>';
		}
		panneauRDV +=		'	<div id="oic_rdv_non_client">';
		if(typeof OICTOPISBAM == "undefined" || OICTOPISBAM == false){
			panneauRDV +=	'		<h2 class="oic_rdv_h2_titre oic-typo_contenu_slider oic_rdv_line_height">Vous n\'êtes pas client<br>Crédit Agricole</h2>';
		}
		
		panneauRDV +=		'		<div id="oic_rdv_li_motifs" class="';
		
		panneauRDV +=	'oic-display_none_el ';
		
		panneauRDV +=		'oic_form">' +
							'			<p>Veuillez indiquer le motif<br>de votre demande:</p>' +
							'				<select id="oic_rdv_adresser_rdv_agence_form" name="contact-motif" tabindex="-1" class="select2-hidden-accessible" aria-hidden="true">' +
							'					<option value="">Veuillez indiquer le motif</option>';
		var motifAutre = '';
		
			panneauRDV += "<option value=\"p-443591\">Assurance</option>";
		
			motifAutre += "<option value=\"p-443594\">Autre message</option>";
		
			panneauRDV += "<option value=\"p-443597\">Crédit conso</option>";
		
			panneauRDV += "<option value=\"p-443600\">Demande d'info</option>";
		
			panneauRDV += "<option value=\"p-443606\">Demande de RDV</option>";
		
			panneauRDV += "<option value=\"p-443603\">Epargne</option>";
		
			panneauRDV += "<option value=\"p-443609\">Réclamation</option>";
		
		panneauRDV += motifAutre;
		panneauRDV +=		'				</select>' +
							'		</div>' +
							'		<div  id="oic_rdv_motif_form" class="oic_form oic-display_none_el">' +
							'			<form id="oic-rdv-form" name="oic_rdv_autre" method="POST" novalidate="novalidate">' +
							'				<span class="oic_champ_obligatoire">* Champ obligatoire</span>' +
		
							'			   <div class="oic-rdv-form-item">' +
							'				<label>Agence<abbr class="oic-mandatory" title="Champ obligatoire">*</abbr></label>' +
							'				<input type="text" class="user-success" name="oic_rdv_1.oic_rdv_agence_1" placeholder="Agence" aria-required="true" required=""  minlength="2" maxlength="100" ></input>' +
							'			   </div>' +
		
							'				<div class="oic-rdv-form-item">' +
							'					<label>Jour<abbr class="oic-mandatory" title="Champ obligatoire">*</abbr></label><br>' +
							'					<select id="oic_rdv_jour" name="oic_rdv_1.oic_rdv_jour_1" tabindex="-1" class="select2-hidden-accessible" >' +
							'						<option value=""></option>' +
							'						<option value="Lundi">Lundi</option>' +
							'						<option value="Mardi">Mardi</option>' +
							'						<option value="Mercredi">Mercredi</option>' +
							'						<option value="Jeudi">Jeudi</option>' +
							'						<option value="Vendredi">Vendredi</option>' +
							'						<option value="Samedi">Samedi</option>' +
							'						<option value="indifférent">Indifférent</option>' +
							'					</select>' +
							'					<span id="oic_rdv_spanHiddenJour" class="form-error-bouton spanHidden">Veuillez sélectionner un jour</span>' +
							'				</div>' +
							'				<div class="oic-rdv-form-item">' +
							'					<label>Horaire<abbr class="oic-mandatory" title="Champ obligatoire">*</abbr></label><br>' +
							'					<select id="oic_rdv_horaire" name="oic_rdv_1.oic_rdv_horaire_1" tabindex="-1" class="select2-hidden-accessible">' +
							'						<option value=""></option>' +
							'						<option value="entre 08h00 et 10h00">Entre 08h00 et 10h00</option>' +
							'						<option value="entre 10h00 et 12h00">Entre 10h00 et 12h00</option>' +
							'						<option value="entre 12h00 et 14h00">Entre 12h00 et 14h00</option>' +
							'						<option value="entre 14h00 et 16h00">Entre 14h00 et 16h00</option>' +
							'						<option value="entre 16h00 et 18h00">Entre 16h00 et 18h00</option>' +
							'						<option value="entre 18h00 et 20h00">Entre 18h00 et 20h00</option>' +
							'						<option value="indifférent">Indifférent</option>' +
							'					</select>' +
							'					<span id="oic_rdv_spanHiddenHoraire" class="form-error-bouton spanHidden">Veuillez séléctionner un horaire</span>' +
							'				</div>' +
							'			   <div class="oic-rdv-form-item">' +
							'					<label>Civilité<abbr class="oic-mandatory" title="Champ obligatoire">*</abbr></label><br>' +
							'					<input id="oic_rdv_civilite_m" class="user-success" type="radio" name="oic_rdv_1.oic_rdv_civilite_1" value="M" />' +
							'					<label for="oic_rdv_civilite_m" class="oic_wcb_label">M</label>' +
							'					<input id="oic_rdv_civilite_mme" class="user-success" type="radio" name="oic_rdv_1.oic_rdv_civilite_1" value="Mme"></input>' +
							'					<label for="oic_rdv_civilite_mme" class="oic_rdv_label">Mme</label><br>' +
							'					<span id="oic_rdv_spanHiddenCivilite" class="form-error-bouton spanHidden">Veuillez saisir la civilité</span>' +
							'			   </div>' +
							'			   <div class="oic-rdv-form-item">' +
							'				<label>Prénom<abbr class="oic-mandatory" title="Champ obligatoire">*</abbr></label>' +
							'				<input type="text" class="user-success" name="oic_rdv_1.oic_rdv_prenom_1" placeholder="Votre prénom" aria-required="true" required=""  minlength="2" maxlength="100" ></input>' +
							'			   </div>' +
							'			   <div class="oic-rdv-form-item">' +
							'				<label>Nom<abbr class="oic-mandatory" title="Champ obligatoire">*</abbr></label>' +
							'				<input type="text" class="user-success" name="oic_rdv_1.oic_rdv_nom_1" placeholder="Votre nom" aria-required="true" required=""  minlength="2" maxlength="100" ></input>' +
							'			   </div>' +
							'			   <div class="oic-rdv-form-item">' +
							'				<label>Date de naissance<abbr class="oic-mandatory" title="Champ obligatoire">*</abbr></label>' +
							'				<input type="text" class="user-success" data-validation="date" name="oic_rdv_1.oic_rdv_date_naissance_1" placeholder="Format JJ/MM/AAAA"  aria-required="true" required="" maxlength="10"></input>' +
							'			   </div>' +
							'			   <div class="oic-rdv-form-item">' +
							'					<label>Email<abbr class="oic-mandatory" title="Champ obligatoire">*</abbr></label>' +
							'					<input class="user-success" type="text" name="oic_rdv_1.oic_rdv_email_1" placeholder="adresse@email.com" aria-required="true" maxlength="100"></input>' +
							'			   </div>' +
							'			   <div class="oic-rdv-form-item">' +
							'				<label>Téléphone<abbr class="oic-mandatory" title="Champ obligatoire">*</abbr></label>' +
							'				<input type="text" class="user-success" id="form_contact_rdv_telephone" name="oic_rdv_1.oic_rdv_telephone_1" placeholder="Votre téléphone" aria-required="true" required="" minlength="10" maxlength="10"></input>' +
							'			   </div>' +
							'			   <div class="oic-rdv-form-item">' +
							'					<input name="oic_rdv_1.routAg-id_eds_agence_1" type="hidden"></input>' +
							'			   </div>' +
							'			   <div class="oic-rdv-form-item">' +
							'					<input name="oic_rdv_1.oic_agence_choisie_1" type="hidden"></input>' +
							'			   </div>' +
							'			   <div id="oic-rdv-captcha" class="oic-rdv-form-item"></div>' +
							'			   <div class="oic-rdv-form-item">' +
							'				<input id="oic_rdv_affichage_mentions_CNIL" type="checkbox" name="CNIL" class="inpCheckbox user-success"/>' +
							'				<label for="oic_rdv_affichage_mentions_CNIL" >Je certifie avoir pris connaissance des <a id="oic-rdv-lien-cnil" href ="#oic_rdv_mentions_CNIL">mentions CNIL</a></label>' +
							'				<span id="oic_rdv_spanHiddenCnil" class="form-error-bouton spanHidden">Veuillez cocher les mentions CNIL</span>' +
							'			   </div>' +
							'			   <div class="oic-rdv-form-item">' +
							'				<input type="submit" value="ENVOYER" class="button-normal-submit" >' +
							'			   </div>' +
							'			</form>' +
							'		</div>' +
							'		<div id="oic_rdv_mentions_CNIL" class="oic-display_none_el oic_mentions_CNIL">' +
							'			<p>Conformément à l\'article 32 de la loi « Informatique et Libertés » du 6 janvier 1978, nous vous informons que la communication des données à caractère personnel indiquée par un astérisque est obligatoire. Le défaut de communication de ces données aura pour seule conséquence de ne pas nous permettre de prendre en compte votre demande de prise de contact. Nous vous informons que la Caisse Régionale de Crédit Agricole Val de France (ci-après « la Banque ») est le responsable du traitement et que les données à caractère personnel qui seront collectées pourront faire l\'objet d\'un traitement automatisé ou non pour les finalités suivantes : prise de contact, connaissance du client, gestion de la relation bancaire et financière, prospection et animation commerciale, étude statistique. Vos opérations et vos données à caractère personnel sont couvertes par le secret professionnel auquel nous sommes tenus. Toutefois, vous autorisez expressément la Banque à communiquer ces données (nom, adresse, numéro de téléphone, email) à : - toute entité du Groupe Crédit Agricole à des fins de prospection commerciale ou en cas de mise en commun de moyens ou de regroupement de sociétés; - nos sous-traitants pour les seuls besoins de la sous-traitance; - à nos partenaires pour vous permettre de bénéficier des avantages de ces partenariats; - à des instituts d\'enquêtes ou de sondages, agissant pour le compte de la Banque ou du Groupe Crédit Agricole, à des fins statistiques, sachant que vous n\'êtes pas tenu de répondre à leurs sollicitations et que vos données seront détruites après traitement. En outre, pour satisfaire aux obligations légales et réglementaires, la Banque peut être tenue de communiquer ces informations à des autorités judiciaires ou administratives légalement habilitées. La liste des entités du Groupe Crédit Agricole susceptibles d\'être bénéficiaires d\'informations vous concernant pourra vous être communiquée sur simple demande de votre part à l\'adresse suivante: Crédit Agricole Val de France - CS 50069 - 28008 CHARTRES Cedex. Vous pouvez, à tout moment, conformément à la loi, accéder aux informations vous concernant, les faire rectifier, vous opposer à leur traitement pour motif légitime, à leur communication à des tiers ou à leur utilisation à des fins commerciales, en écrivant par lettre simple à l\'adresse suivante Crédit Agricole Val de France - CS 50069 - 28008 CHARTRES Cedex. Les frais de timbre consécutifs à l\'exercice de votre droit d\'opposition à l\'utilisation de vos données à des fins de prospection seront remboursés par simple demande de votre part.<br/></p>' +
							'		</div>' +
							'		<div id="oic_rdv_confirm" class="oic-display_none_el">' +
							'			<h2 class="oic_rdv_h2_titre_btn_fermer oic-typo_contenu_slider oic_rdv_line_height">Votre demande de prise de rendez-vous a été envoyée.<br/>Nous vous remercions pour votre confiance.<br/></h2>' +
							'			<a class="oic_btn_lien oic_rdv_btn_lien_Fermer oic-btn_close_contact">FERMER</a>' +
							'		</div>' +
							'	</div>' +
							'</div>';
		return panneauRDV;
	}
	/**
	 *	Génère le html relatif à l'outil SOS
	 */
	function construirePanneauSOS(){
		var panneauSOS =	'<div id="oic_sos" class="oic-display_none_el">' +
							'	<ul id="oic_sos_ul_titre">' +
							'		<li class="oic_sos_li_titre_img"><img src="//www.ca-valdefrance.fr/Vitrine/ObjCommun/DCI/img/OIC/sos-01.png"/></li>' +
							'		<li class="oic_sos_li_titre">SOS NUM&Eacute;RO <br/> D\'URGENCE</li>' +
							'		<div id="oic_sos_bloc_tel">';
		
		
		panneauSOS += 		'			<span class="oic_sos_tel">09 69 39 92 91</span>' +
							'			<span class="oic_prix_appel_local">Appel non surtaxé, tarifs selon opérateur (depuis la france et l\'étranger)</span>' +
							'		</div>' +
							'		<div class="oic_sos_texte">' +
							'			<h2 class="oic_sos_h2_titre">Perte, vol, utilisation frauduleuse de votre carte,<br>opposition sur un chèque ou un chèquier,<br>dépannage Cash à l\'étranger<br/></h2>' +
							'			' +
							'			'+
							'			<p>Une autre urgence ?<br/>';
		









		
		if(typeof OICTOPISBAM == "undefined" || OICTOPISBAM == false){
			panneauSOS += 	'				<a class=\'oic_btn_lien\'  onclick="trackingClickTag(\'Numero SOS – Tous nos services\')" href="/Vitrine/ObjCommun/Fic/ValDeFrance/DCIv3/template/parcours/NumerosUrgences.html" title="En savoir plus" onclick="xiti_clic(\'N\', \'lien OIC numeros urgences\', \'/Vitrine/ObjCommun/Fic/ValDeFrance/DCIv3/template/parcours/NumerosUrgences.html\', false);return false;">TOUS NOS SERVICES SOS</a>';
		}else if(typeof OICTOPISBAM != "undefined" && OICTOPISBAM == true){
			panneauSOS += 	'				<a class="oic_btn_lien" href="javascript:lancerContenu(\'tcm-1363-185300\',\'global\')" onclick="trackingClickTag(\'Numero SOS – Tous nos services\')">TOUS NOS SERVICE SOS</a>';
		}
		panneauSOS += 		'</p>' +
							'		</div>' +
							'	</ul>' +
							'</div>';
		return panneauSOS;
	}
	// quand on est dans la vitrine
	if(typeof OICTOPISBAM == "undefined" || OICTOPISBAM == false){
	
		if(Xt_marche =="particuliers" ||Xt_marche =="professionnels" ||Xt_marche =="agriculteurs" ||Xt_marche =="collectivites" ||Xt_marche =="associations" ||Xt_marche == "tout marché"){
	
			var oicV =	'<span id="oic-btn-rond-mobile" class="">' +
						'	<img src="//www.ca-valdefrance.fr/Vitrine/ObjCommun/DCI/img/OIC/bulle-01.png">' +
						'</span>' +
						'<div id="oic-container" class="oic-typo_menu_slider" x-ms-format-detection="none">';
			var menuV = '<div id="oic-menu_Slider_btn_vert">' +
						'	<ul id="oic-ul_menu_Slider_btn_vert" class="oic_black_background">' +
						'		<li id="oic-bulle-verte" class="oic-bulle-verte oic-MB_li oic-menu_btn_vert_li oic-li_First_btn_vert_menu oic-typo_menu_slider_titre">' +
						'			<span><img id="oic-bulle-original" class="oic-display_none_el" src="//www.ca-valdefrance.fr/Vitrine/ObjCommun/DCI/img/OIC/bulle-01.png"></span>' +
						'			<span id="oic-grande-bulle">' + bonjourOuBonsoir() + '</span>' +
						'		</li>';
			var contenuV = 	'<div id="oic-contenu_Slider_btn_vert">' +
							'		<div id="oic-container_close_1" class="oic-container_close oic-display_none_el">' +
							'			<span id="oic-btn_close_contact_1" class="oic-btn_close_contact">X</span>'+
							'		</div>' +
							'	<div id="oic_contenu_nav">' +
							'	<ul id="oic-ul_contenu_Slider_btn_vert" class="oic-MB_ul oic-active-contenu-mail">' +
							'		<li class="oic-typo_contenu_slider_titre oic-contenu_btn_vert_li oic-li_First_btn_vert_contenu"><span class="">Besoin d\'aide ?</span></li>';
			var panneauMail = "";
		var menuTel = "", contenuTel = "", menuChat = "", contenuChat = "", menuRDV = "", contenuRDV = "", menuMail = "", contenuMail = "", menuSOS = "", contenuSOS = "";
		
			/* OUTIL MAIL*/
			menuMail += '<li id="oic-mail_contact" class="oic-MB_li oic-menu_btn_vert_li oic-mail_contact"><span>Nous contacter par email</span></li>';
			contenuMail += '<li class="oic-mail_contact oic-typo_contenu_slider oic-contenu_btn_vert_li"><span class="">Nous contacter par email</span></li>';
		
			/* Outil Rendez-vous (RDV) */
			menuRDV += '<li id="oic-rdv_contact" class="oic-MB_li oic-menu_btn_vert_li oic-rdv_contact"><span>Prendre un RDV</span></li>';
			contenuRDV += '<li class="oic-rdv_contact oic-typo_contenu_slider oic-contenu_btn_vert_li"><span class="">Prendre un RDV</span></li>';
		
			/* Outil Services SOS */
			menuSOS += '<li id="oic-sos_contact" class="oic-MB_li oic-menu_btn_vert_li oic-sos_contact"><span>Services SOS</span></li>';
			contenuSOS += '<li class="oic-sos_contact oic-typo_contenu_slider oic-contenu_btn_vert_li"><span><span class="">Services SOS</span></li>';
		
			menuTel += '<li id="oic-tel_contact" class="oic-MB_li oic-menu_btn_vert_li oic-tel_contact"><span>Nous appeler, ou être rappelé(e)</span></li>';
			contenuTel += '<li class="oic-tel_contact oic-typo_contenu_slider oic-contenu_btn_vert_li clearboth"><span class="">Nous appeler, ou être rappelé(e)</span></li>';
		
			menuV += menuTel + menuChat + menuMail + menuRDV + menuSOS +'</ul></div>';
			contenuV += contenuTel + contenuChat + contenuMail + contenuRDV + contenuSOS + '</ul></div></div>';
			oicV += menuV + contenuV + 	'<div id="oic-main_Slider_btn_vert">' +
										'	<div id="oic-container_close_2" class="oic-container_close oic-display_none_el">' +
										'		<span id="oic-btn_close_contact_2" class="oic-btn_close_contact">X</span>'+
										'	</div><div id="oic_canaux">' + construireFormDecloisement() +
		
											construirePanneauMail() +
		
											construirePanneauRDV() +
		
											construirePanneauSOS() +
		
											construirePanneauTelephone(false) +
		
										'</div></div></div>';
			// ajout de la feuille de style de l'oic
			jQueryOIC('head').append('<link type="text/css" rel="stylesheet" media="all" href="/Vitrine/ObjCommun/DCIV2/css/v_16_1/select2.min.css">');
			jQueryOIC('head').append('<link type="text/css" rel="stylesheet" media="all" href="/Vitrine/ObjCommun/DCIV2/css/OIC/oic-style.css">');
			// ajout de l'oic à la page
			jQueryOIC('#oic-container').remove();
			jQueryOIC('body').append(oicV);
			jQueryOIC('body').append('<script defer async type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAsvSnZtKpWfG-W2iAb7-ahQluJQrVy0Wc&signed_in=false&callback=initMap&libraries=places"></script>');
			// récupération des pictos paramétrés par le CMS
			insererPictos();
		
		}
	}
	/* quand on est dans la BAM et qu'on a le droit d'afficher le bouton vert */
	else if( typeof OICTOPISBAM != "undefined" && typeof OICTOPBV != "undefined" && OICTOPISBAM == true && OICTOPBV == true){
		var isIE = /*@cc_on!@*/false || !!document.documentMode;
		/* pour les navigateurs autres que IE, on affiche l'OIC dans la BAM => 25/10/16 : plus utile suite à modif BAM*/
		// if(!isIE){
		
			var oicB =	'<span id="oic-btn-rond-mobile" class="">' +
						'	<img src="//www.ca-valdefrance.fr/Vitrine/ObjCommun/DCI/img/OIC/bulle-01-mobile.png">' +
						'</span>' +
						'<div id="oic-container" class="oic-typo_menu_slider" x-ms-format-detection="none">';
			var menuB = 	'	<div id="oic-menu_Slider_btn_vert">'+
							'		<ul id="oic-ul_menu_Slider_btn_vert" class="oic_black_background">' +
							'		<li id="oic-bulle-verte" class="oic-bulle-verte oic-MB_li oic-menu_btn_vert_li oic-li_First_btn_vert_menu oic-typo_menu_slider_titre">' +
							'			<span><img id="oic-bulle-original" class="oic-display_none_el" src="//www.ca-valdefrance.fr/Vitrine/ObjCommun/DCI/img/OIC/bulle-01.png"></span>' +
							'			<span id="oic-grande-bulle">Bienvenue</span>' +
							'		</li>';
			var contenuB = 	'	<div id="oic-contenu_Slider_btn_vert">'  +
							'		<div id="oic-container_close_1" class="oic-container_close oic-display_none_el">' +
							'			<span id="oic-btn_close_contact_1" class="oic-btn_close_contact">X</span>'+
							'		</div>' +
							'		<div id="oic_contenu_nav">'+
							'		<ul id="oic-ul_contenu_Slider_btn_vert" class="oic-MB_ul oic-active-contenu-mail">' +
							'			<li class=" oic-typo_contenu_slider_titre oic-contenu_btn_vert_li oic-li_First_btn_vert_contenu"><span class="">Besoin d\'aide ?</span></li>';
			var menuTelB = "", contenuTelB = "", menuChatB = "", contenuChatB = "", menuRDVB = "", contenuRDVB = "", menuMailB = "", contenuMailB = "", menuSOSB = "", contenuSOSB = "";
		
				/* OUTIL MAIL*/
				if(typeof OICTOPCANALMAIL != "undefined" && OICTOPCANALMAIL == true){
					menuMailB += '<li id="oic-mail_contact" class="oic-MB_li oic-menu_btn_vert_li oic-mail_contact"><span>Nous contacter par email</span></li>';
					contenuMailB += '<li class="oic-mail_contact oic-typo_contenu_slider oic-contenu_btn_vert_li"><span class="">Nous contacter par email</span></li>';
				}
		
				/* Outil Rendez-vous (RDV) */
				if(typeof OICTOPCANALRDV != "undefined" && OICTOPCANALRDV == true){
					menuRDVB += '<li id="oic-rdv_contact" class="oic-MB_li oic-menu_btn_vert_li oic-rdv_contact"><span>Prendre un RDV</span></li>';
					contenuRDVB += '<li class="oic-rdv_contact oic-typo_contenu_slider oic-contenu_btn_vert_li"><span class="">Prendre un RDV</span></li>';
				}
		
				if(typeof OICTOPCANALSOS != "undefined" && OICTOPCANALSOS == true){
					/* Outil Services SOS */
					menuSOSB += '<li id="oic-sos_contact" class="oic-MB_li oic-menu_btn_vert_li oic-sos_contact"><span>Services SOS</span></li>';
					contenuSOSB += '<li class="oic-sos_contact oic-typo_contenu_slider oic-contenu_btn_vert_li"><span><span class="">Services SOS</span></li>';
				}
		
				if(typeof OICTOPCANALTEL != "undefined" && OICTOPCANALTEL == true){
					menuTelB += '<li id="oic-tel_contact" class="oic-MB_li oic-menu_btn_vert_li oic-tel_contact"><span>Nous appeler, ou être rappelé(e)</span></li>';
					contenuTelB += '<li class="oic-tel_contact oic-typo_contenu_slider oic-contenu_btn_vert_li clearboth"><span class="">Nous appeler, ou être rappelé(e)</span></li>';
				}
		
			menuB += menuTelB + menuChatB + menuMailB + menuRDVB + menuSOSB +'</ul></div>';
			contenuB += contenuTelB + contenuChatB + contenuMailB + contenuRDVB + contenuSOSB + '</ul></div></div>';
			oicB += menuB + contenuB + '<div id="oic-main_Slider_btn_vert">' +
										'	<div id="oic-container_close_2" class="oic-container_close oic-display_none_el">' +
										'		<span id="oic-btn_close_contact_2" class="oic-btn_close_contact">X</span>'+
										'	</div><div id="oic_canaux">';
			if(typeof OICTOPMAILSECU == "undefined" || OICTOPMAILSECU == false){
				oicB += construirePanneauMail();
			}
			if(typeof OICTOPCANALTEL != "undefined" && OICTOPCANALTEL == true){
				oicB += construirePanneauTelephone(true);
			}
			if(typeof OICTOPTCANALCHAT != "undefined" && OICTOPTCANALCHAT == true){
				oicB += construirePanneauChat();
			}
			if(typeof OICTOPCANALRDV != "undefined" && OICTOPCANALRDV == true){
				oicB += construirePanneauRDV();
			}
			if(typeof OICTOPCANALSOS != "undefined" && OICTOPCANALSOS == true){
				oicB += construirePanneauSOS();
			}
			oicB += '</div></div></div>';
			jQueryOIC('head').append('<link type="text/css" rel="stylesheet" media="all" href="//www.ca-valdefrance.fr/Vitrine/ObjCommun/DCIV2/css/v_16_1/select2.min.css">');
			jQueryOIC('head').append('<link type="text/css" rel="stylesheet" media="all" href="//www.ca-valdefrance.fr/Vitrine/ObjCommun/DCIV2/css/OIC/oic-style.css">');
			// ajout de l'oic à la page
			jQueryOIC('#oic-container').remove();
			jQueryOIC('body').append(oicB);
			jQueryOIC('body').append('<script defer async type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAsvSnZtKpWfG-W2iAb7-ahQluJQrVy0Wc&signed_in=false&callback=initMap&libraries=places"></script>');
			if(typeof OICTOPCANALTEL != "undefined" && OICTOPCANALTEL == true){
				if(typeof OICIDAGENCE != "undefined" && OICIDAGENCE != null){
					rechercheAgenceParId(OICIDAGENCE);
				}
				if(jQueryOIC('input[name="oic_telephone_1.oic_telephone_identite_1"]').length){
					if(typeof OICLIBCLIENT != "undefined" && OICLIBCLIENT != null){
						jQueryOIC('input[name="oic_telephone_1.oic_telephone_identite_1"]').val(OICLIBCLIENT);
					}else{
						jQueryOIC('input[name="oic_telephone_1.oic_telephone_identite_1"]').val("Libellé client non renseigné");
					}
				}
				if(jQueryOIC('input[name="oic_telephone_1.oic_telephone_date_naissance_1"]').length){
					if(typeof OICTOPDATENAISSANCE != "undefined" && OICTOPDATENAISSANCE != null){
						jQueryOIC('input[name="oic_telephone_1.oic_telephone_date_naissance_1"]').val(bamDateFormatToFrFormat(OICTOPDATENAISSANCE));
					}else{
						jQueryOIC('input[name="oic_telephone_1.oic_telephone_date_naissance_1"]').val('01/01/1901');
					}
				}
			}
			// récupération des pictos paramétrés par le CMS
			insererPictos();
		
		//} // fin: if IE
	} // fin: if BAM
	/* ****************************************************************************
	 *	Début: Fonctions d'utilité générale
	 **************************************************************************** */
	/**
	 *	Convertit une date du format BAM(AAAAMMJJ) vers le format Fr (JJ/MM/AAAA)
	 *	@param date: date au format BAM
	 *	@return		date au format Fr
	 */
	function bamDateFormatToFrFormat(date){
		var strDate = new String(date);
		return strDate.substring(6, 8) + '/' + strDate.substring(4, 6) + '/' + strDate.substring(0, 4);
	 }
	/**
	 *	Récupére les pictogrammes paramétrés dans le CMS pour les afficher
	 */
	function insererPictos(){
		jQueryOIC('#oic-mail_contact').css('background', 'url("//www.ca-valdefrance.fr/Vitrine/Obj/bandeau_mail_01_tcm_866_443528.png") no-repeat');
		jQueryOIC('#oic-rdv_contact').css('background', 'url("//www.ca-valdefrance.fr/Vitrine/Obj/bandeau_calendrier_01_tcm_866_443529.png") no-repeat');
		jQueryOIC('#oic-sos_contact').css('background', 'url("//www.ca-valdefrance.fr/Vitrine/Obj/bandeau_sos_01_tcm_866_443530.png") no-repeat');
		jQueryOIC('#oic-tel_contact').css('background', 'url("//www.ca-valdefrance.fr/Vitrine/Obj/bandeau_telephone_01_tcm_866_443527.png") no-repeat');
		jQueryOIC('#oic-tel_chat').css('background', 'url("//www.ca-valdefrance.fr/Vitrine/Obj/bandeau_discution_01_tcm_866_443525.png") no-repeat');
		if(!horairesTel.outilDispoAujourdhui()){
			jQueryOIC("#oic-tel_contact").css("background-position","-80px 0px");
		}
		if(!horairesChat.outilDispoAujourdhui()) {
			jQueryOIC("#oic-tel_chat").css("background-position","-80px 0px");
		}
		jQueryOIC('#oic-container p, #oic-container span, #oic-container label, #oic-container ul, #oic-container ol, #oic-container dl, #oic-container blockquote, #oic-container fieldset, #oic-container table').css('list-style', 'none');
	}
	/**
	 *	Retourne "Bonjour" ou "Bonsoir" par rapport à l'heure de visite du client
	 *	@return	"Bonjour" entre 1h et 17h et "Bonsoir" entre 17h et 1h
	 */
	function bonjourOuBonsoir(){
		var borneInf = new Date().setHours(1, 0, 0, 0);
		var borneSup = new Date().setHours(17, 0, 0, 0);
		var maintenant = new Date().setHours(new Date().getHours(), new Date().getMinutes(), 0, 0);
		if( maintenant > borneInf && maintenant < borneSup){
			return "Bonjour";
		} else {
			return "Bonsoir";
		}
	}
	/**
	 *	Initialise les listes déroulantes créées à partir du plugin select2
	 */
	function initSelect2(){
		if(jQueryOIC("#oic_mail_adresser_mail_agence_form").length){
			jQueryOIC("#oic_mail_adresser_mail_agence_form").select2({
				  placeholder: "Veuillez indiquer le motif",
				  minimumResultsForSearch: -1,
				  theme: "classic"
			});
			jQueryOIC('#select2-oic_mail_adresser_mail_agence_form-container').css("color", "#666");
		}
		if(jQueryOIC("#oic_wcb_motif").length){
			jQueryOIC("#oic_wcb_motif").select2({
				placeholder: "Indiquez le motif",
				minimumResultsForSearch: -1,
				theme: "classic"
			});
			jQueryOIC('#select2-oic_wcb_motif_form-container').css("color", "#666");
		}
		if(jQueryOIC("#oic_wcb_horaire").length){
			jQueryOIC("#oic_wcb_horaire").select2({
				placeholder: "Tranche horaire",
				minimumResultsForSearch: -1,
				theme: "classic"
			});
			jQueryOIC('#select2-oic_wcb_horaire_form-container').css("color", "#666");
		}
		if(jQueryOIC("#oic_wcb_jour").length){
			jQueryOIC("#oic_wcb_jour").select2({
				placeholder: "Jour",
				minimumResultsForSearch: -1,
				theme: "classic"
			});
			jQueryOIC('#select2-oic_wcb_jour_form-container').css("color", "#666");
		}
		if(jQueryOIC("#oic_rdv_jour").length){
			jQueryOIC("#oic_rdv_jour").select2({
				placeholder: "Jour",
				minimumResultsForSearch: -1,
				theme: "classic"
			});
			jQueryOIC('#select2-oic_rdv_jour_form-container').css("color", "#666");
		}
		if(jQueryOIC("#oic_rdv_horaire").length){
			jQueryOIC("#oic_rdv_horaire").select2({
				placeholder: "Tranche horaire",
				minimumResultsForSearch: -1,
				theme: "classic"
			});
			jQueryOIC('#select2-oic_rdv_horaire_form-container').css("color", "#666");
		}
		if(jQueryOIC("#oic_rdv_adresser_rdv_agence_form").length){
			jQueryOIC("#oic_rdv_adresser_rdv_agence_form").select2({
				  placeholder: "Veuillez indiquer le motif",
				  minimumResultsForSearch: -1,
				  theme: "classic"
			});
			jQueryOIC('#select2-oic_rdv_adresser_rdv_agence_form-container').css("color", "#666");
		}
		jQueryOIC('#oic-container .select2-selection__placeholder').css("color", "#666");
	}
	/**
	 *	Créer un cookie qui reste actif tant que le navigateur n'est pas fermé
	 *	@param	cname Nom du cookie
	 *	@param	cvalue Valeur du cookie
	 */
	function setCookie(cname,cvalue) {
		document.cookie = cname+"="+cvalue;
	}
	/**
	 *	Récupère un cookie à partir de son nom
	 *	@param	cname nom du cookie à recupérer
	 *	@return le cookie ayant le nom recherché
	 */
	function getCookie(cname) {
		var name = cname + "=";
		var ca = document.cookie.split(';');
		for(var i=0; i<ca.length; i++) {
			var c = ca[i];
			while (c.charAt(0)==' ') c = c.substring(1);
			if (c.indexOf(name) == 0) {
				return c.substring(name.length, c.length);
			}
		}
		return "";
	}
	/**
	 *	Vérifie si le cookie du bouton vert est présent,
	 *	S'il est présent, on affiche la petite bulle verte
	 *  sinon on crée le cookie
	 */
	function checkCookie() {
		var user=getCookie("oic-client");
		if (user == "oui") {
			jQueryOIC('#oic-bulle-original').removeClass("oic-display_none_el");
			jQueryOIC("#oic-grande-bulle").addClass("oic-display_none_el");
		} else {
			setCookie("oic-client", "oui");
		}
	}
	checkCookie();
	/* ****************************************************************************
	 *	Fin : Fonctions d'utilité générale
	 **************************************************************************** */
	/* ****************************************************************************
	 * Début: Fonctions de recherche d'agence
	 **************************************************************************** */
	/**
	 *	Recherche une agence à partir de son IDSI et génère le bloc html relatif à l'agence (canal téléphone / BAM)
	 *	@param	idAgence : IDSI de l'agence à rechercher
	 */
	function rechercheAgenceParId(idAgence){
		jQueryOIC.ajax({
			type:'get',
			headers:{'Origin': "//www.ca-valdefrance.fr",  "Content-Type":"text/plain"},
			url: "//www.ca-valdefrance.fr/Vitrine/ModExt/FO/WS/Agence/WSAgenceIDSI.jsp",
			data: {"idsi": encodeURIComponent(idAgence),"oic":"true"},
			success: function(result){
				var horaireAgenceWCB = new Horaire(
					jQueryOIC(result).find("horaires").find("lundi").text().replace("(1)",""),
					jQueryOIC(result).find("horaires").find("mardi").text().replace("(1)",""),
					jQueryOIC(result).find("horaires").find("mercredi").text().replace("(1)",""),
					jQueryOIC(result).find("horaires").find("jeudi").text().replace("(1)",""),
					jQueryOIC(result).find("horaires").find("vendredi").text().replace("(1)",""),
					jQueryOIC(result).find("horaires").find("samedi").text().replace("(1)",""),
					jQueryOIC(result).find("horaires").find("dimanche").text().replace("(1)","")
				);
				var divAgenceWCB = 		'		<p> Appelez-nous directement</p>' +
										'		<div id="oic_wcb_bloc_tel">' +
										'			<span class="oic_wcb_libelle">Votre agence</span>' +
										'			<span class="oic_wcb_tel">' + jQueryOIC(result).find("telephone").text() +'</span>' +
										'			<span class="oic_prix_appel_local">Prix d\'un appel local</span>' +
										'			<h3 class="oic_wcb_label_horaire oic_agence_open oic_agence_open_end">HORAIRES D\'OUVERTURE</h3>' +
										'			<ul class="oic_horaire_agence">';
				if(horaireAgenceWCB.lundi != "fermé"){
					divAgenceWCB +=		'				<li><span>Lun</span><span>' + horaireAgenceWCB.lundi +'</span></li>';
				}
				if(horaireAgenceWCB.mardi != "fermé"){
					divAgenceWCB +=		'				<li><span>Mar</span><span>' + horaireAgenceWCB.mardi +'</span></li>';
				}
				if(horaireAgenceWCB.mercredi != "fermé"){
					divAgenceWCB +=		'				<li><span>Mer</span><span>' + horaireAgenceWCB.mercredi +'</span></li>';
				}
				if(horaireAgenceWCB.jeudi != "fermé"){
					divAgenceWCB +=		'				<li><span>Jeu</span><span>' + horaireAgenceWCB.jeudi +'</span></li>';
				}
				if(horaireAgenceWCB.vendredi != "fermé"){
					divAgenceWCB +=		'				<li><span>Ven</span><span>' + horaireAgenceWCB.vendredi +'</span></li>';
				}
				if(horaireAgenceWCB.samedi != "fermé"){
					divAgenceWCB +=		'				<li><span>Sam</span><span>' + horaireAgenceWCB.samedi +'</span></li>';
				}
				if(horaireAgenceWCB.dimanche != "fermé"){
					divAgenceWCB +=		'				<li><span>Dim</span><span>' + horaireAgenceWCB.dimanche +'</span></li>';
				}
				divAgenceWCB +=			'			</ul>' +
										'		</div>';
				jQueryOIC('#oic_wcb_appelez_nous').empty();
				jQueryOIC('#oic_wcb_appelez_nous').append(divAgenceWCB);
				jQueryOIC('#oic_wcb_jour').empty();
				jQueryOIC('#oic_wcb_jour').append(horaireAgenceWCB.genererOptionJoursOuverts());
				 jQueryOIC("#oic_wcb_jour").on("change", function (e) {
					if(jQueryOIC('#oic_wcb_jour').select2('data')[0].text != "" && jQueryOIC('#oic_wcb_jour').select2('data')[0].text != "Indifférent"){
						jQueryOIC('#oic_wcb_horaire').empty();
						jQueryOIC('#oic_wcb_horaire').append(horaireAgenceWCB.genererTranchesHorairesPourLeJour(jours.indexOf(jQueryOIC('#oic_wcb_jour').select2('data')[0].text)));
					}else{
						jQueryOIC('#oic_wcb_horaire').empty();
						jQueryOIC('#oic_wcb_horaire').append(horaireAgenceWCB.genererTranchesHorairesParDefaut());
					}
					jQueryOIC('#oic_wcb_spanHiddenHoraire').addClass("spanHidden");
					jQueryOIC("#oic_wcb_horaire").select2({
						placeholder: "Tranche horaire",
						minimumResultsForSearch: -1,
						theme: "classic"
					});
				});
			}
		});
	}
	/**
	 *	Recherche les agences les plus proches de l'adresse passée en argument et génère le code html représentant les résultats (outil mail)
	 *	@param adresse: string,	adresse à partir de laquelle est appellé le web service de recherche d'agence
	 */
	function rechercheAgences(adresse){
		jQueryOIC.ajax({
			type:'get',
			headers:{'Origin': "//www.ca-valdefrance.fr",  "Content-Type":"text/plain"},
			url: "//www.ca-valdefrance.fr/web-service/getNearestBranchList",
			data: {"address": removeDiacritics(adresse),"useIDCR":"false", "oic": "true"},
			success: function(result){
				for(var i=0; i < markers.length; i++){
					markers[i].setMap(null);
				}
				markers = [];
				jQueryOIC("#oic_mail_btn_lien_autour_de_moi").removeClass("oic_mail_contour_rouge");
				jQueryOIC("#oic_localisation_agence_message_erreur").addClass("oic-display_none_el");
				jQueryOIC("#oic_mail_geoc_map").removeClass("oic-display_none_el");
				jQueryOIC("#oic_mail_geoc_li_agence").removeClass("oic-display_none_el");
				var listeAgences = 	'<ul>' +
									'	<li class="oic_mail_liste_agence_titre">' +
									'		<span class="oic_mail_agence_proximite">'+
										jQueryOIC('#oic_mail_geoc_form_agence').val().toUpperCase() + ' ('+ jQueryOIC(result).find("nearestBranchList").attr("nb") +
									' AGENCE';
				if(jQueryOIC(result).find("nearestBranchList").attr("nb") > 1 ) listeAgences += "S";
					listeAgences +=		' À PROXIMITÉ)</span></li>';
				var tmpAgence = null;
				var tableauAgences = [];
				// on parse le résultat du webservice afin de créer le html des blocs contenant les informations des agences
				jQueryOIC(result).find("branch").each(function(){
					tmpAgence = new Agence(
						jQueryOIC(this).attr("idsiagence"),
						jQueryOIC(this).find("name").text(),
						jQueryOIC(this).find("address").find("streetname").text(),
						jQueryOIC(this).find("address").find("zipcode").text(),
						jQueryOIC(this).find("address").find("city").text(),
						jQueryOIC(this).find("email").text(),
						null,
						jQueryOIC(this).find("geocode").find("lng").text(),
						jQueryOIC(this).find("geocode").find("lat").text(),
						null
					);
					tableauAgences.push(tmpAgence);
					listeAgences += '		<li class="oic_mail_liste_agence"><h2>' + tmpAgence.nom + '</h2>' +
									'			<span class="oic_mail_label_adress">' + tmpAgence.adresse + '</span>' +
									'			<span class="oic_mail_label_cp">' + tmpAgence.codepostal +" " + tmpAgence.ville + '</span>' +
									'	  	</li>';
					// positionnement des marqueurs sur la carte
					var marker = new google.maps.Marker({
						position: {lat: parseFloat(tmpAgence.lat), lng: parseFloat(tmpAgence.lng)},
						map: map,
						title: tmpAgence.nom,
						icon: '//www.ca-valdefrance.fr/Vitrine/ObjCommun/DCIV2/img/OIC/localisation_vert_50_50.png'
					});
					markers.push(marker);
				});
				listeAgences +=		'	</ul>';
				google.maps.event.trigger(map, 'resize');
				var bounds = new google.maps.LatLngBounds();
				for (var i = 0; i < markers.length; i++) {
				 bounds.extend(markers[i].getPosition());
				}
				map.fitBounds(bounds);
				jQueryOIC('#oic_mail_geoc_li_agence').empty();
				jQueryOIC('#oic_mail_geoc_li_agence').append(listeAgences);
				jQueryOIC(".oic_mail_liste_agence:not(.oic_mail_li_end)").click(function(){
					jQueryOIC('input[name="oic_mail_1.routAg-id_eds_agence_1"]').val(tableauAgences[jQueryOIC(this).index() - 1].id);
					jQueryOIC('#oic_mail_geoc').addClass("oic-display_none_el");
					jQueryOIC('#oic_mail_adresser_message_agence_particulier').addClass("oic-display_none_el");
					jQueryOIC("#oic_mail_li_motifs").removeClass("oic-display_none_el");
					jQueryOIC("#oic_mail_adresse_agence").removeClass("oic-display_none_el");
					// récupération des informations sur l'agence selectionnée
					jQueryOIC(".oic_mail_li_end").find("h2").empty();
					jQueryOIC(".oic_mail_li_end").find("h2").append(tableauAgences[jQueryOIC(this).index() - 1].nom);
					jQueryOIC('input[name="oic_mail_1.oic_agence_choisie_1"]').val(tableauAgences[jQueryOIC(this).index() - 1].nom);
					jQueryOIC(".oic_mail_li_end").find(".oic_mail_label_mailto").empty();
					if(tableauAgences[jQueryOIC(this).index() - 1].email != "")
						jQueryOIC(".oic_mail_li_end").find(".oic_mail_label_mailto").append('<a href="mailto:' + tableauAgences[jQueryOIC(this).index() - 1].email + '" onclick="trackingClickTag(\'Email – Recherche Agence -  Mail To\')">' + tableauAgences[jQueryOIC(this).index() - 1].email + '</a>');
				});
			}
		});
	}
	/**
	 *	Recherche les agences les plus proches de l'adresse passée en argument et génère le code html représentant les résultats (outil wcb)
	 *	@param adresse: string,	adresse à partir de laquelle est appellé le web service de recherche d'agence
	 */
	function rechercheAgencesWCB(adresse){
		jQueryOIC.ajax({
			type:'get',
			headers:{'Origin': "//www.ca-valdefrance.fr",  "Content-Type":"text/plain"},
			url: "//www.ca-valdefrance.fr/web-service/getNearestBranchList",
			data: {"address": removeDiacritics(adresse),"useIDCR":"false", "oic": "true"},
			success: function(result){
				for(var i=0; i < markersWCB.length; i++){
					markersWCB[i].setMap(null);
				}
				markersWCB = [];
				jQueryOIC("#oic_wcb_btn_lien_autour_de_moi").removeClass("oic_wcb_contour_rouge");
				jQueryOIC("#oic_wcb_localisation_agence_message_erreur").addClass("oic-display_none_el");
				jQueryOIC("#oic_wcb_geoc_map").removeClass("oic-display_none_el");
				jQueryOIC("#oic_wcb_geoc_li_agence").removeClass("oic-display_none_el");
				var listeAgences = 	'<ul>' +
									'	<li class="oic_wcb_liste_agence_titre">' +
									'		<span class="oic_wcb_agence_proximite">'+
										jQueryOIC('#oic_wcb_geoc_form_agence').val().toUpperCase() + ' ('+ jQueryOIC(result).find("nearestBranchList").attr("nb") +
									' AGENCE';
				if(jQueryOIC(result).find("nearestBranchList").attr("nb") > 1 ) listeAgences += "S";
					listeAgences +=		' À PROXIMITÉ)</span></li>';
				var tmpHoraire = null;
				var tmpAgence = null;
				var nbBranch = jQueryOIC(result).find('branch').length;
				// on parse le résultat du webservice pour générer les bloc contenant les informations des agences
				jQueryOIC(result).find("branch").each(function(i){
					tmpHoraire = new Horaire(
						jQueryOIC(this).find("hours").find("monday").text().replace("(1)",""),
						jQueryOIC(this).find("hours").find("tuesday").text().replace("(1)",""),
						jQueryOIC(this).find("hours").find("wednesday").text().replace("(1)",""),
						jQueryOIC(this).find("hours").find("thursday").text().replace("(1)",""),
						jQueryOIC(this).find("hours").find("friday").text().replace("(1)",""),
						jQueryOIC(this).find("hours").find("saturday").text().replace("(1)",""),
						jQueryOIC(this).find("hours").find("sunday").text().replace("(1)","")
					);
					tmpAgence = new Agence(
						jQueryOIC(this).attr("idsiagence"),
						jQueryOIC(this).find("name").text(),
						jQueryOIC(this).find("address").find("streetname").text(),
						jQueryOIC(this).find("address").find("zipcode").text(),
						jQueryOIC(this).find("address").find("city").text(),
						null,
						jQueryOIC(this).find("phone").text(),
						jQueryOIC(this).find("geocode").find("lng").text(),
						jQueryOIC(this).find("geocode").find("lat").text(),
						tmpHoraire
					);
					// certaines agences on des numéros spéciaux,
					// or le webservice getNearestBranchList ajoute '+33' à tous les numéros
					// si le numéro n'est pas un numéro 'classique' on enlève le préfixe +33, sinon on le remplace par un '0'
					if(tmpAgence.telephone.length != 12){ // 12 car +33 est suivi par 9 chiffres.
						tmpAgence.telephone = tmpAgence.telephone.replace("+33", "");
					}else{
						tmpAgence.telephone = tmpAgence.telephone.replace("+33", "0");
					}
					listeAgences +=	'				<li class="oic_wcb_liste_agence"><h2>' + tmpAgence.nom + '</h2>' +
									'					<span class="oic_wcb_label_adress">' + tmpAgence.adresse + '</span>' +
									'					<span class="oic_wcb_label_cp">' + tmpAgence.codepostal + ' ' + tmpAgence.ville + '</span>' +
									'					<span class="oic_wcb_label_tel"><a href="tel:'+ tmpAgence.telephone +'" onclick="trackingClickTag(\'Telephone – Recherche Agence – Clic numero Agence\')">' + tmpAgence.telephone + '</a></span>' +
									'					<span class="oic_wcb_label_id oic-display_none_el">' + tmpAgence.id + '</span>';
					if(tmpAgence.horaires.horaireRenseigneOuNon()){
						listeAgences +=	'					<div class="oic_accordion_horaire_agence">' +
										'						<h3 class="';
						if(tmpAgence.horaires.outilDispoAujourdhui())	{
							// pour le dernier élément
							if(i == nbBranch - 1){
								listeAgences += 'oic_wcb_label_horaire_end';
							}
							listeAgences +=' oic_wcb_label_horaire oic_agence_open">ACTUELLEMENT OUVERTE</h3>';
						} else{
							// pour le dernier élément
							if(i == nbBranch - 1){
								listeAgences += 'oic_wcb_label_horaire_end';
							}
							listeAgences +=' oic_wcb_label_horaire oic_agence_close">ACTUELLEMENT FERMÉE</h3>';
						}
						listeAgences +=	'						<div>' + tmpAgence.genererHtmlHorairesAgences() + '</div>' +
										'					</div>';
					}
					listeAgences +=		'				</li>';
					// positionnement des marqueurs sur la carte
					var marker = new google.maps.Marker({
						position: {lat: parseFloat(tmpAgence.lat), lng: parseFloat(tmpAgence.lng)},
						map: mapWCB,
						title: tmpAgence.nom,
						icon: '//www.ca-valdefrance.fr/Vitrine/ObjCommun/DCIV2/img/OIC/localisation_vert_50_50.png'
					});
					markersWCB.push(marker);
				});
				listeAgences +=		'	</ul>';
				google.maps.event.trigger(mapWCB, 'resize');
				var bounds = new google.maps.LatLngBounds();
				for (var i = 0; i < markersWCB.length; i++) {
					bounds.extend(markersWCB[i].getPosition());
				}
				mapWCB.fitBounds(bounds);
				jQueryOIC('#oic_wcb_geoc_li_agence').empty();
				jQueryOIC('#oic_wcb_geoc_li_agence').append(listeAgences);
				jQueryOIC(".oic_accordion_horaire_agence").accordion({
					active: false,
					collapsible: true,
					navigation: true,
					fillSpace: true,
					heightStyle: "content",
					icons: { "header": "ui-icon-chevron-on-s", "activeHeader": "ui-icon-chevron-off-s" }
				});
				jQueryOIC(".oic_wcb_label_horaire_end").click(function(){
					jQueryOIC("#oic_canaux").animate({scrollTop: jQueryOIC("#oic_canaux")[0].scrollHeight}, 500);
				});
			}
		});
	}
	/**
	 *	Recherche les agences les plus proches de l'adresse passée en argument et génère le code html représentant les résultats (outil mail)
	 *	@param adresse: string,	adresse à partir de laquelle est appellé le web service de recherche d'agence
	 */
	function rechercheAgencesRDV(adresse){
		jQueryOIC.ajax({
			type:'get',
			headers:{'Origin': "//www.ca-valdefrance.fr",  "Content-Type":"text/plain"},
			url: "//www.ca-valdefrance.fr/web-service/getNearestBranchList",
			// useIDCR = true en prod, ici = false pour des raisons de test
			data: {"address": removeDiacritics(adresse),"useIDCR":"false", "oic": "true"},
			success: function(result){
				for(var i=0; i < markersRDV.length; i++){
					markersRDV[i].setMap(null);
				}
				markersRDV = [];
				jQueryOIC("#oic_rdv_btn_lien_autour_de_moi").removeClass("oic_wcb_contour_rouge");
				jQueryOIC("#oic_rdv_localisation_agence_message_erreur").addClass("oic-display_none_el");
				jQueryOIC("#oic_rdv_geoc_map").removeClass("oic-display_none_el");
				jQueryOIC("#oic_rdv_geoc_li_agence").removeClass("oic-display_none_el");
				var listeAgences = 	'<ul>' +
									'	<li class="oic_rdv_liste_agence_titre">' +
									'		<span class="oic_rdv_agence_proximite">'+
										jQueryOIC('#oic_rdv_geoc_form_agence').val().toUpperCase() + ' ('+ jQueryOIC(result).find("nearestBranchList").attr("nb") +
									' AGENCE';
				if(jQueryOIC(result).find("nearestBranchList").attr("nb") > 1 ) listeAgences += "S";
					listeAgences +=		' À PROXIMITÉ)</span></li>';
				var tableauAgences = [];
				var tmpAgence = null;
				var tmpHoraire = null;
				var nbBranch = jQueryOIC(result).find('branch').length;
				// on parse le résultat du webservice pour afficher les blocs contenant les informations des agences
				jQueryOIC(result).find("branch").each(function(i){
					tmpHoraire = new Horaire(
						jQueryOIC(this).find("hours").find("monday").text().replace("(1)",""),
						jQueryOIC(this).find("hours").find("tuesday").text().replace("(1)",""),
						jQueryOIC(this).find("hours").find("wednesday").text().replace("(1)",""),
						jQueryOIC(this).find("hours").find("thursday").text().replace("(1)",""),
						jQueryOIC(this).find("hours").find("friday").text().replace("(1)",""),
						jQueryOIC(this).find("hours").find("saturday").text().replace("(1)",""),
						jQueryOIC(this).find("hours").find("sunday").text().replace("(1)","")
					)
					tmpAgence = new Agence(
						jQueryOIC(this).attr("idsiagence"),
						jQueryOIC(this).find("name").text(),
						jQueryOIC(this).find("address").find("streetname").text(),
						jQueryOIC(this).find("address").find("zipcode").text(),
						jQueryOIC(this).find("address").find("city").text(),
						null,
						jQueryOIC(this).find("phone").text(),
						jQueryOIC(this).find("geocode").find("lng").text(),
						jQueryOIC(this).find("geocode").find("lat").text(),
						tmpHoraire
					);
					tableauAgences.push(tmpAgence);
					// certaines agences on des numéros spéciaux,
					// or getNearestBranchList ajoute '+33' à tous les numéros
					// si le numéro n'est pas un numéro 'classique' on enlève le préfixe +33, sinon on le remplace par un '0'
					if(tmpAgence.telephone.length != 12){ // 12 car +33 est suivi par 9 chiffres.
						tmpAgence.telephone = tmpAgence.telephone.replace("+33", "");
					}else{
						tmpAgence.telephone = tmpAgence.telephone.replace("+33", "0");
					}
						listeAgences += '<li class="oic_rdv_liste_agence"><h2>' + tmpAgence.nom + '</h2>' +
									'	<span class="oic_rdv_label_adress">' + tmpAgence.adresse + '</span>' +
									'	<span class="oic_rdv_label_cp">' + tmpAgence.codepostal+ ' ' + tmpAgence.ville + '</span>' +
									'	<span class="oic_rdv_label_tel"><a href="tel:'+ tmpAgence.telephone +'" onclick="trackingClickTag(\'Prise Rendez-vous – Recherche Agence – Clic numero Agence\')">' + tmpAgence.telephone + '</a></span>' +
									'	<span class="oic_rdv_label_id oic-display_none_el">' + tmpAgence.id + '</span>' +
									'	<span class="oic_rdv_label_jours_ouverts oic-display_none_el">' + tmpAgence.joursOuverts + '</span>';
					if(tmpAgence.horaires.horaireRenseigneOuNon()){
						listeAgences +=	'	<div class="oic_accordion_horaire_agence">' +
										'		<h3 class="';
							if(tmpAgence.horaires.outilDispoAujourdhui())	{
							// pour le dernier élément
							if(i == nbBranch - 1){
								listeAgences += 'oic_rdv_label_horaire_end';
							}
							listeAgences +=' oic_rdv_label_horaire oic_agence_open">ACTUELLEMENT OUVERTE</h3>';
						} else{
							// pour le dernier élément
							if(i == nbBranch - 1){
								listeAgences += 'oic_rdv_label_horaire_end';
							}
							listeAgences +=' oic_rdv_label_horaire oic_agence_close">ACTUELLEMENT FERMÉE</h3>';
						}
						listeAgences +=		'		<div>' + tmpAgence.genererHtmlHorairesAgences() +'</div>' +
											'	</div>';
					}
					listeAgences +=			'</li>';
						// positionnement des marqueurs sur la carte
					var marker = new google.maps.Marker({
						position: {lat: parseFloat(tmpAgence.lat), lng: parseFloat(tmpAgence.lng)},
						map: mapRDV,
						title: tmpAgence.nom,
						icon: '//www.ca-valdefrance.fr/Vitrine/ObjCommun/DCIV2/img/OIC/localisation_vert_50_50.png'
					});
					markersRDV.push(marker);
				});
				listeAgences +=		'	</ul>';
				google.maps.event.trigger(mapRDV, 'resize');
				var bounds = new google.maps.LatLngBounds();
				for (var i = 0; i < markersRDV.length; i++) {
					bounds.extend(markersRDV[i].getPosition());
				}
				mapRDV.fitBounds(bounds);
				jQueryOIC('#oic_rdv_geoc_li_agence').empty();
				jQueryOIC('#oic_rdv_geoc_li_agence').append(listeAgences);
				jQueryOIC( ".oic_accordion_horaire_agence" ).accordion({
					active: false,
					collapsible: true,
					navigation: true,
					fillSpace: true,
					heightStyle: "content",
					icons: { "header": "ui-icon-chevron-on-s", "activeHeader": "ui-icon-chevron-off-s" }
				});
				jQueryOIC(".oic_rdv_label_horaire_end").click(function(){
					jQueryOIC("#oic_canaux").animate({scrollTop: jQueryOIC("#oic_canaux")[0].scrollHeight}, 500);
				});
				jQueryOIC(".oic_rdv_liste_agence:not(:last)").click(function(){
					jQueryOIC('#oic_rdv_geoc').addClass("oic-display_none_el");
					jQueryOIC('#oic_rdv_adresser_message_agence_particulier,#oic_rdv_num_unique').addClass("oic-display_none_el");
					jQueryOIC( "#oic_rdv_li_motifs" ).removeClass("oic-display_none_el");
					jQueryOIC( "#oic_rdv_adresse_agence" ).removeClass("oic-display_none_el");
					var etatAgence = '';
					if(jQueryOIC(this).find('h3').hasClass('oic_agence_open')){
						etatAgence = 'oic_agence_open';
					} else if(jQueryOIC(this).find('h3').hasClass('oic_agence_close')){
						etatAgence = 'oic_agence_close';
					}
					jQueryOIC('input[name="oic_rdv_1.routAg-id_eds_agence_1"]').val(tableauAgences[jQueryOIC(this).index() - 1].id);
					jQueryOIC('#oic_rdv_adresse_agence').find("h2").empty();
					jQueryOIC('#oic_rdv_adresse_agence').find("h2").append(tableauAgences[jQueryOIC(this).index() - 1].nom);
					jQueryOIC('#oic_rdv_adresse_agence').find("h3").removeClass('oic_agence_close oic_agence_open');
					jQueryOIC('#oic_rdv_adresse_agence').find("h3").empty();
					jQueryOIC('#oic_rdv_adresse_agence').find("h3").addClass(etatAgence);
					if(etatAgence == 'oic_agence_close'){
						jQueryOIC('#oic_rdv_adresse_agence').find("h3").append('ACTUELLEMENT FERMÉE');
					}else if(etatAgence == 'oic_agence_open'){
						jQueryOIC('#oic_rdv_adresse_agence').find("h3").append('ACTUELLEMENT OUVERTE');
					}
					jQueryOIC("#oic_accordion_horaire_agence_unique").find('.oic_horaire_agence').empty();
					jQueryOIC("#oic_accordion_horaire_agence_unique").find('.oic_horaire_agence').append(tableauAgences[jQueryOIC(this).index() - 1].genererHtmlHorairesAgences());
					jQueryOIC( "#oic_accordion_horaire_agence_unique" ).accordion({
						collapsible: true,
						navigation: true,
						fillSpace: true,
						heightStyle: "content",
						icons: { "header": "ui-icon-chevron-on-s", "activeHeader": "ui-icon-chevron-off-s" }
					});
					// gestion du select2 #oic_rdv_jour
					jQueryOIC('#oic_rdv_jour').empty();
					jQueryOIC('#oic_rdv_jour').append(tableauAgences[jQueryOIC(this).index() - 1].horaires.genererOptionJoursOuverts());
					jQueryOIC('#oic_rdv_horaire').empty();
					jQueryOIC('#oic_rdv_horaire').append(tableauAgences[jQueryOIC(this).index() - 1].horaires.genererTranchesHorairesParDefaut());
					var index = jQueryOIC(this).index();
					jQueryOIC('input[name="oic_rdv_1.oic_agence_choisie_1"]').val(tableauAgences[index - 1].nom);
					jQueryOIC("#oic_rdv_jour").on("change", function (e) {
						if(jQueryOIC('#oic_rdv_jour').select2('data')[0].text != "" && jQueryOIC('#oic_rdv_jour').select2('data')[0].text != "Indifférent"){
							jQueryOIC('#oic_rdv_horaire').empty();
							jQueryOIC('#oic_rdv_horaire').append(tableauAgences[index - 1].horaires.genererTranchesHorairesPourLeJour(jours.indexOf(jQueryOIC('#oic_rdv_jour').select2('data')[0].text)));
						}else{
							jQueryOIC('#oic_rdv_horaire').empty();
							jQueryOIC('#oic_rdv_horaire').append(tableauAgences[index - 1].horaires.genererTranchesHorairesParDefaut());
						}
						jQueryOIC('#oic_wcb_spanHiddenHoraire').addClass("spanHidden");
						jQueryOIC("#oic_wcb_horaire").select2({
							placeholder: "Tranche horaire",
							minimumResultsForSearch: -1,
							theme: "classic"
						});
					});
				}).find('.oic_accordion_horaire_agence, .oic_rdv_label_tel').click(function(){
					return false;
				});
				jQuery('.oic_rdv_label_tel').click(function(){document.location.href = jQueryOIC(this).find('a').attr('href');trackingClickTag('Prise Rendez-vous – Recherche Agence – Clic numero Agence');});
			}
		});
	}
	/* ****************************************************************************
	 * Fin: Fonctions de recherche d'agence
	 **************************************************************************** */
	/* ****************************************************************************
	 *	Début: Animations ouverture/fermeture du bouton vert
	 **************************************************************************** */
	/**
	 * Réinitialise l'affichage du départ
	 */
	function initialisationAffichageOIC(){
		if(jQueryOIC("#oic-ul_contenu_Slider_btn_vert").hasClass("oic-display_none_el")){
			jQueryOIC("#oic_mail, #oic_chat, #oic_wcb, #oic_rdv, #oic_sos").addClass("oic-display_none_el");
			jQueryOIC("#oic-ul_contenu_Slider_btn_vert").removeClass("oic-display_none_el");
			jQueryOIC(".oic_active").removeClass("oic_active");
			hideElements();
			initForm();
		}
	}
	/* ****************************************************************************
	 *	Début: Mobile
	 **************************************************************************** */
	 // Bulle d'ouverture du bouton vert
	jQueryOIC("#oic-btn-rond-mobile").click(function(){
		jQueryOIC("#oic-container").addClass("oic-display_none_el_BV");
		jQueryOIC("#oic-btn-rond-mobile").addClass("oic-display_none_el_BV_mobile");
		jQueryOIC("#oic-btn-rond-mobile").removeClass("oic-display_none_el_BV");
		jQueryOIC("#oic-contenu_Slider_btn_vert").removeClass("oic-display_none_el");
		jQueryOIC("#oic-main_Slider_btn_vert").addClass("oic-display_none_el");
		jQueryOIC('#oic-container').css("right", "0 ");
		animationMenuSliderMobile();
	});
	/**
	 *	Animation de fermeture du bouton vert en version mobile
	 */
	function closeOicBvMobile(){
		jQueryOIC('#oic-container').css("right", "-260px");
		jQueryOIC('#oic-ul_menu_Slider_btn_vert').addClass('oic_black_background');
		jQueryOIC('#oic-menu_Slider_btn_vert').removeClass('oic_black_background');
		jQueryOIC("#oic-container").removeClass("oic-display_none_el_BV");
		jQueryOIC("#oic-container").addClass("oic-display_none_el_BV_mobile");
		jQueryOIC("#oic-btn-rond-mobile").removeClass("oic-display_none_el_BV_mobile");
		jQueryOIC("#oic-btn-rond-mobile").addClass("oic-display_none_el_BV");
		hideChat();
		jQueryOIC('.oic_active').removeClass("oic_active");
		jQueryOIC("#oic-contenu_Slider_btn_vert").removeClass("oic-display_none_el");
		jQueryOIC('.container_close').removeClass("display_none_el");
		initialisationAffichageOIC();
	}
	/**
	 *	Animation d'ouverture du bouton vert en version mobile
	 */
	function animationMenuSliderMobile(){
		jQueryOIC('.oic-container_close').removeClass("oic-display_none_el");
		jQueryOIC('#oic-bulle-original').removeClass("oic-display_none_el");
		jQueryOIC("#oic-grande-bulle").addClass("oic-display_none_el");
		jQueryOIC('#oic-ul_menu_Slider_btn_vert').removeClass('oic_black_background');
		jQueryOIC('#oic-menu_Slider_btn_vert').addClass('oic_black_background');
		jQueryOIC('#oic-container').css("right", "-260");
		jQueryOIC('.container_close').removeClass("display_non,e_el");
	}
	// Croix de fermeture
	jQueryOIC('.oic-btn_close_contact_mobile').click(function() {
		jQueryOIC('#oic-container').css('display', 'none !important');
		jQueryOIC("#oic-btn-rond-mobile").css('display','none !important');
		initialisationAffichageOIC();
	});
	/* ****************************************************************************
	 *	Fin: Mobile
	 **************************************************************************** */
	/* ****************************************************************************
	 *	Début: Desktop & Tablette
	 **************************************************************************** */
	/**
	 *	Animation d'ouverture du bouton vert
	 */
	function animationMenuSlider(){
		if(jQueryOIC('#oic-container').css('right').replace("px","") < 0){//Menu fermé => on ouvre
			jQueryOIC('#oic-ul_menu_Slider_btn_vert').removeClass('oic_black_background');
			jQueryOIC('#oic-menu_Slider_btn_vert').addClass('oic_black_background');
			jQueryOIC('.oic-container_close').removeClass("oic-display_none_el");
			jQueryOIC('#oic-bulle-original').removeClass("oic-display_none_el");
			jQueryOIC("#oic-grande-bulle").addClass("oic-display_none_el");
			jQueryOIC('#oic-container').animate({width: 300 + "px"}, 500);
			jQueryOIC('#oic-container').animate({right: 0 + "px"}, 500);
			jQueryOIC('.container_close').removeClass("display_none_el");
		}
	}
	/**
	 * Animation de fermeture du bouton vert
	 */
	function initialisationEcranClickFermetureBulleVerte(){
		jQueryOIC('#oic-container').animate(
			{right: "-" + 260 + "px"}, 500, "linear",
			function() {
				jQueryOIC('#oic-ul_menu_Slider_btn_vert').addClass('oic_black_background');
				jQueryOIC('#oic-menu_Slider_btn_vert').removeClass('oic_black_background');
				jQueryOIC('.oic-container_close').addClass("oic-display_none_el");
				jQueryOIC('.oic-container_top_main_slider').addClass("oic-display_none_el");
				jQueryOIC('#oic-bulle-original').removeClass("oic-display_none_el");
				jQueryOIC('#oic-bulle-verte').removeClass("oic-bulle-verte_close_contact");
				jQueryOIC('#oic-bulle-verte').addClass("oic-bulle-verte");
				initialisationAffichageOIC();
			}
		);
		jQueryOIC('#oic-container').animate({width: 300 + "px"}, 0);
	}
	/* ****************************************************************************
	 *	Fin: Desktop & Tablette
	 **************************************************************************** */
	/**
	 *	Action lancée lors d'un clic sur la bulle verte du bouton vert
	 */
	function closeOrOpen(){
		hideChat();
		jQueryOIC('.oic_active').removeClass("oic_active");
		if(jQueryOIC('#oic-container').css('right').replace("px","") < 0){//Menu fermé => on ouvre
			trackingPageTag();
			jQueryOIC('#oic-ul_menu_Slider_btn_vert').removeClass('oic_black_background');
			jQueryOIC('#oic-menu_Slider_btn_vert').addClass('oic_black_background');
			jQueryOIC("#oic-contenu_Slider_btn_vert").removeClass("oic-display_none_el");
			jQueryOIC('.oic-container_close').removeClass("oic-display_none_el");
			jQueryOIC('#oic-bulle-original').removeClass("oic-display_none_el");
			jQueryOIC("#oic-grande-bulle").addClass("oic-display_none_el");
			jQueryOIC('#oic-container').animate({right: 0 + "px"}, 500);
			jQueryOIC('.container_close').removeClass("display_none_el");
		} else{//Menu ouvert => on ferme
			trackingClickTag("Fermeture");
			initialisationEcranClickFermetureBulleVerte();
			//Mobile
			jQueryOIC("#oic-container").removeClass("oic-display_none_el_BV");
			jQueryOIC("#oic-btn-rond-mobile").removeClass("oic-display_none_el_BV_mobile");
			jQueryOIC("#oic-btn-rond-mobile").addClass("oic-display_none_el_BV");
			initialisationAffichageOIC();
		}
	}
	// bulle verte du bouton vert
	jQueryOIC('#oic-bulle-verte').click(function(){
		if (jQuery(window).width() < 744) {
			closeOicBvMobile();
		} else {
			closeOrOpen();
		}
	});
	// boutons de fermeture du bouton vert
	jQueryOIC('.oic-btn_close_contact').click(function() {
		trackingClickTag("Fermeture");
		jQueryOIC('.oic_active').removeClass('oic_active');
		if (jQuery(window).width() < 744) {
			closeOicBvMobile();
		} else {
			closeOrOpen();
		}
	});
	/* ****************************************************************************
	 *	Fin: Animations ouverture/fermeture du bouton vert
	 **************************************************************************** */
	/* ****************************************************************************
	 *	Début: Actions relatives au pictogrammes des canaux du bouton vert
	 **************************************************************************** */
	// Au survol du pictogramme téléphone
	jQueryOIC(".oic-tel_contact").hover(
		function() {
			if(horairesTel.outilDispoAujourdhui(horairesTel)){
				jQueryOIC("#oic-tel_contact").css("background-position","-40px 0px");
			} else{
				jQueryOIC("#oic-tel_contact").css("background-position", "-80px 0px");
			}
		}, function() {
			if(horairesTel.outilDispoAujourdhui(horairesTel)){
				jQueryOIC("#oic-tel_contact").css("background-position","0px 0px");
			}
		}
	);
	// Au survol du pictogramme bulle de discussion	(chat)
	jQueryOIC(".oic-tel_chat").hover(
		function() {
			if( horairesChat.outilDispoAujourdhui() && (jQueryOIC('#vivocha_oic_bouton_vert').length != 0 || jQuery('.vivocha_media').length != 0) ){
				jQueryOIC("#oic-tel_chat").css("background-position","-40px 0px");
			} else{
				jQueryOIC("#oic-tel_chat").css("background-position","-80px 0px");
			}
		}, function() {
			if( horairesChat.outilDispoAujourdhui() && (jQueryOIC('#vivocha_oic_bouton_vert').length != 0 || jQuery('.vivocha_media').length != 0) ){
				jQueryOIC("#oic-tel_chat").css("background-position","0px 0px");
			}
		}
	);
	// Au survol du pictogramme calendrier (priseRDV)
	jQueryOIC(".oic-rdv_contact").hover(
		function() {
			jQueryOIC("#oic-rdv_contact").css("background-position","-40px 0px");
		}, function() {
			jQueryOIC("#oic-rdv_contact").css("background-position","0px 0px");
		}
	);
	// Au survol du pictogramme mail
	jQueryOIC(".oic-mail_contact").hover(
		function() {
			jQueryOIC("#oic-mail_contact").css("background-position","-40px 0px");
		}, function() {
			jQueryOIC("#oic-mail_contact").css("background-position","0px 0px");
		}
	);
	// Au survol du pictogramme SOS
	jQueryOIC(".oic-sos_contact").hover(
		function() {
			jQueryOIC("#oic-sos_contact").css("background-position","-40px 0px");
		}, function() {
			jQueryOIC("#oic-sos_contact").css("background-position","0px 0px");
		}
	);
	// Au clic sur le picto (et texte associé) mail
	jQueryOIC(".oic-mail_contact").click(function(){
		trackingClickTag('Email – Bouton d acces');
		hideChat();
		jQueryOIC('.oic_active').removeClass("oic_active");
		jQueryOIC("#oic-mail_contact").addClass("oic_active");
		jQueryOIC("#oic_chat").addClass("oic-display_none_el");
		//Mobile
		jQuery("#oic-container").addClass("oic-display_none_el_BV");
		jQuery("#oic-btn-rond-mobile").addClass("oic-display_none_el_BV_mobile");
		jQuery("#oic-btn-rond-mobile").removeClass("oic-display_none_el_BV");
		jQuery("#oic-main_Slider_btn_vert").removeClass("oic-display_none_el");
		if(typeof OICTOPMAILSECU != "undefined" && typeof OICTOPISBAM != "undefined" && OICTOPMAILSECU == true && OICTOPISBAM == true){
			trackingPageTag();
			document.location.href = "javascript:lancerPu('Msecriture')";
		}else{
			if(jQueryOIC('#oic-container').css('right').replace("px","") < 0){
				trackingPageTag();
				jQueryOIC("#oic_chat, #oic_wcb, #oic_rdv, #oic_sos").addClass("oic-display_none_el");
				animationMenuSlider();
			}else{
				jQueryOIC("#oic-ul_contenu_Slider_btn_vert").addClass("oic-display_none_el");
			}
			jQueryOIC("#oic-contenu_Slider_btn_vert").addClass("oic-display_none_el");
			jQueryOIC("#oic_wcb, #oic_rdv, #oic_sos, #oic_chat").addClass("oic-display_none_el");
			jQueryOIC("#oic_mail").removeClass("oic-display_none_el");
			jQueryOIC("#oic_mail_ul_titre, #oic_mail_client_ca,  #oic_mail_non_client .oic_mail_h2_titre, #oic_mail_adresser_message_agence_particulier, #oic_mail_choix_agence").removeClass("oic-display_none_el");
			hideElements();
			initForm();
		}
	});
	/**
	 *	Initialise (vide, enlève les messages d'erreurs,...) les formulaires du bouton vert
	 */
	function initForm(){
		jQueryOIC(':input','#oic-mail-form, #oic-wcb-form, #oic-rdv-form, #oic_wcb_geoc_form_agence, #oic_mail_geoc_form_agence, #oic_rdv_geoc_form_agence')
			.not(':button, :submit, :reset')
			.val('')
			.removeAttr('checked')
			.removeAttr('selected')
			.removeClass('valid')
			.removeClass('error')
			.css('border-color','#d3d3d3');
		jQueryOIC('.help-block').remove();
		jQueryOIC('.form-error-bouton').addClass('spanHidden');
		jQueryOIC('#oic_mail_geoc_form_agence, #oic_mail_adresser_mail_agence_form,#oic_wcb_motif, #oic_wcb_geoc_form_agence, #oic_rdv_geoc_form_agence, #oic_wcb_jour, #oic_wcb_horaire, #oic_rdv_adresser_rdv_agence_form, #oic_rdv_jour, #oic_rdv_horaire').val('');
		initSelect2();
		jQueryOIC('.oic-mail-form-item, .oic-wcb-form-item, .oic-rdv-form-item').removeClass('has-error');
		jQueryOIC('.form-error-bouton').addClass('spanHidden');
		jQueryOIC('#oic-container label.error').remove();
		jQueryOIC('#oic-container .error').removeClass('error');
	}
	/**
	 *	Cache les éléments des panneaux des différents outils afin de réinitialiser leur affichage lors d'une prochaine ouverture
	 */
	function hideElements(){
		jQueryOIC("#oic_mentions_CNIL, #oic_mail_motif_form, #oic_mail_adresse_agence, #oic_mail_geoc_map,#oic_mail_geoc_li_agence, #oic_mail_confirm, #oic_localisation_agence_message_erreur").addClass("oic-display_none_el");
		
		jQueryOIC("#oic_mail_li_motifs").removeClass("oic-display_none_el");
		
		jQueryOIC("#oic_mail_geoc").addClass("oic-display_none_el");
		
		jQueryOIC("#oic_mail_btn_lien_autour_de_moi").removeClass("oic_mail_contour_rouge");
		jQueryOIC("#oic_localisation_agence_message_erreur").addClass("oic-display_none_el");
		jQueryOIC('#oic_chat-texte_indisponibilite').addClass('oic-display_none_el');
		jQueryOIC("#oic_wcb_btn_lien_autour_de_moi").removeClass("oic_wcb_contour_rouge");
		jQueryOIC("#oic_wcb_mentions_CNIL, #oic_wcb_adresse_agence,#oic_wcb_geoc_map,#oic_wcb_geoc_li_agence, #oic_wcb_confirm").addClass("oic-display_none_el");
		
		jQueryOIC("#oic_wcb_localisation_agence_message_erreur").addClass("oic-display_none_el");
		jQueryOIC("#oic_rdv_mentions_CNIL, #oic_rdv_motif_form, #oic_rdv_adresse_agence,#oic_rdv_geoc_map,#oic_rdv_geoc_li_agence, #oic_rdv_confirm, #oic_rdv_li_motifs").addClass("oic-display_none_el");
		
		jQueryOIC("#oic_rdv_li_motifs").removeClass("oic-display_none_el");
		
		jQueryOIC("#oic_rdv_btn_lien_autour_de_moi").removeClass("oic_mail_contour_rouge");
		jQueryOIC("#oic_rdv_localisation_agence_message_erreur").addClass("oic-display_none_el");
	}
	// au clic sur le picto (et texte associé) du canal chat
	jQueryOIC(".oic-tel_chat").click(function(){
		trackingPageTag();
		trackingClickTag("Tchat – Bouton d acces");
		jQueryOIC("#oic-contenu_Slider_btn_vert").addClass("oic-display_none_el");
		jQueryOIC("#oic_mail, #oic_wcb,  #oic_rdv, #oic_sos").addClass("oic-display_none_el");
		jQueryOIC('.oic_active').removeClass("oic_active");
		jQueryOIC("#oic_chat").removeClass("oic-display_none_el");
		//Mobile
		jQuery("#oic-container").addClass("oic-display_none_el_BV");
		jQuery("#oic-btn-rond-mobile").addClass("oic-display_none_el_BV_mobile");
		jQuery("#oic-btn-rond-mobile").removeClass("oic-display_none_el_BV");
		jQuery("#oic-main_Slider_btn_vert").removeClass("oic-display_none_el");
		if( !horairesChat.outilDispoAujourdhui() || (jQueryOIC('#vivocha_oic_bouton_vert').length == 0 && jQuery('.vivocha_media').length == 0)){
			jQueryOIC('#oic_chat-texte_indisponibilite').removeClass('oic-display_none_el');
			animationMenuSlider();
		}else{
			jQueryOIC('.vivocha_media_container').removeClass('oic-display_element_none');
			jQueryOIC("#oic-grande-bulle").addClass("oic-display_none_el"); //
			jQueryOIC('#oic-bulle-original').removeClass("oic-display_none_el");
			jQueryOIC('#oic-container').animate(
				{right: "-" + 260 + "px"}, 500, "linear",
				function() {
					jQueryOIC('#oic-bulle-verte').removeClass("oic-bulle-verte_close_contact");
					jQueryOIC('#oic-bulle-verte').addClass("oic-bulle-verte");
					jQueryOIC("#oic-contenu_Slider_btn_vert").removeClass("oic-display_none_el");
					jQueryOIC('#oic-ul_menu_Slider_btn_vert').addClass('oic_black_background');
					jQueryOIC('#oic-menu_Slider_btn_vert').removeClass('oic_black_background');
				}
			);
			// lancer le chat
			jQueryOIC("#oic-tel_chat").addClass("oic_active");
			jQueryOIC('#oic_chat-texte_indisponibilite').addClass('oic-display_none_el');
			if(jQueryOIC('#vivocha_oic_bouton_vert .vivocha_widget_openmedia_chat span span').length) jQueryOIC('#vivocha_oic_bouton_vert .vivocha_widget_openmedia_chat span span')[0].click();
			if(jQueryOIC('.vivocha_media_resizeButtonMax').length)	jQueryOIC('.vivocha_media_resizeButtonMax')[0].click();
		}
	});
	/**
	 *	Cache le chat généré par vivocha
	 */
	function hideChat(){
		// si le chat est ouvert on le réduit et on le cache
		if(jQueryOIC('.vivocha_media_resizeButtonMin').length){
			jQueryOIC('.vivocha_media_resizeButtonMin')[0].click();
		}
	}
	// Au clic sur l'icone de fermeture du chat vivocha, on ferme le bouton vert
	jQueryOIC(document).on("click", ".vivocha_media_closeButton", function() {
		jQueryOIC('#oic-tel_chat').removeClass('oic_active');
	});
	// Au clic sur le picto (et texte associé) du canal téléphone
	jQueryOIC(".oic-tel_contact").click(function(){
		hideChat();
		trackingClickTag('Telephone – Bouton d acces');
		jQueryOIC(".oic_active").removeClass("oic_active");
		
		//Mobile
		jQuery("#oic-container").addClass("oic-display_none_el_BV");
		jQuery("#oic-btn-rond-mobile").addClass("oic-display_none_el_BV_mobile");
		jQuery("#oic-btn-rond-mobile").removeClass("oic-display_none_el_BV");
		jQuery("#oic-main_Slider_btn_vert").removeClass("oic-display_none_el");
		if(jQueryOIC('#oic-container').css('right').replace("px","") < 0){
			trackingPageTag();
			animationMenuSlider();
		}
		jQueryOIC("#oic_wcb").removeClass("oic-display_none_el");
		jQueryOIC("#oic-contenu_Slider_btn_vert").addClass("oic-display_none_el"); // Masque écran initial d'ouverture du slider "Besoin D'AIDE"
		jQueryOIC("#oic_mail,#oic_rdv,#oic_sos,#oic_chat").addClass("oic-display_none_el");
		jQueryOIC("#oic_wcb").removeClass("oic-display_none_el");
		if(horairesTel.outilDispoAujourdhui()){
			jQueryOIC("#oic-tel_contact").addClass("oic_active");
			jQueryOIC("#oic_wcb_ul_titre, #oic_wcb_appelez_nous, #oic_wcb_geoc,#oic_wcb_etre_rappelle").removeClass("oic-display_none_el");
			jQueryOIC("#oic-wcb_texte_indisponibilite").addClass("oic-display_none_el");
		} else {
			jQueryOIC("#oic_wcb_ul_titre, #oic_wcb_appelez_nous, #oic_wcb_geoc").removeClass("oic-display_none_el");
			jQueryOIC("#oic-wcb_texte_indisponibilite").removeClass("oic-display_none_el");
		}
		hideElements();
		initForm();
	});
	// Au clic sur le picto (et texte associé) du canal priseRDV
	jQueryOIC(".oic-rdv_contact").click(function(){
		trackingClickTag('Prise Rendez-vous – Bouton d acces');
		jQueryOIC(".oic_active").removeClass("oic_active");
		jQueryOIC("#oic-rdv_contact").addClass("oic_active");
		//Mobile
		jQuery("#oic-container").addClass("oic-display_none_el_BV");
		jQuery("#oic-btn-rond-mobile").addClass("oic-display_none_el_BV_mobile");
		jQuery("#oic-btn-rond-mobile").removeClass("oic-display_none_el_BV");
		jQuery("#oic-main_Slider_btn_vert").removeClass("oic-display_none_el");
		if(typeof OICTOPISBAM != "undefined" && OICTOPISBAM == true){
			trackingPageTag();
			if(typeof OICTOPPRISERDV != "undefined" && OICTOPPRISERDV == true){
				document.location.href = "javascript:lancerPu('Priserdv')";
			}else if(typeof OICTOPMAILSECU != "undefined" && OICTOPMAILSECU == true){
				document.location.href = "javascript:lancerPu('Msecriture')";
			}
		}else{
			if(jQueryOIC('#oic-container').css('right').replace("px","") < 0){
				trackingPageTag();
				jQueryOIC("#oic-contenu_Slider_btn_vert").addClass("oic-display_none_el");
				jQueryOIC("#oic-ul_contenu_Slider_btn_vert").removeClass("oic-active-contenu-rdv");
				jQueryOIC("#oic_rdv").removeClass("oic-display_none_el");
				animationMenuSlider();
			}else{
				jQueryOIC("#oic_rdv" ).removeClass("oic-display_none_el");
				jQueryOIC("#oic-ul_contenu_Slider_btn_vert").addClass("oic-display_none_el");
				jQueryOIC("#oic_rdv_ul_titre, #oic_rdv_client_ca,  #oic_rdv_non_client, #oic_rdv_geoc, #oic_rdv_adresser_message_agence_particulier, #oic_rdv_adresser_message_agence_particulier").removeClass("oic-display_none_el");
			}
			jQueryOIC("#oic-contenu_Slider_btn_vert").addClass("oic-display_none_el");
			jQueryOIC("#oic_mail, #oic_wcb, #oic_sos, #oic_chat").addClass('oic-display_none_el');
			jQueryOIC("#oic_rdv").removeClass('oic-display_none_el');
			jQueryOIC("#oic_rdv_ul_titre, #oic_rdv_client_ca,  #oic_rdv_non_client .oic_rdv_h2_titre, #oic_rdv_adresser_message_agence_particulier, #oic_rdv_geoc, #oic_rdv_num_unique").removeClass("oic-display_none_el");
			hideElements();
			initForm();
		}
	});
	// Au clic sur le picto (et texte associé) du canal SOS
	jQueryOIC(".oic-sos_contact").click(function(){
		trackingClickTag('Numéro SOS – Bouton d acces');
		jQueryOIC(".oic_active").removeClass("oic_active");
		jQueryOIC("#oic-sos_contact").addClass("oic_active");
		//Mobile
		jQuery("#oic-container").addClass("oic-display_none_el_BV");
		jQuery("#oic-btn-rond-mobile").addClass("oic-display_none_el_BV_mobile");
		jQuery("#oic-btn-rond-mobile").removeClass("oic-display_none_el_BV");
		jQuery("#oic-main_Slider_btn_vert").removeClass("oic-display_none_el");
		if(jQueryOIC('#oic-container').css('right').replace("px","") < 0){
			trackingPageTag();
			animationMenuSlider();
		}
		jQueryOIC("#oic-contenu_Slider_btn_vert").addClass("oic-display_none_el");
		jQueryOIC("#oic_mail, #oic_rdv, #oic_wcb, #oic_chat").addClass("oic-display_none_el");
		jQueryOIC("#oic_sos").removeClass("oic-display_none_el");
		hideElements();
		initForm();
	});
	/* ****************************************************************************
	 *	Fin: Actions relatives au pictogrammes des canaux du bouton vert
	 **************************************************************************** */
	/* ****************************************************************************
	 *	Début: Actions des composants du canal mail
	 **************************************************************************** */
	// Au clic sur le bouton 'Accéder à vos comptes' du canal mail
	jQueryOIC('#oic_acces_bam_mail').click(function(){
		trackingClickTag('Email – Lien vers BAM');
		jQueryOIC('#bamaccessoic input[name="idtcm"]').val('tcm-1363-463481');
		document.location.href = "javascript:bamv3_validationOIC();";
	});
	// Au clic du bouton '>' confirmation agences particulières
	jQueryOIC("#oic_mail_submit_action_form").click(function(){
		//si on cocher "OUI" à l'écran
		if(jQueryOIC("#oic_mail_choix_agenceOui").is(':checked')){
			oicMailAgenceParticuliere = true;
			// afficher écran autour de moi
			jQueryOIC("#oic_mail_choix_agence").addClass("oic-display_none_el");
			jQueryOIC("#oic_mail_geoc").removeClass("oic-display_none_el");
		}
		if(jQueryOIC("#oic_mail_choix_agenceNon").is(':checked')){
			oicMailAgenceParticuliere = false;
			jQueryOIC("#oic_mail_geoc").addClass("oic-display_none_el");
			jQueryOIC("#oic_mail_adresser_message_agence_particulier").addClass("oic-display_none_el");
			jQueryOIC("#oic_mail_choix_agence").addClass("oic-display_none_el");
			jQueryOIC("#oic_mail_adresse_agence").addClass("oic-display_none_el");
			jQueryOIC("#oic_mail_li_motifs").removeClass("oic-display_none_el");
		}
	});
	//Action onEnterKeyPressed sur le champ de recherche (outil mail)
	jQueryOIC('#oic_mail_geoc_form_agence').keypress(function (ev) {
		var keycode = (ev.keyCode ? ev.keyCode : ev.which);
		if (keycode == '13') {
			ev.preventDefault();
		}
	});
	//Au clic du bouton '>' pour la recherche d'agence
	jQueryOIC("#oic_mail_btn_lien_autour_de_moi_confirmation").click(function(){
		trackingClickTag('Email – Recherche Agence – Saisie manuelle');
		rechercheAgences(jQueryOIC('#oic_mail_geoc_form_agence').val());
	});
	//Au clic sur les bloc des résultats de la recherche d'agence du canal mail
	jQueryOIC(".oic_mail_liste_agence").click(function(){
		jQueryOIC('#oic_mail_geoc').addClass("oic-display_none_el");
		jQueryOIC('#oic_mail_adresser_message_agence_particuliere').addClass("oic-display_none_el");
		jQueryOIC("#oic_mail_li_motifs").removeClass("oic_mail_etape_affichage_4_display_none");
		jQueryOIC("#oic_mail_adresse_agence").removeClass("oic-display_none_el");
	});
	//A la sélection d'un motif dans la liste déroulante, pour le canal mail
	jQueryOIC("#oic_mail_adresser_mail_agence_form").change(function (e) {
		jQueryOIC("#oic_mail_motif_form").removeClass("oic-display_none_el"); //affichage formulaire contact
	});
	//obtenir la géolocalisation au click du bouton 'autour de moi' du canal mail
	jQueryOIC("#oic_mail_btn_lien_autour_de_moi").click(function(){
		trackingClickTag('Email – Recherche Agence - Geolocalisation');
		jQueryOIC("#oic_mail_geoc_form_agence").val("");
		getLocation(OIC_MAIL);
	});
	//A la sélection d'un motif pour le <select(2)> du canal mail
	if(jQueryOIC("#oic_mail_adresser_mail_agence_form").length){
		jQueryOIC("#oic_mail_adresser_mail_agence_form").on("select2:select", function (e) {
			if(oicMailAgenceParticuliere){
				trackingEventTag(jQueryOIC("#oic_mail_adresser_mail_agence_form").select2('data')[0].text, "1", "OIC-Bouton vert_Email_Agence");
			}else{
				trackingEventTag(jQueryOIC("#oic_mail_adresser_mail_agence_form").select2('data')[0].text, "1", "OIC-Bouton vert_Email_non_Agence");
				trackingClickTag('Email – Non Agence');
			}
			obtenirCaptcha('oic-mail-captcha');
			jQueryOIC("#oic_mail_motif_form").removeClass("oic-display_none_el");
		});
	}
	//A la selection du radio bouton de civilité du formulaire du canal mail
	jQueryOIC('input[type=radio][name="oic_mail_1.oic_mail_civilite_1"]').change(function() {
		jQueryOIC("#spanHiddenCivilite").addClass("spanHidden");
	});
	// Au clic sur le lien des mentions CNIL du canal mail
	jQueryOIC('#oic_mail_affichage_mentions_CNIL').change(function() {
		if(jQueryOIC(this).is(":checked")){
			jQueryOIC("#spanHiddenCnil").addClass("spanHidden");
		}
	});
	// Au clic sur la case à cocher de la confirmation des mentions CNIL (canal mail)
	jQueryOIC("#oic-lien-cnil").click(function(e){
		if(!jQueryOIC("#oic_mentions_CNIL").hasClass("oic-display_none_el")){
			jQueryOIC("#oic_mentions_CNIL").addClass("oic-display_none_el");
		}else {
			jQueryOIC("#oic_mentions_CNIL").removeClass("oic-display_none_el");
		}
	});
	/* ****************************************************************************
	 *	Fin: Actions des composants du canal mail
	 **************************************************************************** */
	/* ****************************************************************************
	 *	Début: Actions des composants du canal téléphone
	 **************************************************************************** */
	 //Au clic sur le bouton 'autour de moi' canal téléphone
	jQueryOIC("#oic_wcb_btn_lien_autour_de_moi").click(function(){
		trackingClickTag('Telephone – Recherche Agence - Geolocalisation');
		jQueryOIC("#oic_wcb_geoc_form_agence").val("");
		getLocation(OIC_WCB);
	});
	//Action onEnterKeyPressed sur le champ de recherche (outil téléphone)
	jQueryOIC('#oic_wcb_geoc_form_agence').keypress(function (ev) {
		var keycode = (ev.keyCode ? ev.keyCode : ev.which);
		if (keycode == '13') {
			ev.preventDefault();
		}
	});
	//Au clic du bouton '>' pour la recherche d'agenc
	jQueryOIC("#oic_wcb_btn_lien_autour_de_moi_confirmation").click(function(){
		trackingClickTag('Telephone – Recherche Agence – Saisie manuelle');
		rechercheAgencesWCB(jQueryOIC('#oic_wcb_geoc_form_agence').val());
	});
	if(jQueryOIC("#oic_wcb_motif").length){
		jQueryOIC("#oic_wcb_motif").on("select2:select", function (e) {
			jQueryOIC('#spanHiddenService').addClass("spanHidden");
			jQueryOIC('span[aria-labelledby="select2-oic_wcb_motif-container"]').removeClass("error");
			trackingEventTag(jQueryOIC('#oic_wcb_motif').select2('data')[0].text, "1", "OIC-Bouton vert_Telephone");
			trackingClickTag("Telephone-DemandeRappel");
			//affichage formulaire contact
			if(jQueryOIC("#oic_wcb_motif_form").length){
				obtenirCaptcha('oic-wcb-captcha');
				jQueryOIC("#oic_wcb_motif_form").removeClass("oic-display_none_el");
			}
		});
	}
	//A la selection du radio bouton de civilité du formulaire du canal téléphone
	jQueryOIC('input[type=radio][name="oic_telephone_1.oic_telephone_civilite_1"]').change(function() {
		jQueryOIC("#oic_wcb_spanHiddenCivilite").addClass("spanHidden");
	});
	// Au clic sur le lien des mentions CNIL du canal téléphone
	jQueryOIC('#oic_wcb_affichage_mentions_CNIL').change(function() {
		if(jQueryOIC(this).is(":checked")){
			jQueryOIC("#oic_wcb_spanHiddenCnil").addClass("spanHidden");
		}
	 });
	// Au clic sur la case à cocher de la confirmation des mentions CNIL (canal téléphone)
	jQueryOIC("#oic-wcb-lien-cnil").click(function(e){
		if(!jQueryOIC("#oic_wcb_mentions_CNIL").hasClass("oic-display_none_el")){
			jQueryOIC("#oic_wcb_mentions_CNIL").addClass("oic-display_none_el");
		}else {
			jQueryOIC("#oic_wcb_mentions_CNIL").removeClass("oic-display_none_el");
		}
	});

		//Au clic sur le bouton d'accés au service de webcallback
		jQueryOIC('#oic_wcb_lien_service').click(function(){
			trackingClickTag('Telephone - WCB');
			
			if(jQueryOIC('#oic_wcb_motif').select2('data')[0].text == ""){
				jQueryOIC('#spanHiddenService').removeClass("spanHidden");
				jQueryOIC('span[aria-labelledby="select2-oic_wcb_motif-container"]').addClass("error");
			}else{
				jQueryOIC('span[aria-labelledby="select2-oic_wcb_motif-container"]').removeClass("error");
				jQueryOIC('#spanHiddenService').addClass("spanHidden");

				if(jQueryOIC('#oic_wcb_motif').select2('data')[0].text == "Assurances"){
					window.open("https://www.ca-valdefrance.fr/Vitrine/ObjCommun/Fic/ValDeFrance/vitrine/webcallback2015/popup_horaires.htm?url=LnkWcbPopup_assurance", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,top=50,left=50,width=552,height=352");
				}

				else if(jQueryOIC('#oic_wcb_motif').select2('data')[0].text == "Crédit Immobilier"){
					window.open("https://www.ca-valdefrance.fr/Vitrine/ObjCommun/Fic/ValDeFrance/vitrine/webcallback2015/popup_horaires.htm?url=LnkWcbPopup_credit_immo", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,top=50,left=50,width=552,height=352");
				}

				else if(jQueryOIC('#oic_wcb_motif').select2('data')[0].text == "Banque au quotidien"){
					window.open("https://www.ca-valdefrance.fr/Vitrine/ObjCommun/Fic/ValDeFrance/vitrine/webcallback2015/popup_horaires.htm?url=LnkWcbPopup_baq_epargne", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,top=50,left=50,width=552,height=352");
				}

				else if(jQueryOIC('#oic_wcb_motif').select2('data')[0].text == "Epargne"){
					window.open("https://www.ca-valdefrance.fr/Vitrine/ObjCommun/Fic/ValDeFrance/vitrine/webcallback2015/popup_horaires.htm?url=LnkWcbPopup_baq_epargne", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,top=50,left=50,width=552,height=352");
				}

				else if(jQueryOIC('#oic_wcb_motif').select2('data')[0].text == "Crédit à la consommation"){
					window.open("https://www.ca-valdefrance.fr/Vitrine/ObjCommun/Fic/ValDeFrance/vitrine/webcallback2015/popup_horaires.htm?url=LnkWcbPopup_credit_conso", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,top=50,left=50,width=552,height=352");
				}

			}

		});

	/* ****************************************************************************
	 *	Fin: Actions des composants du canal téléphone
	 **************************************************************************** */
	/* ****************************************************************************
	 *	Début: Actions des composants du canal PriseRDV
	 **************************************************************************** */
	// Au clic sur le bouton 'Accéder à vos comptes' du canal priseRDV
	jQueryOIC('#oic_acces_bam_rdv').click(function(){
		trackingClickTag('Prise Rendez-vous – Lien vers BAM');

		jQueryOIC('#bamaccessoic input[name="idtcm"]').val('tcm-1363-389437');

		document.location.href = "javascript:bamv3_validationOIC();";
	});
	// Au clic sur le bouton 'autour de moi' du canal PriseRDV
	jQueryOIC("#oic_rdv_btn_lien_autour_de_moi").click(function(){
		trackingClickTag('Prise Rendez-vous – Recherche Agence - Geolocalisation');
		jQueryOIC("#oic_rdv_geoc_form_agence").val("");
		getLocation(OIC_RDV);
	});
	// Au clic sur le bouton '>' du bloc recherche d'agence du canal PriseRDV
	jQueryOIC("#oic_rdv_btn_lien_autour_de_moi_confirmation").click(function(){
		trackingClickTag('Prise Rendez-vous – Recherche Agence – Saisie manuelle');
		rechercheAgencesRDV(jQueryOIC('#oic_rdv_geoc_form_agence').val());
	});
	//Action onEnterKeyPressed sur le champ de recherche (outil priseRDV)
	jQueryOIC('#oic_rdv_geoc_form_agence').keypress(function (ev) {
		var keycode = (ev.keyCode ? ev.keyCode : ev.which);
		if (keycode == '13') {
			ev.preventDefault();
		}
	});
	//A la sélection d'un motif pour le <select(2)> du canal PriseRDV
	if(jQueryOIC("#oic_rdv_adresser_rdv_agence_form").length){
		jQueryOIC("#oic_rdv_adresser_rdv_agence_form").on("select2:select", function (e) {
			obtenirCaptcha('oic-rdv-captcha');
			jQueryOIC("#oic_rdv_motif_form").removeClass("oic-display_none_el");
			trackingEventTag(jQueryOIC(this).select2('data')[0].text, "1", "OIC-Bouton vert_Prise Rendez-vous");
		});
	}
	//A la selection du radio bouton de civilité du formulaire du canal mail
	jQueryOIC('input[type=radio][name="oic_rdv_1.oic_rdv_civilite_1"]').change(function() {
		jQueryOIC("#oic_rdv_spanHiddenCivilite").addClass("spanHidden");
	 });
	// Au clic sur le lien des mentions CNIL du canal PriseRDV
	jQueryOIC('#oic_rdv_affichage_mentions_CNIL').change(function() {
		if(jQueryOIC(this).is(":checked")){
			jQueryOIC("#oic_rdv_spanHiddenCnil").addClass("spanHidden");
		}
	 });
	// Au clic sur la case à cocher de la confirmation des mentions CNIL (canal PriseRDV)
	jQueryOIC("#oic-rdv-lien-cnil").click(function(e){
		if(!jQueryOIC("#oic_rdv_mentions_CNIL").hasClass("oic-display_none_el")){
			jQueryOIC("#oic_rdv_mentions_CNIL").addClass("oic-display_none_el");
		}else {
			jQueryOIC("#oic_rdv_mentions_CNIL").removeClass("oic-display_none_el");
		}
	});
	/* ****************************************************************************
	 *	Fin: Actions des composants du canal PriseRDV
	 **************************************************************************** */
	initSelect2();
	/* ****************************************************************************
	 *	Début: Géolocalisation
	 **************************************************************************** */
	/**
	 *	Permet d'obtenir la géolocalisation de l'utilisateur afin de lancer la recherche d'agence et de remplir la carte de l'outil renseigné en argument
	 *	@param outil {OIC_MAIL ou OIC_WCB} outil pour lequel la géolocalisation est lancée
	 */
	function getLocation(outil) {
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(
				function(position){
					var outilOIC = outil;
					showPosition(position, outilOIC);
				},
				function(error){
					var outilOIC = outil;
					noGeoloc(error, outilOIC);
				});
		} else {
			if(outil == OIC_MAIL){
				jQueryOIC("#oic_mail_btn_lien_autour_de_moi").addClass("oic_mail_contour_rouge");
				jQueryOIC(" #oic_localisation_agence_message_erreur ").removeClass("oic-display_none_el");
			} else if(outil == OIC_WCB){
				jQueryOIC("#oic_wcb_btn_lien_autour_de_moi").addClass("oic_wcb_contour_rouge");
				jQueryOIC(" #oic_wcb_localisation_agence_message_erreur ").removeClass("oic-display_none_el");
			} else if(outil == OIC_RDV){
				jQueryOIC("#oic_rdv_btn_lien_autour_de_moi").addClass("oic_rdv_contour_rouge");
				jQueryOIC(" #oic_rdv_localisation_agence_message_erreur ").removeClass("oic-display_none_el");
			}
		}
	}
	/**
	 * Récupère la position du navigateur pour lancer la recherche d'agences "autour de moi"
	 * @param position la position du navigateur
	 * @param outil	une des constantes (OIC_MAIL, OIC_WCB, OIC_RDV) relatif au canal concerné
	 */
	function showPosition(position, outil) {
		var lat = position.coords.latitude;
		var lng = position.coords.longitude;
		if(outil == OIC_MAIL){
			map.setCenter(new google.maps.LatLng(lat, lng));
			jQueryOIC("#oic_mail_btn_lien_autour_de_moi").removeClass("oic_mail_contour_rouge");
			jQueryOIC(" #oic_localisation_agence_message_erreur ").addClass("oic-display_none_el");
		} else if(outil == OIC_WCB){
			mapWCB.setCenter(new google.maps.LatLng(lat, lng));
			jQueryOIC("#oic_wcb_btn_lien_autour_de_moi").removeClass("oic_wcb_contour_rouge");
			jQueryOIC(" #oic_wcb_localisation_agence_message_erreur ").addClass("oic-display_none_el");
		} else if(outil == OIC_RDV){
			mapRDV.setCenter(new google.maps.LatLng(lat, lng));
			jQueryOIC("#oic_rdv_btn_lien_autour_de_moi").removeClass("oic_wcb_contour_rouge");
			jQueryOIC(" #oic_rdv_localisation_agence_message_erreur ").addClass("oic-display_none_el");
		}
		var geocoder = new google.maps.Geocoder();
		var latlng = new google.maps.LatLng(lat, lng);
		geocoder.geocode(
			{'latLng': latlng},
			function (results, status) {
				if (status === google.maps.GeocoderStatus.OK) {
					if (results[1]) {
						if(outil == OIC_MAIL){
							rechercheAgences(removeDiacritics(results[1].formatted_address).replace(/\W+/g, "_"));
						} else if(outil == OIC_WCB){
							rechercheAgencesWCB(removeDiacritics(results[1].formatted_address).replace(/\W+/g, "_"));
						} else if(outil == OIC_RDV){
							rechercheAgencesRDV(removeDiacritics(results[1].formatted_address).replace(/\W+/g, "_"));
						}
					} else {
						alert('No results found');
					}
				} else {
					alert('Geocoder failed due to: ' + status);
				}
		});
	}
	/**
	 * Gestion des erreurs lors de la géolocalisation
	 */
	function noGeoloc(error, outil) {
		if (error.code == error.POSITION_UNAVAILABLE){
			alert("Impossible de vous géolocaliser.\nNous vous invitons à saisir votre adresse dans le champ en dessous du bouton \"autour de moi\"");
		} else if (error.code == error.PERMISSION_DENIED){
			if(outil == OIC_MAIL){
				jQueryOIC("#oic_mail_btn_lien_autour_de_moi").addClass("oic_mail_contour_rouge");
				jQueryOIC(" #oic_localisation_agence_message_erreur ").removeClass("oic-display_none_el");
			} else if(outil == OIC_WCB){
				jQueryOIC("#oic_wcb_btn_lien_autour_de_moi").addClass("oic_wcb_contour_rouge");
				jQueryOIC(" #oic_wcb_localisation_agence_message_erreur ").removeClass("oic-display_none_el");
			} else if(outil == OIC_RDV){
				jQueryOIC("#oic_rdv_btn_lien_autour_de_moi").addClass("oic_wcb_contour_rouge");
				jQueryOIC(" #oic_rdv_localisation_agence_message_erreur ").removeClass("oic-display_none_el");
			}
		}
	}
	/* ****************************************************************************
	 *	Fin: Géolocalisation
	 **************************************************************************** */
	/* ****************************************************************************
	 *	Début: Gestion des formulaires
	 **************************************************************************** */
	//Canal Mail
	if(typeof jQueryOIC.validator != "undefined"){
		jQueryOIC.validator.addMethod(
			"regex",
			function(value, element, regexp) {
				if (regexp.constructor != RegExp)
					regexp = new RegExp(regexp);
				else if (regexp.global)
					regexp.lastIndex = 0;
				return this.optional(element) || regexp.test(value);
			},
			"Veuillez saisir un numéro de téléphone valide"
		);
		jQueryOIC.validator.addMethod(
			"valid-date",
			function(value, element) {
				var bits = value.split('/');
				// si la date ne respecte pas le format jj/mm/aaaa, return false
				if(bits.length != 3 || bits[0].length != 2 || bits[1].length != 2 || bits[2].length != 4) return false;
				var d = new Date(bits[2], bits[1] - 1, bits[0]);
				return this.optional(element) || (d && (d.getMonth() + 1) == bits[1] && d.getDate() == Number(bits[0]));
			},
			"Veuillez saisir une date valide au format JJ/MM/AAAA"
		);
	}
	/**
	 *	Soumet le formulaire du canal mail
	 */
	function formOk(){
		var urlAjaxRequest = '//www.ca-valdefrance.fr/FormulairesNationaux/boutonvert/OIC/'+ removeDiacritics(jQueryOIC('#oic_mail_adresser_mail_agence_form :selected').text()).replace(/\W+/g, "_") + '/' + jQueryOIC('#oic_mail_adresser_mail_agence_form :selected').val() + '.jsp';
		var civilite = "";
		if(jQueryOIC("#oic_mail_civilite_m").is(':checked')){
			civilite = "M";
		} else if(jQueryOIC("#oic_mail_civilite_mme").is(':checked')){
			civilite = "Mme";
		}
		if(	jQueryOIC('.oic-mail-form-item').find('input[name="tmp-captcha-value"]').is(':visible') &&
			( typeof jQueryOIC('.oic-mail-form-item').find('input[name="tmp-captcha-value"]').val() == "undefined" || 	!jQueryOIC('.oic-mail-form-item').find('input[name="tmp-captcha-value"]').val().length )
		){
			jQueryOIC('.oic-mail-form-item').find('input[name="tmp-captcha-value"]').removeClass('valid');
			jQueryOIC('.oic-mail-form-item').find('input[name="tmp-captcha-value"]').addClass('error');
			jQueryOIC('.oic-mail-form-item').find('.spanHiddenCaptcha').removeClass('oic-display_none_el');
		}else{
			jQueryOIC.ajax({
				type:'post',
				headers:{'Origin': "//www.ca-valdefrance.fr"},
				url: urlAjaxRequest,
				data: {
					"oic_mail_1.oic_agence_choisie_1": jQueryOIC('[name="oic_mail_1.oic_agence_choisie_1"]').val(),
					"oic_mail_1.oic_mail_civilite_1": civilite,
					"oic_mail_1.oic_mail_prenom_1" : jQueryOIC('[name="oic_mail_1.oic_mail_prenom_1"]').val(),
					"oic_mail_1.oic_mail_nom_1" : jQueryOIC('[name="oic_mail_1.oic_mail_nom_1"]').val(),
					"oic_mail_1.oic_mail_adresse_mail_1" : jQueryOIC('[name="oic_mail_1.oic_mail_adresse_mail_1"]').val(),
					"oic_mail_1.oic_mail_num_telephone_1" : jQueryOIC('[name="oic_mail_1.oic_mail_num_telephone_1"]').val(),
					"oic_mail_1.oic_mail_message_1": jQueryOIC('[name="oic_mail_1.oic_mail_message_1"]').val(),
					"oic_mail_1.routAg-id_eds_agence_1": jQueryOIC('[name="oic_mail_1.routAg-id_eds_agence_1"]').val(),
					"tmp-captcha-value": jQueryOIC('.oic-mail-form-item').find('[name="tmp-captcha-value"]').val(),
					"tmp-captcha-key": jQueryOIC('.oic-mail-form-item').find('[name="tmp-captcha-key"]').val(),
					"oic" : "true"
				},
				success: function(result){
					if(oicMailAgenceParticuliere){
						trackingEventTag(jQueryOIC("#oic_mail_adresser_mail_agence_form").select2('data')[0].text, "2", "OIC-Bouton vert_Email_Agence");
					}else{
						trackingEventTag(jQueryOIC("#oic_mail_adresser_mail_agence_form").select2('data')[0].text, "2", "OIC-Bouton vert_Email_non_Agence");
					}
					jQueryOIC('.oic-mail-form-item').find('input[name="tmp-captcha-value"]').removeClass('error');
					jQueryOIC('.oic-mail-form-item').find('input[name="tmp-captcha-value"]').removeClass('valid');
					jQueryOIC('.oic-mail-form-item').find('.spanHiddenCaptcha').addClass('oic-display_none_el');
					jQueryOIC('#oic_mail_client_ca, #oic_mail_li_motifs, #oic_mail_non_client .oic_mail_h2_titre, #oic_mail_motif_form, #oic_mentions_CNIL, #oic_mail_adresse_agence, #oic_mail_adresser_message_agence_particulier').addClass("oic-display_none_el");
					jQueryOIC('#oic_mail_confirm').removeClass("oic-display_none_el");
				},
				statusCode: {
					442: function() {
						jQueryOIC('.oic-mail-form-item').find('input[name="tmp-captcha-value"]').removeClass('valid');
						jQueryOIC('.oic-mail-form-item').find('input[name="tmp-captcha-value"]').addClass('error')
						jQueryOIC('.oic-mail-form-item').find('.spanHiddenCaptcha').removeClass('oic-display_none_el');
					}
				}
			});
		}
	}
	// Contrôles sur les champs du formulaire du canal mail
	if(jQueryOIC("#oic-mail-form").length){
		jQueryOIC("#oic-mail-form").submit(function(e){
			e.preventDefault();
		}).validate({
			rules: {
				"oic_mail_1.oic_mail_prenom_1": {
				required: true
			},
				"oic_mail_1.oic_mail_nom_1": {
				required: true
			},
				"oic_mail_1.oic_mail_adresse_mail_1": {
				required: true,
				email: true
			},
				"oic_mail_1.oic_mail_num_telephone_1": {
				required: true,
				"regex": /^(0)[0-9]{9}$/
			},
				"oic_mail_1.oic_mail_message_1": {
				required: true
			}
		},
		messages: {
			"oic_mail_1.oic_mail_prenom_1":{
				required: "Veuillez saisir votre prénom",
				minlength:"Votre prénom doit contenir 2 caractères minimum"
			},
			"oic_mail_1.oic_mail_nom_1":{
				required: "Veuillez saisir votre nom",
				minlength:"Votre nom doit contenir 2 caractères minimum"
			},
			"oic_mail_1.oic_mail_adresse_mail_1":{
				required: "Veuillez saisir votre adresse mail",
				email: "Veuillez saisir un mail au format nom@domaine.com"
			},
			"oic_mail_1.oic_mail_num_telephone_1":{
				required: "Veuillez saisir votre téléphone",
				minlength:"Veuillez saisir un numéro de téléphone valide"
			},
			"oic_mail_1.oic_mail_message_1":{
				required: "Veuillez saisir votre message",
				minlength: "Votre message doit contenir 20 caractères minimum"
			}
		},
		invalidHandler: function(event, validator) {
			// 'this' refers to the form
			var errors = validator.numberOfInvalids();
			if (errors) {
				var message = errors == 1
				? 'You missed 1 field. It has been highlighted'
				: 'You missed ' + errors + ' fields. They have been highlighted';
				jQueryOIC("label.error span").html(message);
				jQueryOIC("label.error").show();
				if(!jQueryOIC("#oic_mail_civilite_m").is(':checked')&& !jQueryOIC("#oic_mail_civilite_mme").is(':checked')){
				  jQueryOIC("#spanHiddenCivilite").removeClass("spanHidden");
				}else{
				  jQueryOIC("#spanHiddenCivilite").addClass("spanHidden");
				}
				if(!jQueryOIC("#oic_mail_affichage_mentions_CNIL").is(':checked')){
				  jQueryOIC("#spanHiddenCnil").removeClass("spanHidden");
				}else{
				  jQueryOIC("#spanHiddenCnil").addClass("spanHidden");
				}
				jQueryOIC('.oic-mail-form-item').find('input[name="tmp-captcha-value"]').removeClass('valid');
				if(	jQueryOIC('.oic-mail-form-item').find('input[name="tmp-captcha-value"]').is(':visible') &&
					( typeof jQueryOIC('.oic-mail-form-item').find('input[name="tmp-captcha-value"]').val() == "undefined" || 	!jQueryOIC('.oic-mail-form-item').find('input[name="tmp-captcha-value"]').val().length )
				){
					jQueryOIC('.oic-mail-form-item').find('input[name="tmp-captcha-value"]').addClass('error');
					jQueryOIC('.oic-mail-form-item').find('.spanHiddenCaptcha').removeClass('oic-display_none_el');
				}else{
					jQueryOIC('.oic-mail-form-item').find('input[name="tmp-captcha-value"]').removeClass('error');
					jQueryOIC('.oic-mail-form-item').find('.spanHiddenCaptcha').addClass('oic-display_none_el');
				}
			}
		},
		submitHandler: function(form) {
			if(!jQueryOIC('input[name="oic_mail_1.oic_mail_civilite_1"]:checked').length || !jQueryOIC("#oic_mail_affichage_mentions_CNIL").is(':checked')){
				if(!jQueryOIC('input[name="oic_mail_1.oic_mail_civilite_1"]:checked').length)
					jQueryOIC("#spanHiddenCivilite").removeClass("spanHidden");
				if(!jQueryOIC("#oic_mail_affichage_mentions_CNIL").is(':checked'))
					jQueryOIC("#spanHiddenCnil").removeClass("spanHidden");
			} else{
				jQueryOIC("#spanHiddenCivilite").addClass("spanHidden");
				jQueryOIC("#spanHiddenCnil").addClass("spanHidden");
				jQueryOIC("label.error").hide();
				formOk();
			}
			return false;
		   },
			focusInvalid: true
		});
	}
		  /**********************Accordion form de rappel **************************/
			jQueryOIC(".oic_accordion_form_agence").accordion({
				heightStyle: "content",
				collapsible: true,
				navigation: true,
				fillSpace: true,
				icons: { "header": "ui-icon-chevron-on", "activeHeader": "ui-icon-chevron-off" },
				activate: function(event, ui) {
					jQueryOIC("#oic_wcb_mentions_CNIL").addClass("oic-display_none_el");
				}
			});
		  /***************** fin accordion form de rappel **************************/
	/**
	 *	Soumet le formulaire du canal téléphone
	 */
	function formWcbOk(){
		// le motif du formulaire se trouve dans un <select id="oic_wcb_motif"> quand il y a une liste de motif disponible
		// et dans un <p id="oic_wcb_motif_unique"> quand il n'y en a qu'un
		var motif = "";
		if(jQueryOIC('#oic_wcb_motif').length){
			motif = removeDiacritics(jQueryOIC('#oic_wcb_motif').select2('data')[0].text).replace(/\W+/g, "_");
			idElementMotif = "oic_wcb_motif";
		}else if(jQueryOIC('#oic_wcb_motif_unique').length){
			motif = removeDiacritics(jQueryOIC('#oic_wcb_motif_unique').text()).replace(/\W+/g, "_");
			idElementMotif = "oic_wcb_motif_unique";
		}
		var urlAjaxRequest = '//www.ca-valdefrance.fr/FormulairesNationaux/boutonvert/OIC/WCB/'+ motif + '/p-443612.jsp';
		var civilite = "";
		if(jQueryOIC("#oic_wcb_civilite_m").is(':checked')){
			civilite = "M";
		} else if(jQueryOIC("#oic_wcb_civilite_mme").is(':checked')){
			civilite = "Mme";
		}
		if(	jQueryOIC('.oic-wcb-form-item').find('input[name="tmp-captcha-value"]').is(':visible') &&
			( typeof jQueryOIC('.oic-wcb-form-item').find('input[name="tmp-captcha-value"]').val() == "undefined" || 	!jQueryOIC('.oic-wcb-form-item').find('input[name="tmp-captcha-value"]').val().length )
		){
			jQueryOIC('.oic-wcb-form-item').find('input[name="tmp-captcha-value"]').removeClass('valid');
			jQueryOIC('.oic-wcb-form-item').find('input[name="tmp-captcha-value"]').addClass('error');
			jQueryOIC('.oic-wcb-form-item').find('.spanHiddenCaptcha').removeClass('oic-display_none_el');
		}else{
			jQueryOIC.ajax({
				type:'post',
				headers:{'Origin': "//www.ca-valdefrance.fr"},
				url: urlAjaxRequest,
				data: {
					"oic_telephone_1.oic_telephone_jour_1": jQueryOIC('[name="oic_telephone_1.oic_telephone_jour_1"]').val(),
					"oic_telephone_1.oic_telephone_horaire_1": jQueryOIC('[name="oic_telephone_1.oic_telephone_horaire_1"]').val(),
					"oic_telephone_1.oic_telephone_telephone_1": jQueryOIC('[name="oic_telephone_1.oic_telephone_telephone_1"]').val(),
					"oic_telephone_1.oic_telephone_civilite_1": civilite,
					"oic_telephone_1.oic_telephone_identite_1": jQueryOIC('[name="oic_telephone_1.oic_telephone_identite_1"]').val(),
					"oic_telephone_1.oic_telephone_date_naissance_1": jQueryOIC('[name="oic_telephone_1.oic_telephone_date_naissance_1"]').val(),
					"tmp-captcha-value": jQueryOIC('.oic-wcb-form-item').find('[name="tmp-captcha-value"]').val(),
					"tmp-captcha-key": jQueryOIC('.oic-wcb-form-item').find('[name="tmp-captcha-key"]').val(),
					"oic" : "true"
				},
				success: function(result){
					// le motif du formulaire se trouve dans un <select id="oic_wcb_motif"> quand il y a une liste de motif disponible
					// et dans un <p id="oic_wcb_motif_unique"> quand il n'y en a qu'un
					var motifTracking = "";
					if(jQueryOIC('#oic_wcb_motif').length){
						motifTracking = jQueryOIC('#oic_wcb_motif').select2('data')[0].text;
					}else if(jQueryOIC('#oic_wcb_motif_unique').length){
						motifTracking = jQueryOIC('#oic_wcb_motif_unique').text();
					}
					trackingEventTag(motifTracking, "2", "OIC-Bouton_vert_Telephone");
					jQueryOIC('.oic-wcb-form-item').find('input[name="tmp-captcha-value"]').removeClass('error');
					jQueryOIC('.oic-wcb-form-item').find('input[name="tmp-captcha-value"]').addClass('valid');
					jQueryOIC('.oic-wcb-form-item').find('.spanHiddenCaptcha').addClass('oic-display_none_el');
					jQueryOIC('#oic_wcb_appelez_nous, #oic_wcb_etre_rappelle,#oic_wcb_geoc, #oic-wcb_texte_indisponibilite').addClass("oic-display_none_el");
					jQueryOIC('#oic_wcb_confirm').removeClass("oic-display_none_el");
				},
				statusCode: {
					442: function() {
						jQueryOIC('.oic-wcb-form-item').find('input[name="tmp-captcha-value"]').addClass('error');
						jQueryOIC('.oic-wcb-form-item').find('.spanHiddenCaptcha').removeClass('oic-display_none_el');
					}
				}
			});
		}
	}
	// Contrôle les champs du formulaire du canal téléphone
	if(jQueryOIC("#oic-wcb-form").length){
		jQueryOIC("#oic-wcb-form").submit(function(e){
			e.preventDefault();
			// si on est sur la bam on renseigne automatiquement les champs identite et date de naissance
			if(	typeof OICTOPISBAM != "undefined" && OICTOPISBAM == true && typeof OICTOPBV != "undefined" && OICTOPBV == true){
				if(jQueryOIC('input[name="oic_telephone_1.oic_telephone_identite_1"]').length){
					if(typeof OICLIBCLIENT != "undefined" && OICLIBCLIENT != null){
						jQueryOIC('input[name="oic_telephone_1.oic_telephone_identite_1"]').val(OICLIBCLIENT);
					}else{
						jQueryOIC('input[name="oic_telephone_1.oic_telephone_identite_1"]').val("Libellé client non renseigné");
					}
				}
				if(jQueryOIC('input[name="oic_telephone_1.oic_telephone_date_naissance_1"]').length){
					if(typeof OICTOPDATENAISSANCE != "undefined" && OICTOPDATENAISSANCE != null){
						jQueryOIC('input[name="oic_telephone_1.oic_telephone_date_naissance_1"]').val(bamDateFormatToFrFormat(OICTOPDATENAISSANCE));
					}else{
						jQueryOIC('input[name="oic_telephone_1.oic_telephone_date_naissance_1"]').val('01/01/1901');
					}
				}
			}
		}).validate({
			debug: true,
			rules: {
				"oic_telephone_1.oic_telephone_identite_1": {
					required: true
				},
				"oic_telephone_1.oic_telephone_date_naissance_1":{
					required: true,
					"valid-date": true
				},
				"oic_telephone_1.oic_telephone_telephone_1": {
					required: true,
					"regex": /^(0)[0-9]{9}$/
				}
			},
			messages: {
				"oic_telephone_1.oic_telephone_identite_1": {
					required: "Veuillez saisir votre prénom et nom",
					minlength:"Votre identité doit contenir 2 caractères minimum"
			   },
				"oic_telephone_1.oic_telephone_date_naissance_1":{
					required: "Veuillez saisir votre date de naissance",
					"valid-date": "Veuillez saisir une date de naissance valide au format JJ/MM/AAAA"
			   },
			   "oic_telephone_1.oic_telephone_telephone_1": {
					required: "Veuillez saisir votre téléphone",
					minlength:"Veuillez saisir un numéro de téléphone valide",
					"regex": "Veuillez saisir un numéro de téléphone valide"
			   }
			},
			invalidHandler: function(event, validator) {
				// 'this' refers to the form
				var errors = validator.numberOfInvalids();
				if (errors) {
					var message = errors == 1
					? 'You missed 1 field. It has been highlighted'
					: 'You missed ' + errors + ' fields. They have been highlighted';
				jQueryOIC("label.error span").html(message);
				jQueryOIC("label.error").show();
				if(!jQueryOIC("#oic_wcb_civilite_m").is(':checked')&& !jQueryOIC("#oic_wcb_civilite_mme").is(':checked')){
				   jQueryOIC("#oic_wcb_spanHiddenCivilite").removeClass("spanHidden");
				}else{
				   jQueryOIC("#oic_wcb_spanHiddenCivilite").addClass("spanHidden");
				}
				if(!jQueryOIC("#oic_wcb_affichage_mentions_CNIL").is(':checked')){
				   jQueryOIC("#oic_wcb_spanHiddenCnil").removeClass("spanHidden");
				}else{
				   jQueryOIC("#oic_wcb_spanHiddenCnil").addClass("spanHidden");
				}
				gererErreursSelect2FormWCB();
				jQueryOIC('.oic-wcb-form-item').find('input[name="tmp-captcha-value"]').removeClass('valid');
				if(	jQueryOIC('.oic-wcb-form-item').find('input[name="tmp-captcha-value"]').is(':visible') &&
					( typeof jQueryOIC('.oic-wcb-form-item').find('input[name="tmp-captcha-value"]').val() == "undefined" || 	!jQueryOIC('.oic-wcb-form-item').find('input[name="tmp-captcha-value"]').val().length )
				){
					jQueryOIC('.oic-wcb-form-item').find('input[name="tmp-captcha-value"]').addClass('error');
					jQueryOIC('.oic-wcb-form-item').find('.spanHiddenCaptcha').removeClass('oic-display_none_el');
				}else{
					jQueryOIC('.oic-wcb-form-item').find('input[name="tmp-captcha-value"]').removeClass('error');
					jQueryOIC('.oic-wcb-form-item').find('.spanHiddenCaptcha').addClass('oic-display_none_el');
				}
			   }
			},
			submitHandler: function(form) {
				// si on est sur la bam
				if(typeof OICTOPISBAM != "undefined" && OICTOPISBAM == true && typeof OICTOPBV != "undefined" && OICTOPBV == true){
					if(!jQueryOIC("#oic_wcb_affichage_mentions_CNIL").is(':checked') || jQueryOIC('#oic_wcb_jour').select2('data')[0].text=="" || jQueryOIC('#oic_wcb_horaire').select2('data')[0].text==""){
						if(!jQueryOIC("#oic_wcb_affichage_mentions_CNIL").is(':checked')){
						  jQueryOIC("#oic_wcb_spanHiddenCnil").removeClass("spanHidden");
						}
						gererErreursSelect2FormWCB();
					} else{
						jQueryOIC("#oic_wcb_spanHiddenCnil").addClass("spanHidden");
						jQueryOIC("label.error").hide();
						formWcbOk();
					}
				}
				// si on est sur la vitrine
				else{
					if(	!jQueryOIC('input[name="oic_telephone_1.oic_telephone_civilite_1"]:checked').length ||
						!jQueryOIC("#oic_wcb_affichage_mentions_CNIL").is(':checked') ||
						jQueryOIC('#oic_wcb_jour').select2('data')[0].text=="" ||
						jQueryOIC('#oic_wcb_horaire').select2('data')[0].text==""){
						if(!jQueryOIC('input[name="oic_telephone_1.oic_telephone_civilite_1"]:checked').length){
						 jQueryOIC("#oic_wcb_spanHiddenCivilite").removeClass("spanHidden");
						}
						if(!jQueryOIC("#oic_wcb_affichage_mentions_CNIL").is(':checked')){
						  jQueryOIC("#oic_wcb_spanHiddenCnil").removeClass("spanHidden");
						}
						gererErreursSelect2FormWCB();
					} else{
						jQueryOIC("#oic_wcb_spanHiddenCivilite").addClass("spanHidden");
						jQueryOIC("#oic_wcb_spanHiddenCnil").addClass("spanHidden");
						jQueryOIC("label.error").hide();
						formWcbOk();
					}
				}
			   return false;
			},
			focusInvalid: true
		});
	}
	/**
	 *	Gére l'affichage des message d'erreur lorsque l'utilisateur n'a pas sélectionné d'options
	 *	dans les listes déroulantes du formulaire du canal téléphone
	 */
	function gererErreursSelect2FormWCB(){
		if(jQueryOIC('#oic_wcb_jour').select2('data')[0].text == ""){
			jQueryOIC('span[aria-labelledby="select2-oic_wcb_jour-container"]').addClass("error");
			jQueryOIC('span[aria-labelledby="select2-oic_wcb_jour-container"]').removeClass("valid");
			jQueryOIC("#oic_wcb_spanHiddenJour").removeClass("spanHidden");
		} else {
			jQueryOIC('span[aria-labelledby="select2-oic_wcb_jour-container"]').removeClass("error");
			jQueryOIC('span[aria-labelledby="select2-oic_wcb_jour-container"]').addClass("valid");
			jQueryOIC("#oic_wcb_spanHiddenJour").addClass("spanHidden");
		}
		if(jQueryOIC('#oic_wcb_horaire').select2('data')[0].text == ""){
			jQueryOIC('span[aria-labelledby="select2-oic_wcb_horaire-container"]').addClass("error");
			jQueryOIC('span[aria-labelledby="select2-oic_wcb_horaire-container"]').removeClass("valid");
			jQueryOIC("#oic_wcb_spanHiddenHoraire").removeClass("spanHidden");
		} else{
			jQueryOIC('span[aria-labelledby="select2-oic_wcb_horaire-container"]').removeClass("error");
			jQueryOIC('span[aria-labelledby="select2-oic_wcb_horaire-container"]').addClass("valid");
			jQueryOIC("#oic_wcb_spanHiddenHoraire").addClass("spanHidden");
		}
		 jQueryOIC("#oic_wcb_jour").on("change", function (e) {
			jQueryOIC('span[aria-labelledby="select2-oic_wcb_jour-container"]').removeClass("error");
			jQueryOIC("#oic_wcb_spanHiddenJour").addClass("spanHidden");
			jQueryOIC('span[aria-labelledby="select2-oic_wcb_jour-container"]').addClass("valid");
		});
		jQueryOIC("#oic_wcb_horaire").on("change", function (e) {
			jQueryOIC("#oic_wcb_spanHiddenHoraire").addClass("spanHidden");
			jQueryOIC('span[aria-labelledby="select2-oic_wcb_horaire-container"]').removeClass("error");
			jQueryOIC('span[aria-labelledby="select2-oic_wcb_horaire-container"]').addClass("valid");
		});
	}
	/**
	 *		Soumet le formulaire du canal Prise de rendez-vous
	 */
	function formRdvOk(){
		var urlAjaxRequest = '//www.ca-valdefrance.fr/FormulairesNationaux/boutonvert/OIC/'+ removeDiacritics(jQueryOIC('#oic_rdv_adresser_rdv_agence_form :selected').text()).replace(/\W+/g, "_") + '/' + jQueryOIC('#oic_rdv_adresser_rdv_agence_form :selected').val() + '.jsp';
		var civilite = "";
		if(jQueryOIC("#oic_rdv_civilite_m").is(':checked')){
			civilite = "M";
		} else if(jQueryOIC("#oic_rdv_civilite_mme").is(':checked')){
			civilite = "Mme";
		}
		if(	jQueryOIC('.oic-rdv-form-item').find('input[name="tmp-captcha-value"]').is(':visible') &&
			( typeof jQueryOIC('.oic-rdv-form-item').find('input[name="tmp-captcha-value"]').val() == "undefined" || 	!jQueryOIC('.oic-rdv-form-item').find('input[name="tmp-captcha-value"]').val().length )
		){
			jQueryOIC('.oic-rdv-form-item').find('input[name="tmp-captcha-value"]').addClass('error');
			jQueryOIC('.oic-rdv-form-item').find('.spanHiddenCaptcha').removeClass('oic-display_none_el');
			jQueryOIC('.oic-rdv-form-item').find('input[name="tmp-captcha-value"]').removeClass('valid');
		}else{
			if(	jQueryOIC('.oic-rdv-form-item').find('input[name="tmp-captcha-value"]').is(':visible') &&
				( typeof jQueryOIC('.oic-rdv-form-item').find('input[name="tmp-captcha-value"]').val() == "undefined" || 	!jQueryOIC('.oic-rdv-form-item').find('input[name="tmp-captcha-value"]').val().length )
			){
				jQueryOIC('.oic-rdv-form-item').find('input[name="tmp-captcha-value"]').addClass('error');
				jQueryOIC('.oic-rdv-form-item').find('.spanHiddenCaptcha').removeClass('oic-display_none_el');
			}else{
				jQueryOIC.ajax({
					type:'post',
					headers:{'Origin': "//www.ca-valdefrance.fr"},
					url: urlAjaxRequest,
					data: {
					
						"oic_rdv_1.oic_rdv_agence_1": jQueryOIC('[name="oic_rdv_1.oic_rdv_agence_1"]').val(),
					
						"oic_rdv_1.oic_rdv_civilite_1": civilite,
						"oic_rdv_1.oic_rdv_prenom_1" : jQueryOIC('[name="oic_rdv_1.oic_rdv_prenom_1"]').val(),
						"oic_rdv_1.oic_rdv_nom_1" : jQueryOIC('[name="oic_rdv_1.oic_rdv_nom_1"]').val(),
						"oic_rdv_1.oic_rdv_horaire_1" : jQueryOIC('[name="oic_rdv_1.oic_rdv_horaire_1"]').val(),
						"oic_rdv_1.oic_rdv_date_naissance_1" : jQueryOIC('[name="oic_rdv_1.oic_rdv_date_naissance_1"]').val(),
						"oic_rdv_1.oic_rdv_jour_1" : jQueryOIC('[name="oic_rdv_1.oic_rdv_jour_1"]').val(),
						"oic_rdv_1.oic_rdv_email_1" : jQueryOIC('[name="oic_rdv_1.oic_rdv_email_1"]').val(),
						"oic_rdv_1.oic_rdv_telephone_1" : jQueryOIC('[name="oic_rdv_1.oic_rdv_telephone_1"]').val(),
						"oic_rdv_1.routAg-id_eds_agence_1": jQueryOIC('[name="oic_rdv_1.routAg-id_eds_agence_1"]').val(),
						"oic_rdv_1.oic_agence_choisie_1": jQueryOIC('[name="oic_rdv_1.oic_agence_choisie_1"]').val(),
						"tmp-captcha-value": jQueryOIC('.oic-rdv-form-item').find('[name="tmp-captcha-value"]').val(),
						"tmp-captcha-key": jQueryOIC('.oic-rdv-form-item').find('[name="tmp-captcha-key"]').val(),
						"oic" : "true"
					},
					success: function(result){
						trackingEventTag(jQueryOIC("#oic_rdv_adresser_rdv_agence_form").select2('data')[0].text, "2", "OIC-Bouton vert_Prise Rendez-vous");
						jQueryOIC('.oic-rdv-form-item').find('.spanHiddenCaptcha').addClass('oic-display_none_el');
						jQueryOIC('.oic-rdv-form-item').find('input[name="tmp-captcha-value"]').removeClass('error');
						jQueryOIC('.oic-rdv-form-item').find('input[name="tmp-captcha-value"]').addClass('valid');
						jQueryOIC('#oic_rdv_geoc,#oic_rdv_client_ca, .oic_rdv_h2_titre, #oic_rdv_num_unique, #oic_rdv_mentions_CNIL, #oic_rdv_adresse_agence, #oic_rdv_li_motifs, #oic_rdv_motif_form').addClass("oic-display_none_el");
						jQueryOIC('#oic_rdv_confirm').removeClass("oic-display_none_el");
					},
					statusCode: {
						442: function() {
							jQueryOIC('.oic-rdv-form-item').find('input[name="tmp-captcha-value"]').removeClass('valid');
							jQueryOIC('.oic-rdv-form-item').find('input[name="tmp-captcha-value"]').addClass('error')
							jQueryOIC('.oic-rdv-form-item').find('.spanHiddenCaptcha').removeClass('oic-display_none_el');
						}
					}
				});
			}
		}
	}
	//Contrôles du formulaire du canal PriseRDV
	if(jQueryOIC("#oic-rdv-form").length){
		jQueryOIC("#oic-rdv-form").submit(function(e){e.preventDefault();}).validate({
			debug: true,
			rules: {
		
				"oic_rdv_1.oic_rdv_agence_1": {
					required: true
				},
		
				"oic_rdv_1.oic_rdv_nom_1": {
					required: true
				},
				"oic_rdv_1.oic_rdv_prenom_1": {
					required: true
				},
				"oic_rdv_1.oic_rdv_date_naissance_1":{
					required: true,
					"valid-date": true
				},
			   "oic_rdv_1.oic_rdv_telephone_1": {
					required: true,
					"regex": /^(0)[0-9]{9}$/
				},
				"oic_rdv_1.oic_rdv_email_1":{
			   		required: true,
					email: true
				}
			},
			 messages: {
		
				"oic_rdv_1.oic_rdv_agence_1": {
					required: "Veuillez saisir l'agence que vous souhaitez contacter",
					minlength:"Le nom de l'agence à contacter doit contenir 2 caractères minimum"
				},
		
				"oic_rdv_1.oic_rdv_nom_1": {
					required: "Veuillez saisir votre nom",
					minlength:"Votre identité doit contenir 2 caractères minimum"
				},
				"oic_rdv_1.oic_rdv_prenom_1": {
					required: "Veuillez saisir votre prénom",
					minlength:"Votre identité doit contenir 2 caractères minimum"
				},
				"oic_rdv_1.oic_rdv_date_naissance_1":{
					required: "Veuillez saisir votre date de naissance",
					"valid-date": "Veuillez saisir une date valide au format JJ/MM/AAAA"
				},
				"oic_rdv_1.oic_rdv_email_1":{
					required: "Veuillez saisir votre adresse mail",
					email: "Veuillez saisir un mail au format nom@domaine.com"
					},
				"oic_rdv_1.oic_rdv_telephone_1": {
					required: "Veuillez saisir votre téléphone",
					minlength:"Veuillez saisir un numéro de téléphone valide",
					"regex": "Veuillez saisir un numéro de téléphone valide"
				}
			 },
			 invalidHandler: function(event, validator) {
				// 'this' refers to the form
				var errors = validator.numberOfInvalids();
				if (errors) {
					var message = errors == 1
					? 'You missed 1 field. It has been highlighted'
					: 'You missed ' + errors + ' fields. They have been highlighted';
					jQueryOIC("label.error span").html(message);
					jQueryOIC("label.error").show();
					 if(!jQueryOIC("#oic_rdv_civilite_m").is(':checked')&& !jQueryOIC("#oic_rdv_civilite_mme").is(':checked')){
						jQueryOIC("#oic_rdv_spanHiddenCivilite").removeClass("spanHidden");
					}else{
					   jQueryOIC("#oic_rdv_spanHiddenCivilite").addClass("spanHidden");
					}
					if(!jQueryOIC("#oic_rdv_affichage_mentions_CNIL").is(':checked')){
					   jQueryOIC("#oic_rdv_spanHiddenCnil").removeClass("spanHidden");
					}else{
					   jQueryOIC("#oic_rdv_spanHiddenCnil").addClass("spanHidden");
					}
					gererErreursSelect2FormRDV();
					if(	jQueryOIC('.oic-rdv-form-item').find('input[name="tmp-captcha-value"]').is(':visible') &&
						( typeof jQueryOIC('.oic-rdv-form-item').find('input[name="tmp-captcha-value"]').val() == "undefined" || 	!jQueryOIC('.oic-rdv-form-item').find('input[name="tmp-captcha-value"]').val().length )
					){
						jQueryOIC('.oic-rdv-form-item').find('input[name="tmp-captcha-value"]').addClass('error');
						jQueryOIC('.oic-rdv-form-item').find('.spanHiddenCaptcha').removeClass('oic-display_none_el');
					}else{
						jQueryOIC('.oic-rdv-form-item').find('input[name="tmp-captcha-value"]').removeClass('error');
						jQueryOIC('.oic-rdv-form-item').find('.spanHiddenCaptcha').addClass('oic-display_none_el');
					}
				}
			},
			submitHandler: function(form) {
				if(	!jQueryOIC('input[name="oic_rdv_1.oic_rdv_civilite_1"]:checked').length ||
					!jQueryOIC("#oic_rdv_affichage_mentions_CNIL").is(':checked') ||
					jQueryOIC('#oic_rdv_jour').select2('data')[0].text=="" ||
					jQueryOIC('#oic_rdv_horaire').select2('data')[0].text==""){
					if(!jQueryOIC('input[name="oic_rdv_1.oic_rdv_civilite_1"]:checked').length){
					 jQueryOIC("#oic_rdv_spanHiddenCivilite").removeClass("spanHidden");
					}
					if(!jQueryOIC("#oic_rdv_affichage_mentions_CNIL").is(':checked')){
					  jQueryOIC("#oic_rdv_spanHiddenCnil").removeClass("spanHidden");
					}
					gererErreursSelect2FormRDV();
				} else{
					jQueryOIC("#oic_rdv_spanHiddenCivilite").addClass("spanHidden");
					jQueryOIC("#oic_rdv_spanHiddenCnil").addClass("spanHidden");
					jQueryOIC("label.error").hide();
					formRdvOk();
				}
			   return false;
			},
			focusInvalid: true
		   });
	}
	/**
	 *	Gére l'affichage des message d'erreur lorsque l'utilisateur n'a pas sélectionné d'options
	 *	dans les listes déroulantes du formulaire du canal prise de rendez-vous
	 */
   function gererErreursSelect2FormRDV(){
		if(jQueryOIC('#oic_rdv_jour').select2('data')[0].text == ""){
			jQueryOIC('span[aria-labelledby="select2-oic_rdv_jour-container"]').addClass("error");
			jQueryOIC('span[aria-labelledby="select2-oic_rdv_jour-container"]').removeClass("valid");
			jQueryOIC("#oic_rdv_spanHiddenJour").removeClass("spanHidden");
		} else {
			jQueryOIC('span[aria-labelledby="select2-oic_rdv_jour-container"]').removeClass("error");
			jQueryOIC('span[aria-labelledby="select2-oic_rdv_jour-container"]').addClass("valid");
			jQueryOIC("#oic_rdv_spanHiddenJour").addClass("spanHidden");
		}
		if(jQueryOIC('#oic_rdv_horaire').select2('data')[0].text == ""){
			jQueryOIC('span[aria-labelledby="select2-oic_rdv_horaire-container"]').addClass("error");
			jQueryOIC('span[aria-labelledby="select2-oic_rdv_horaire-container"]').removeClass("valid");
			jQueryOIC("#oic_rdv_spanHiddenHoraire").removeClass("spanHidden");
		} else{
			jQueryOIC('span[aria-labelledby="select2-oic_rdv_horaire-container"]').removeClass("error");
			jQueryOIC('span[aria-labelledby="select2-oic_rdv_horaire-container"]').addClass("valid");
			jQueryOIC("#oic_rdv_spanHiddenHoraire").addClass("spanHidden");
		}
		 jQueryOIC("#oic_rdv_jour").on("change", function (e) {
			jQueryOIC('span[aria-labelledby="select2-oic_rdv_jour-container"]').removeClass("error");
			jQueryOIC("#oic_rdv_spanHiddenJour").addClass("spanHidden");
			jQueryOIC('span[aria-labelledby="select2-oic_rdv_jour-container"]').addClass("valid");
		});
		jQueryOIC("#oic_rdv_horaire").on("change", function (e) {
			jQueryOIC("#oic_rdv_spanHiddenHoraire").addClass("spanHidden");
			jQueryOIC('span[aria-labelledby="select2-oic_rdv_horaire-container"]').removeClass("error");
			jQueryOIC('span[aria-labelledby="select2-oic_rdv_horaire-container"]').addClass("valid");
		});
	}
});
});
});
});
});
}
