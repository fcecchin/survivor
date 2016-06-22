$("#tags a.add_fields").
  data("association-insertion-position", 'before').
  data("association-insertion-node", 'this');

$('#tags').on('cocoon:after-insert',
     function() {
         $(".project-tag-fields a.add_fields").
             data("association-insertion-position", 'before').
             data("association-insertion-node", 'this');
         $('.project-tag-fields').on('cocoon:after-insert',
              function() {
                $(this).children("#tag_from_list").remove();
                $(this).children("a.add_fields").hide();
              });
     });