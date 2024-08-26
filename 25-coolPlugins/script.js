$( function() {
    handle_drag();
function handle_drag(){
    $( ".draggable" ).draggable();
};



   $( function() {
    var dialog, form,
 
      // From http://www.whatwg.org/specs/web-apps/current-work/multipage/states-of-the-type-attribute.html#e-mail-state-%28type=email%29
      noteTitle = $( "#noteTitle" ),
      noteText = $( "#noteText" ),
      noteTab = $( "#noteTab" ),
      noteColor = $( "#noteColor" ),
      allFields = $( [] ).add( noteTitle ).add( noteText ).add( noteTab )


 

 
    function addNote() {
      var valid = true;
      allFields.removeClass( "ui-state-error" );
 
      if ( valid ) {
        //alert("#"+noteColor.val());
        $( "#"+noteTab.val() ).append( '<div class="draggable ui-widget-content '
            + noteColor.val() 
            +'"> <h5>'
            + noteTitle.val() 
            + '</h5> <p>'
            + noteText.val() 
            +'</p>');
        dialog.dialog( "close" );
        handle_drag(this);
      }
      return valid;
    }
 
    dialog = $( "#dialog-form" ).dialog({
      autoOpen: false,
      height: 400,
      width: 350,
      modal: true,
      buttons: {
        "Create new Note": addNote,
        Cancel: function() {
          dialog.dialog( "close" );
        }
      },
      close: function() {
        form[ 0 ].reset();
        allFields.removeClass( "ui-state-error" );
      }
    });
 
    form = dialog.find( "form" ).on( "submit", function( event ) {
      event.preventDefault();
      addNote();
    });
 
    $( "#newNote" ).button().on( "click", function() {
      dialog.dialog( "open" );
    });
    })
})