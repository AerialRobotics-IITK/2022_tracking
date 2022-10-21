#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include <opencv2/highgui/highgui.hpp>
#include <cv_bridge/cv_bridge.h>


cv::Mat roi_image;
int counter = 0;
void imageCallback(const sensor_msgs::ImageConstPtr &msg)
{

  // Pointer used for the conversion from a ROS message to
  // an OpenCV-compatible image
  cv_bridge::CvImagePtr cv_ptr;
  //   int key = cv.waitKey(1)
  //     if(key == ord('q')){
  //     cv.destroyAllWindows();
  //     break;
  // }

  try
  {
    
    // Convert the ROS message
    cv_ptr = cv_bridge::toCvCopy(msg, "bgr8");

    // Store the values of the OpenCV-compatible image
    // into the current_frame variable
    cv::Mat current_frame = cv_ptr->image;

    if (counter < 1)
    {
      cv::Mat roi_image = current_frame;
      cv::Rect2d r = selectROI(roi_image);
      cv::Mat imCrop = roi_image(r);
      cv::imshow("ROI Cropped Image", imCrop);
      counter++;
    }

    // // Display the current frame
    cv::imshow("Live view", current_frame);

    // // Display frame for 30 milliseconds
    cv::waitKey(30);
    // if (cv::waitKey(0) & 0xFF == 113){
    //   break;
    // }
  }
  catch (cv_bridge::Exception &e)
  {
    ROS_ERROR("Could not convert from '%s' to 'bgr8'.", msg->encoding.c_str());
  }
}

int main(int argc, char **argv)
{
  // The name of the node
  ros::init(argc, argv, "webcam_pub");

  // Default handler for nodes in ROS
  ros::NodeHandle nh;

  // Used to publish and subscribe to images
  image_transport::ImageTransport it(nh);
  // Subscribe to the /camera topic
  image_transport::Subscriber sub = it.subscribe("/firefly/camera_nadir/image_raw", 10, imageCallback);

  // Make sure we keep reading new video frames by calling the imageCallback function
  ros::spin();

  // Close down OpenCV
  cv::destroyWindow("view");
}