$( document ).on("turbolinks:load", function() {
    if($("#destroyCourseRating").length > 0) {
        $(document).on("click", "#destroyCourseRating", function() {
            const id = $(this).data("id");
            const title = "Deseja excluir avaliação?";
            const message = "Essa ação não poderá ser desfeita.";
            alertify.confirm(title, message,
                function(){
                    $.ajax({
                        url: "/course_ratings/" + id,
                        data: { authenticity_token: $('[name="csrf-token"]')[0].content},
                        method: 'DELETE',
                    });
                },
                function(){ alertify.success('Sua avaliação está a salvo.')});
        });
    }
});
