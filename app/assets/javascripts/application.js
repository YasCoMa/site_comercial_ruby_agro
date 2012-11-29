// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


function reveza(qq){
	document.getElementById(qq).className="item_2"
}
function volta(qq){
	document.getElementById(qq).className="item"
}

function showDiv( idName, value ){  
	objDiv = document.getElementById( idName );  
	if ( value )  
		objDiv.style.display = "";  
	else  
		objDiv.style.display = "none";  
}

function troca_campos (){
	name=document.getElementById('produto_tipo_prod').value;
	
	if (name=='alimento'){
	    showDiv('ali', true);
		showDiv('med', false);
		showDiv('ace', false);
	}
	if (name=='medicamento'){
	    showDiv('ali', false);
		showDiv('med', true);
		showDiv('ace', false);
	}
	if (name=='acessorio'){
	    showDiv('ali', false);
		showDiv('med', false);
		showDiv('ace', true);
	}
}

function mostra_pedido_byEstado (estado){
	if (estado=='aberto'){
		showDiv('aberto', true);
		showDiv('pagando', false);
		showDiv('entregando', false);
		showDiv('fechado', false);
		showDiv('all_orders', false);
	}
	if (estado=='pagando'){
		showDiv('aberto', false);
		showDiv('pagando', true);
		showDiv('entregando', false);
		showDiv('fechado', false);
		showDiv('all_orders', false);
	}
	if (estado=='entregando'){
		showDiv('aberto', false);
		showDiv('pagando', false);
		showDiv('entregando', true);
		showDiv('fechado', false);
		showDiv('all_orders', false);
	}
	if (estado=='fechado'){
		showDiv('aberto', false);
		showDiv('pagando', false);
		showDiv('entregando', false);
		showDiv('fechado', true);
		showDiv('all_orders', false);
	}
	if (estado=='all_orders'){
		showDiv('aberto', false);
		showDiv('pagando', false);
		showDiv('entregando', false);
		showDiv('fechado', false);
		showDiv('all_orders', true);
	}
}

function mostra_esconde(id){
    if(document.getElementById(id).style.display=="none") {
		document.getElementById(id).style.display = "";
	}
	else {
		document.getElementById(id).style.display = "none";
	}
}

