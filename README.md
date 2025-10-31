# ros2_parrot_arsdk
This is a ROS2 -jazzy rewrite derived from the original foxy rewriten by https://github.com/jeremyfix/ros2_parrot_arsdk br Jeremyfix

A colcon wrapper around the Parrot ARSDK. 

## Dependencies

```
sudo apt install libavahi-client-dev
```

## Installation

For the installation :

```
cd ~/ros2_ws/src
git clone https://github.com/BraJavSa/ros2_parrot_arsdk src/ros2_parrot_arsdk
cd ros2_ws/src/ros2_parrot_arsdk
mkdir build
cd build
cmake ..
make
```
