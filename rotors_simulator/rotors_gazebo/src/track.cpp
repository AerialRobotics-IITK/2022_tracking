// #include <ros/ros.h>
// #include <image_transport/image_transport.h>
// #include <opencv2/highgui/highgui.hpp>
// #include <cv_bridge/cv_bridge.h>

// #define MINTRACKAREA 50

// using namespace cv;
// Mat Tracker::trackhusky(VideoCapture cap){

// Mat frame;
		
// //Resize large images to reduce processing load
// cap >> frame;
//  //Convert RGB to HSV colormap
// //and apply Gaussain blur
// Mat hsvFrame;
// cvtColor(frame, hsvFrame, CV_RGB2HSV);
// blur(hsvFrame, hsvFrame, cv::Size(1, 1));
// //Threshold 
// Scalar lowerBound = cv::Scalar(0, 0, 0);
// Scalar upperBound = cv::Scalar(180, 255, 30 );
// Mat threshFrame;
// inRange(hsvFrame, lowerBound, upperBound, threshFrame);
// //Calculate X,Y centroid
// Moments m = moments(threshFrame, false);
// Point com(m.m10 / m.m00, m.m01 / m.m00);
// //Draw crosshair
// Scalar color = cv::Scalar(0, 0, 255);
// drawMarker(frame, com, color, cv::MARKER_CROSS, 50, 5);

// imshow("husky", frame);
// imshow("Thresholded husky", threshFrame);

// return threshFrame;
// };
    