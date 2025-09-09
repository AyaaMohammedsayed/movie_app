class AppTexts {
  static const loginSuccess = 'Login Successfully';
  static const loginFailed = 'Invalid Email or Password';
  static const mailName = 'E-mail';
  static const passName = 'Password';
  static const nameName = 'Name';
  static const confirmPassName = 'Confirm Password';
  static const phoneName = 'Phone Number';
  static const forgetPass = 'Forget Password?';
  static const login = 'Login';
  static const dntHaveAccount = "Don't Have Account ?";
  static const alreadyHaveAccount = "Already Have Account ?";
  static const createOne = 'Create One';
  static const or = 'Or';
  static const googleLogin = 'Login With Google';
  static const deleteAccount = 'Delete Account';
  static const updataAccount = 'Updata Data';
  static const verifyEmail = 'Verify Email';
  static const pickAvatar = 'Pick Avatar';
  static const restPass = 'Reset Password';
  static const registerSuccess = 'Create Account Successfully';
  static const registerFailed = 'Create Account Failed';
  static const register = 'Register';
  static const createAccount = 'Create Account';

}

class AppImages {
  static const _imgFolder = 'assets/images';
  static const _iconFolder = 'assets/icons';

  static const logoImage = '$_imgFolder/icon_app.png';
  static const enIcon = '$_iconFolder/en_icon.png';
  static const egIcon = '$_iconFolder/eg_icon.png';
  static const forgetPassImg = '$_iconFolder/forgetPassword.png';
  static const userImage = '$_imgFolder/user.png';
  static const phoneImage = '$_imgFolder/phone.png';

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
}
