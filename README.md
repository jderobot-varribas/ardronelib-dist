ardronelib
==========

CMake installer for **ARDroneLib**.

It will install *ARDroneSDK 2.0.1* dependency for *ardrone_server*

Install
-------
* Create a build directory
  ```
  mkdir -p build && cd build
  ```

* Build it:
  ```
  cmake ..
  make
  sudo make install
  ```

## Additional Notes
* Remove it with: `make uninstall`
* You can also create a debian package with: `make package`
* Check install state with: `ls -ld /usr/local/{include,lib}/jderobot/ardrone`
