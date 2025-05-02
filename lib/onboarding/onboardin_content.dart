class OnboardingContent {
  String image;
  String title;
  String description;

  OnboardingContent(
      {required this.image, required this.title, required this.description});
}

List<OnboardingContent> content = [
  OnboardingContent(
    image:
        'https://www.elluminatiinc.com/wp-content/uploads/2020/07/blog/prominentfeatures.png',
    title: 'Order Groceries Anytime, Anywhere',
    description:
        "With TNGPC, you can ditch the grocery store runs. Order fresh produce,\\ pantry staples, and household essentials straight from your phone at your convenience.",
  ),
  OnboardingContent(
    image:
        'https://img.freepik.com/premium-vector/cargo-boxed-packages-delivery-concepts_662093-294.jpg',
    title: 'Track Your Order Status',
    description:
        " Never wonder where your groceries are again. TNGPC's live order tracking keeps you updated on your delivery status.",
  ),
  OnboardingContent(
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTASiGJniK2JsX7l_1K8lZTuq2Y7QrrLS7O4Q&usqp=CAU',
    title: 'Save Precious Time',
    description:
        " Plus, say goodbye to long checkout lines and save precious time.",
  ),
  OnboardingContent(
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJ7ZPKG_UacoPEL06wORCeoCQNwNZDcDfQ1Q&usqp=CAU',
    title: ' Tap to Add & To increase the quantity!',
    description:
        "Adding items to your cart is a breeze. Just tap on any product to increase the quantity and add it to your order.",
  ),
];
