import 'package:flutter/material.dart';

abstract class AppConstants {
  static const String appTitle = "TASKFORCE HR";
  static List<String> homeTabs = [
    "Attendance",
    "E-Leave",
    "Announcement",
    "Events",
    "Profile"
  ];

  static const String savedUser = "currentuser";

  static String inTapCalenderTitle = "Calender:";
  static const String appFontFamily = "poppins";
  static const String savedAppLanguage = "savedAppLanguage";

  ///Firebase Data
  static String usersCollection = "users";
  static String attendanceRecordCollection = "attendanceRecord";
  static String attendanceStaffCollection = "/Tabs/attendance/staff";
  static String announcementCollection = "/Tabs/announcement/posts";
  static String eventsCollection = "/Tabs/events/posts";
  static String noPhotoUser = "NOPHOTO";
  static String sampleBase64Image = "NOPHOTO";

  static List<String> profileCardsName = [
    "Modify Account",
    "Notifications",
    "Report a problem",
    "Share",
    "Logout"
  ];
  static List<IconData> profileCardsIcons = [
    Icons.edit_attributes_outlined,
    Icons.notifications_active_outlined,
    Icons.report_problem_outlined,
    Icons.offline_share,
    Icons.door_back_door_outlined,
  ];
}
