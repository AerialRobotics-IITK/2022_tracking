#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/harshit/2022_tracking/src/rotors_simulator/rqt_rotors"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/harshit/2022_tracking/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/harshit/2022_tracking/install/lib/python3/dist-packages:/home/harshit/2022_tracking/build/rqt_rotors/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/harshit/2022_tracking/build/rqt_rotors" \
    "/usr/bin/python3" \
    "/home/harshit/2022_tracking/src/rotors_simulator/rqt_rotors/setup.py" \
     \
    build --build-base "/home/harshit/2022_tracking/build/rqt_rotors" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/harshit/2022_tracking/install" --install-scripts="/home/harshit/2022_tracking/install/bin"
