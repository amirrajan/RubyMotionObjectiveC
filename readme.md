# Blog Entry Codified

Working example of: https://www.clayallsopp.com/posts/mixing-objective-c-and-ruby/

# Join the RubyMotion Slack Channel #

[Here is the link.](http://motioneers.herokuapp.com/) Say hello!

# Minimum Requirements #

The minimum requirements to use this template are XCode 9.2 and
RubyMotion 5.0.

Keep in mind that if you've recently upgraded from a previous versions
of XCode or RubyMotion, you'll want to run `rake clean:all` as opposed
to just `rake clean`.

# Build #

To build using the default simulator, run: `rake` (alias `rake
simulator`).

To run on a specific type of simulator. You can run `rake simulator
device_name="SIMULATOR"`. Here is a list of simulators available:

- `rake simulator device_name='iPhone 5s'`
- `rake simulator device_name='iPhone 8 Plus'`
- `rake simulator device_name='iPhone 8 Plus'`
- `rake simulator device_name='iPhone X'`
- `rake simulator device_name='iPad Pro (9.7-inch)'`
- `rake simulator device_name='iPad Pro (10.5-inch)'`
- `rake simulator device_name='iPad Pro (12.9-inch)'`

Consider using https://github.com/KrauseFx/xcode-install (and other
parts of FastLane) to streamline management of simulators,
certificates, and pretty much everything else.

So, for example, you can run `rake simulator device_name='iPhone X'`
to see what your app would look like on iPhone X.

# Deploying to the App Store #

To deploy to the App Store, you'll want to use `rake clean
archive:distribution`. With a valid distribution certificate.

In your `Rakefile`, set the following values:

```ruby
#This is only an example, the location where you store your provisioning profiles is at your discretion.
app.codesign_certificate = "iPhone Distribution: xxxxx" #This is only an example, you certificate name may be different.

#This is only an example, the location where you store your provisioning profiles is at your discretion.
app.provisioning_profile = './profiles/distribution.mobileprovision'
```

For TestFlight builds, you'll need to include the following line
(still using the distribution certificates):

```ruby
app.entitlements['beta-reports-active'] = true
```

# Icons #

As of iOS 11, Apple requires the use of Asset Catalogs for defining
icons and launch screens. You'll find icon and launch screen templates
under `./resources/Assets.xcassets`. You can run the following script
to generate all the icon sizes (once you've specified `1024x1024.png`).
Keep in mind that your `.png` files _cannot_ contain alpha channels.

Save this following script to `./gen-icons.sh` and run it:

```sh
set -x

brew install imagemagick

pushd resources/Assets.xcassets/AppIcon.appiconset/

cp 1024x1024.png "20x20@2x.png"
cp 1024x1024.png "20x20@3x.png"
cp 1024x1024.png "29x29@2x.png"
cp 1024x1024.png "29x29@3x.png"
cp 1024x1024.png "40x40@2x.png"
cp 1024x1024.png "40x40@3x.png"
cp 1024x1024.png "60x60@2x.png"
cp 1024x1024.png "60x60@3x.png"
cp 1024x1024.png "20x20~ipad.png"
cp 1024x1024.png "20x20~ipad@2x.png"
cp 1024x1024.png "29x29~ipad.png"
cp 1024x1024.png "29x29~ipad@2x.png"
cp 1024x1024.png "40x40~ipad.png"
cp 1024x1024.png "40x40~ipad@2x.png"
cp 1024x1024.png "76x76~ipad.png"
cp 1024x1024.png "76x76~ipad@2x.png"
cp 1024x1024.png "83.5x83.5~ipad@2x.png"

mogrify -resize 40x40 "20x20@2x.png"
mogrify -resize 60x60 "20x20@3x.png"
mogrify -resize 58x58 "29x29@2x.png"
mogrify -resize 87x87 "29x29@3x.png"
mogrify -resize 80x80 "40x40@2x.png"
mogrify -resize 120x120 "40x40@3x.png"
mogrify -resize 120x120 "60x60@2x.png"
mogrify -resize 180x180 "60x60@3x.png"
mogrify -resize 20x20 "20x20~ipad.png"
mogrify -resize 40x40 "20x20~ipad@2x.png"
mogrify -resize 29x29 "29x29~ipad.png"
mogrify -resize 58x58 "29x29~ipad@2x.png"
mogrify -resize 40x40 "40x40~ipad.png"
mogrify -resize 80x80 "40x40~ipad@2x.png"
mogrify -resize 76x76 "76x76~ipad.png"
mogrify -resize 152x152 "76x76~ipad@2x.png"
mogrify -resize 167x167 "83.5x83.5~ipad@2x.png"

popd
```

For more information about Asset Catalogs, refer to this link: https://developer.apple.com/library/content/documentation/Xcode/Reference/xcode_ref-Asset_Catalog_Format/

# How to Call Objective-C Methods within RubyMotion #
To call an Objective-C method within RubyMotion, follow these steps:
1. Create a 'vendor' directory within the top-level directory of your project.
2. Create a directory within the vendor directory with the title of your class.
3. Create a header and implementation file within the directory you created in step 2
(className.h and className.m, respectively).
4. `#import` any frameworks you'll be needing at the top of the header file and describe your class.
5. `#import` your header file at the top of your implementation file and define your class with its methods.
6. Call your newly-created Objective-C method using the `className.methodName(args)` syntax within your `.rb` files.

This is extremely helpful because it allows you to work with methods/types that aren't implemented in RubyMotion but are in Objective-C.
You can call the method from RubyMotion, perform any computation needed within the method, then return RubyMotion-friendly data.

One application you may find this useful in is when you find a method that RubyMotion doesn't have implemented yet.
You can go to the BridgeSupport files of RubyMotion in `/Library/RubyMotion/data/ios/<your_ios_version_number>/BridgeSupport`.
From there, you can search for your method or type using `ag -l <typeName>`, and you'll be shown the bridge support files
for the frameworks that have that method/type. Open up these bridge support files using the text editor of your
choosing and you can see what the method expects as arguments and its return type. 

From here, simply implement your Objective-C method by utilizing the specifications you found in the bridge support files. Then call
your new method from your RubyMotion code.
