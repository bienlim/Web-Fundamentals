$( function() {
    handle_drag();
    $("Button").click(function(){
        $("#starthere").after('<div class="draggable" class="ui-widget-content">'+
                '<input placeholder="Title here" class="ui-widget-header">'+
                '<textarea placeholder="Description Here"></textarea>'+
            '</div>');
            handle_drag(this);
    });
  } );

function handle_drag(){
    $( ".draggable" ).draggable();

    $( ".column" ).sortable({
        connectWith: ".column",
        handle: ".portlet-header",
        cancel: ".portlet-toggle",
        placeholder: "portlet-placeholder ui-corner-all"
      });
   
      $( ".portlet" )
        .addClass( "ui-widget ui-widget-content ui-helper-clearfix ui-corner-all" )
        .find( ".portlet-header" )
          .addClass( "ui-widget-header ui-corner-all" )
          .prepend( "<span class='ui-icon ui-icon-minusthick portlet-toggle'></span>");
   
      $( ".portlet-toggle" ).on( "click", function() {
        var icon = $( this );
        icon.toggleClass( "ui-icon-minusthick ui-icon-plusthick" );
        icon.closest( ".portlet" ).find( ".portlet-content" ).toggle();
      });
};

