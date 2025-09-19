class AppImages {
  static const _imgFolder = 'assets/images';
  static const _iconFolder = 'assets/icons';

  static const logoImage = '$_imgFolder/icon_app.png';
  static const enIcon = '$_iconFolder/en_icon.png';
  static const egIcon = '$_iconFolder/eg_icon.png';
  static const forgetPassImg = '$_imgFolder/forgetPassword.png';
  static const userImage = '$_imgFolder/user.png';
  static const phoneImage = '$_imgFolder/phone.png';
  static const emptyImage = '$_imgFolder/empty_image.png';
  static const availableNow = '$_imgFolder/available_now.png';
  static const watchNow = '$_imgFolder/watch_now_text.png';

  static List<String> movieImages = List.generate(
    8,
    (index) => '$_imgFolder/movie_${index + 1}.png',
  );
  static List<String> movieImagesTest = List.filled(
    10,
     '$_imgFolder/movie_4.png',
  );

  static List<String> avatarList = List.generate(
    9,
    (index) => '$_imgFolder/avatar${index + 1}.png',
  );

  static const mailIcon = '$_iconFolder/mail_icon.svg';
  static const passIcon = '$_iconFolder/password_icon.svg';
  static const googleIcon = '$_iconFolder/google_icon.svg';
  static const nameIcon = '$_iconFolder/name_icon.svg';
  static const phoneIcon = '$_iconFolder/phone.svg';

  static List<String> selectedNavBarIcons = List.generate(
    4,
    (index) => '$_iconFolder/selected_${index + 1}.svg',
  );
  static List<String> unSelectedNavBarIcons = List.generate(
    4,
    (index) => '$_iconFolder/un_selected_${index + 1}.svg',
  );

  static const String placeholderErrorImage =
      "https://www.centerforempathy.org/wp-content/uploads/2019/11/placeholder.png";
}
