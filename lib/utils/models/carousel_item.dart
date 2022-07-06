class CarouselItem {
  String location;
  CarouselItem(this.location);
  static List<CarouselItem> get carouselItems => [
        CarouselItem("assets/images/slider_img1.jpeg"),
        CarouselItem("assets/images/slider_img2.jpeg"),
        CarouselItem("assets/images/slider_img3.jpeg"),
        CarouselItem("assets/images/slider_img4.jpeg")
      ];
}
