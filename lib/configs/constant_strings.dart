import 'package:myportfolio/model/project_info.dart';

import '../model/showcase_project.dart';

/// constant strings are prefixed with [ks]
const String ksFontFamily = "Poppins";

/// Project Description List
final List<ShowcaseProject> ksShowcaseProjects = [
  ShowcaseProject(
      title: 'Deep learning model for MNIST digits',
      heroTag: 'mnist-project',
      image: 'assets/deepLearningProject.jpg',
      shortDescription: '',
      description:
          """The project was aimed at developing a Neural Network model that is able to recognise the hand digit recognition from scratch and to improve its efficiency by hyper tuning the parameters and other optimisation in the model. We extracted and pre-processed the MNIST Data from Courant Institute, NYU and implemented via Multi-Layer Neural Network, Logistic Regression model and Simple Perceptron model. We thoroughly researched and worked on every model and their functions to figure out what works best for achieving better accuracy.""",
      link: ProjectInfo.empty(),
      tags: ProjectInfo.empty(),
      tech: ProjectInfo.empty(),
      author: ProjectInfo.empty(),
      platform: ProjectInfo.empty()),
  ShowcaseProject(
      title: 'App built on flutter framework',
      heroTag: 'flutter-app',
      image: 'assets/flutterApp.jpg',
      shortDescription: '',
      description:
          """I built an interesting game using the flutter framework as my personal project. The game proceeds by asking user the set of questions and then predicting the personality type. The game utilizes complex algorithms to predict the personality type.""",
      link: ProjectInfo.empty(),
      tags: ProjectInfo.empty(),
      tech: ProjectInfo.empty(),
      author: ProjectInfo.empty(),
      platform: ProjectInfo.empty()),
  ShowcaseProject(
      title: 'App built using native android',
      heroTag: 'native-app',
      image: 'assets/androidNativeApp.jpg',
      shortDescription: '',
      description:
          """I along with my teammate researched and developed android application to monitor glucose level of the user. The app visualize glucose data in graphical manner and helps the user get better insights about the glucose variation.""",
      link: ProjectInfo.empty(),
      tags: ProjectInfo.empty(),
      tech: ProjectInfo.empty(),
      author: ProjectInfo.empty(),
      platform: ProjectInfo.empty()),
  ShowcaseProject(
      title: 'Developed web site on HTML and CSS',
      heroTag: 'web-site',
      image: 'assets/webDevelopmentProject.jpg',
      shortDescription: '',
      description:
          """I developed Website as the one of my project during my 2 month summer internship(Jun 2019 - July 2019) at the Linux World Informatics PVT Ltd with the help of HTML and CSS for frontend and python as backend for industry automation by autommating the tasks needed in the IT industry.""",
      link: ProjectInfo.empty(),
      tags: ProjectInfo.empty(),
      tech: ProjectInfo.empty(),
      author: ProjectInfo.empty(),
      platform: ProjectInfo.empty()),
  ShowcaseProject(
      title: 'Built a light weight yet powerfull Dodeca Copter',
      heroTag: 'copter',
      image: 'assets/dodecaCopter.jpg',
      shortDescription: '',
      description:
          """I along with my team built a DodecaCopter for Oprahat competition organized IIT Bombay on December 2017. We utilized the self-designed framework using Palmwood as the material. For Flight Control Board, we used Naze32 and used Betaflight as our Flight Controller Software(Firmware).""",
      link: ProjectInfo.empty(),
      tags: ProjectInfo.empty(),
      tech: ProjectInfo.empty(),
      author: ProjectInfo.empty(),
      platform: ProjectInfo.empty()),
];
