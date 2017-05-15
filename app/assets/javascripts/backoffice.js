//= require bootstrap_sb_admin_base_v2
//= require bootbox
//= require bootstrap-filestyle

$(document).ready(function(){

/* Preview photos */
function readURL(input) {

    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#image_preview').attr('src', e.target.result);
        }

        reader.readAsDataURL(input.files[0]);
    }
}

$("#image_field").change(function(){
    readURL(this);
});

/* sobrescreve o data cofirm do rails*/
  $.rails.allowAction = function(element) {
    var message = element.attr('data-confirm');
    if (!message) { return true; }

    var opts = {
      title: "Confirmação",
      message: message,
      buttons: {
          confirm: {
              label: 'Sim',
              className: 'btn-success'
          },
          cancel: {
              label: 'Não',
              className: 'btn-danger'
          }
      },
      callback: function(result) {
        if (result) {
          element.removeAttr('data-confirm');
          element.trigger('click.rails')
        }
      }
    };

    bootbox.confirm(opts);

    return false;
  }


  $('#indexTable').DataTable({
      language: {
                  "sEmptyTable": "Nenhum registro encontrado",
                  "sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ registros",
                  "sInfoEmpty": "Mostrando 0 até 0 de 0 registros",
                  "sInfoFiltered": "(Filtrados de _MAX_ registros)",
                  "sInfoPostFix": "",
                  "sInfoThousands": ".",
                  "sLengthMenu": "_MENU_ resultados por página",
                  "sLoadingRecords": "Carregando...",
                  "sProcessing": "Processando...",
                  "sZeroRecords": "Nenhum registro encontrado",
                  "sSearch": "Pesquisar",
                  "oPaginate": {
                      "sNext": "Próximo",
                      "sPrevious": "Anterior",
                      "sFirst": "Primeiro",
                      "sLast": "Último"
                  },
                  "oAria": {
                      "sSortAscending": ": Ordenar colunas de forma ascendente",
                      "sSortDescending": ": Ordenar colunas de forma descendente"
                  }
                }});



/* MAKE TOKEN FOR QRCODE */

$('#generate_token').click(function(){
  $('#token').val($('#client').val() + "&" + $('#validity').val() + "&" +
                  $('#value').val() + "&" + $('#date_time').val());
});

$('option').addClass("dropdown-item");

/* FILE FIELD */
$(":file").filestyle({input: false});
$(":file").filestyle({buttonBefore: true});
$(":file").filestyle('buttonText','Buscar Imagem');
$(":file").filestyle('buttonName','btn-primary');
$(":file").filestyle('placeholder', 'vazio.jpg');


/* CAROUSEL FULL SCREEN FOR PRESENTATIONS */
var $item = $('.carousel .item');
var $wHeight = $(window).height();
$item.eq(0).addClass('active');
$item.height($wHeight);
$item.addClass('full-screen');

$('.carousel img').each(function() {
  var $src = $(this).attr('src');
  var $color = $(this).attr('data-color');
  $(this).parent().css({
    'background-image' : 'url(' + $src + ')',
    'background-color' : $color
  });
  $(this).remove();
});

$(window).on('resize', function (){
  $wHeight = $(window).height();
  $item.height($wHeight);
});

$('.carousel').carousel({
  interval: 3000,
  pause: "false"
});



});

/**/
