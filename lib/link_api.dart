class ApiLink{

//baseurl
static const String baseurl ="https://just4funecho.000webhostapp.com/ecommerce";

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

static const String addressadd ="$baseurl/address/add.php";
static const String addressdelete ="$baseurl/address/delete.php";
static const String addressupdate ="$baseurl/address/update.php";
static const String addressview ="$baseurl/address/view.php";






}