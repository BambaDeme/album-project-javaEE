let images = document.querySelectorAll(".openCaroussel");
for (image of images) {
  image.addEventListener("click", function () {
    console.log("hii");
  });
}

$("#galleryModal").on("show.bs.modal", function (e) {
  //get data-id attribute of the clicked element
  //console.log(e);
  //let imageId = $(e.relatedTarget).data("id");
  //   console.log(imageId);
  //populate the textbox
  // $(e.currentTarget).find('input[name="bookId"]').val(bookId);
});
