// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require moment
//= require activestorage
//= require popper
//= require turbolinks
//= require jquery3
//= require sortable/sorttable.js
//= require bootstrap
//= require jquery.mask
//= require nested_form_fields
//= require_tree .

var ready = function() {
  $(".sortable").addSortWidget();

  $('.mask-phone-fix').mask("(99) 9999-9999");
  $('.mask-phone-cel').mask("(99) 99999-9999");
  $('.mask-date').mask("99/99/9999");
  $('.mask-cep').mask("99999-999");
  $('.mask-cpf').mask("999.999.999-99");
  
  $(function () {
    $('[data-toggle="tooltip"]').tooltip()
  })
};

if (typeof Turbolinks == "undefined") {
  $(document).ready(ready);
} else {
  $(document).on("turbolinks:load", ready);
}

function calcular_qtd_de_anos_relacionado_data_atual(data){
  var d = new Date,
  ano_atual = d.getFullYear(),
  mes_atual = d.getMonth() + 1,
  dia_atual = d.getDate(),
  split = data.split('/'),
  novadata = split[1] + "/" +split[0]+"/"+split[2],
  data_americana = new Date(novadata),
  vAno = data_americana.getFullYear(),
  vMes = data_americana.getMonth() + 1,
  vDia = data_americana.getDate(),
  ano_aniversario = +vAno,
  mes_aniversario = +vMes,
  dia_aniversario = +vDia,
  quantos_anos = ano_atual - ano_aniversario;
if (mes_atual < mes_aniversario || mes_atual == mes_aniversario && dia_atual < dia_aniversario) {
  quantos_anos--;
}
return quantos_anos < 0 ? 0 : quantos_anos;

}

function validaCPF(cpf) {
  cpf = cpf.replace('.','');
  cpf = cpf.replace('.','');
  cpf = cpf.replace('-','');
  
  erro = new String;
  if (cpf.length < 11) erro += "Sao necessarios 11 digitos para verificacao do CPF! \n\n"; 
  var nonNumbers = /\D/;
  if (nonNumbers.test(cpf)) erro += "A verificacao de CPF suporta apenas numeros! \n\n";  
  if (cpf == "00000000000" || cpf == "11111111111" || cpf == "22222222222" || cpf == "33333333333" || cpf == "44444444444" || cpf == "55555555555" || cpf == "66666666666" || cpf == "77777777777" || cpf == "88888888888" || cpf == "99999999999"){
    erro += "Numero de CPF invalido!"
  }
  var a = [];
  var b = new Number;
  var c = 11;
  for (i=0; i<11; i++){
    a[i] = cpf.charAt(i);
    if (i <  9) b += (a[i] *  --c);
  }
  if ((x = b % 11) < 2) { a[9] = 0 } else { a[9] = 11-x }
  b = 0;
  c = 11;
  for (y=0; y<10; y++) b += (a[y] *  c--); 
  if ((x = b % 11) < 2) { a[10] = 0; } else { a[10] = 11-x; }
  status = a[9] + ""+ a[10]
  if ((cpf.charAt(9) != a[9]) || (cpf.charAt(10) != a[10])){
    erro +="Digito verificador com problema!";
  }
  if (erro.length > 0){
    return false;
  }
  return true;
}

function validaEmail(email) {
  var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
  return regex.test(email);
}

//function contador_regressivo(data, idElement, horas_adicinais){
//   setInterval(function() {
//     var dtfim = moment(data, "DD/MM/YYYY hh:mm:ss");
//     dtfim.add(horas_adicinais,'hours');
//     var at = moment(new Date(), "DD/MM/YYYY hh:mm:ss");
//     var distance = dtfim.diff(at, 'seconds');
//     var days = Math.floor(distance / (60 * 60 * 24));
//     var hours = Math.floor((distance % (60 * 60 * 24)) / (60 * 60));
//     var minutes = Math.floor((distance % (60 * 60)) / (60));
//     var seconds = Math.floor((distance % (60)));
//     valor = (distance > 0) ? "<span style='font-size:14px' class='label label-info'>" + hours + ":" + minutes + ":" + seconds + "</span>": "<span style='font-size:14px' class='label label-danger'>EXPIRADO</span>";
    
//     if(distance => 0){
//       var data_inicial = moment(data, "DD/MM/YYYY hh:mm");
//       var data_atual = at;//moment(new Date(), "DD/MM/YYYY hh:mm");
      
//       atrazo = data_atual.diff(data_inicial);

//       var day = 1000 * 60 * 60 * 24;
//       var days = Math.floor(atrazo/day);
//       var months = Math.floor(days/31);
//       var years = Math.floor(months/12);
//       days =  days - (Math.floor(days/30)*30)
//       message = ''; 
//       if(years>0){
//         text = " ano ";
//         if(years > 1) 
//           text = " anos ";
//         message += years + text;
//       }
//       if(months>0){
//         text = " mes ";
//         if(months > 1)
//           text = " meses ";
//         message += months + text;
//       }
//       if(days>0){
//         text = " dia ";
//         if(days > 1)
//           text = " dias ";
//         message += days + text;
//       }
//       valor = message;//"<span style='font-size:14px' class='label label-danger'>"+message+"</span>";
//     }
//     $("#"+idElement).html("<h1>"+months+"</h1>");
//   }, 1000);
// }

function contador_regressivo(data, idElemento){
//var countDownDate = new Date("Jan 5, 2021 15:37:25").getTime();
//var countDownDate = new Date("05/11/2021 23:59:59").getTime();
var countDownDate = new Date(data).getTime();

  // Update the count down every 1 second
  var x = setInterval(function() {
    var now = new Date().getTime();
    var distance = countDownDate - now;
  
    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((distance % (1000 * 60)) / 1000);

    var contar_horas;
    contar_horas = days > 0 ? days * 24 : 0;

    parseInt(hours) + parseInt(contar_horas)

    $("#"+idElemento).html(contar_horas+hours + "h " + minutes + "m " + seconds + "s ");
      
    // // If the count down is over, write some text 
    // if (distance < 0) {
    //   clearInterval(x);
    //   $("#"+idElemento).html("EXPIRED");
    // }
  }, 1000);
}