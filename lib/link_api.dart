class ApiLink{

//baseurl
//  add your base url
// image
static const String imgapi ="$baseurl/upload";
static const String cateimag="$imgapi/categories";
static const String itemsimag ="$imgapi/items";


//auth 
static const String signup ="$baseurl/auth/signup.php";
static const String verifycodesign ="$baseurl/auth/verifycode.php";
static const String login ="$baseurl/auth/login.php";
static const String checkmail ="$baseurl/forgetpass/checkemail.php";
static const String verifycode ="$baseurl/forgetpass/verifycode.php";
static const String resetpass ="$baseurl/forgetpass/resetpass.php";

// app
static const String homepage ="$baseurl/app/home.php";
static const String items ="$baseurl/items/items.php";

// favourite

// favourite

static const String favadd ="$baseurl/favourite/add.php";
static const String favremove ="$baseurl/favourite/remove.php";
static const String favview ="$baseurl/favourite/view.php";

//cart
static const String addtocart ="$baseurl/cart/add.php";
static const String removefromcart ="$baseurl/cart/remove.php";
static const String viewcart ="$baseurl/cart/view.php";
static const String cartcountitems ="$baseurl/cart/countitems.php";


static const String search ="$baseurl/items/search.php";







}