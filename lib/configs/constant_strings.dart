import 'package:myportfolio/model/project_info.dart';
import 'package:myportfolio/model/showcase_project.dart';
import 'package:myportfolio/configs/constant_icons.dart'; // Added for kiPerson, kiTag, etc.

/// constant strings are prefixed with [ks]
const String ksFontFamily = "Poppins";

/// Project Description List
final List<ShowcaseProject> ksShowcaseProjects = [
  // Updated DodecaCopter Project
  ShowcaseProject(
    title: 'Built a light weight yet powerfull Dodeca Copter',
    heroTag: 'copter',
    image: 'assets/dodecaCopter.jpg',
    shortDescription:
        "A self-designed DodecaCopter built for the Oprahat competition at IIT Bombay, utilizing Naze32 and Betaflight.",
    description:
        "I along with my team built a DodecaCopter for Oprahat competition organized IIT Bombay on December 2017. We utilized the self-designed framework using Palmwood as the material. For Flight Control Board, we used Naze32 and used Betaflight as our Flight Controller Software(Firmware).",
    link: ProjectInfo.empty(),
    tags: ProjectInfo(
        icon: kiTag,
        label: 'Tags',
        contents: ['Robotics', 'Hardware', 'Competition']),
    tech: ProjectInfo(
        icon: kiChip,
        label: 'Tech Stack',
        contents: ['Naze32', 'Betaflight', 'Palmwood (Frame)']),
    author:
        ProjectInfo(icon: kiPerson, label: 'Role', contents: ['Team Member']),
    platform: ProjectInfo(
        icon: kiCode, label: 'Platform', contents: ['Embedded System']),
  ),

  // New Projects Start Here
  ShowcaseProject(
    title: 'CommandDash: API/SDK Integration Co-pilot',
    heroTag: 'command-dash',
    image: 'assets/project_placeholder.jpg',
    shortDescription:
        "Developed CommandDash, an AI-powered API/SDK integration co-pilot used by 25k developers, featuring a robust microservices backend.",
    description:
        "Built CommandDash (API/SDK integration co-pilot) that served 25,000 devs globally while at Welltested AI. Handled backend design and development involving Flask, PostgreSQL, RabbitMQ, Celery, Azure, LLMs, LangChain. Implemented micro-services architecture for offloading long-running asynchronous processes.",
    link: ProjectInfo.empty(),
    tags: ProjectInfo(icon: kiTag, label: 'Tags', contents: [
      'AI',
      'Developer Tools',
      'Backend',
      'Microservices',
      'Code Generation'
    ]),
    tech: ProjectInfo(icon: kiChip, label: 'Tech Stack', contents: [
      'Python',
      'Flask',
      'PostgreSQL',
      'RabbitMQ',
      'Celery',
      'Azure',
      'LLMs',
      'LangChain'
    ]),
    author: ProjectInfo(
        icon: kiPerson, label: 'Role', contents: ['Founding Engineer']),
    platform: ProjectInfo(
        icon: kiCode, label: 'Platform', contents: ['Web Service', 'AI']),
  ),
  ShowcaseProject(
    title: 'Prompt-based Flutter Integration Test Code Generation',
    heroTag: 'flutter-test-gen',
    image: 'assets/project_placeholder.jpg',
    shortDescription:
        "Created a solution for generating Flutter integration tests from prompts using multi-modal LLMs and GraphDB.",
    description:
        "Developed a prompt-based Flutter integration test code generation solution at Welltested AI. Utilized multi-modal LLMs and GraphDB to achieve high generation accuracy.",
    link: ProjectInfo.empty(),
    tags: ProjectInfo(icon: kiTag, label: 'Tags', contents: [
      'AI',
      'Developer Tools',
      'Code Generation',
      'Flutter',
      'Testing'
    ]),
    tech: ProjectInfo(
        icon: kiChip,
        label: 'Tech Stack',
        contents: ['Python', 'Multi-modal LLMs', 'GraphDB', 'Flutter', 'Dart']),
    author: ProjectInfo(
        icon: kiPerson, label: 'Role', contents: ['Founding Engineer']),
    platform: ProjectInfo(
        icon: kiCode,
        label: 'Platform',
        contents: ['AI Tool', 'Mobile Testing']),
  ),
  ShowcaseProject(
    title: 'Web Scraping Framework for CommandDash',
    heroTag: 'web-scraper-commanddash',
    image: 'assets/project_placeholder.jpg',
    shortDescription:
        "Developed a versatile web scraping framework using Playwright for the CommandDash project.",
    description:
        "Built a web scraping framework for CommandDash at Welltested AI, capable of scraping simple and complex websites effectively using the Playwright library.",
    link: ProjectInfo.empty(),
    tags: ProjectInfo(
        icon: kiTag,
        label: 'Tags',
        contents: ['Web Scraping', 'Automation', 'Developer Tools']),
    tech: ProjectInfo(
        icon: kiChip, label: 'Tech Stack', contents: ['Python', 'Playwright']),
    author: ProjectInfo(
        icon: kiPerson, label: 'Role', contents: ['Founding Engineer']),
    platform: ProjectInfo(
        icon: kiCode, label: 'Platform', contents: ['Backend Library']),
  ),
  ShowcaseProject(
    title: 'LLM-driven RAG and Custom Training System',
    heroTag: 'llm-rag-training',
    image: 'assets/project_placeholder.jpg',
    shortDescription:
        "Engineered and led development of advanced LLM RAG systems, custom training pipelines, and prompt engineering strategies.",
    description:
        "Led AI initiatives at Welltested AI, focusing on: Training LLMs on custom data and developing advanced RAG algorithms; Implementing sophisticated prompt engineering techniques; Designing context-aware chunking and data structuring methodologies. Oversaw LLM-driven distillation and embedding model training, significantly boosting RAG retrieval accuracy. Evaluated Graph RAG approaches and various open models like Mistral, StarCoder, and CodeLlama for code generation tasks.",
    link: ProjectInfo.empty(),
    tags: ProjectInfo(icon: kiTag, label: 'Tags', contents: [
      'AI',
      'LLM',
      'RAG',
      'Machine Learning',
      'NLP',
      'Code Generation'
    ]),
    tech: ProjectInfo(icon: kiChip, label: 'Tech Stack', contents: [
      'Python',
      'LLMs (Mistral, StarCoder, CodeLlama)',
      'RAG',
      'LangChain',
      'Prompt Engineering',
      'Vector DBs'
    ]),
    author: ProjectInfo(
        icon: kiPerson,
        label: 'Role',
        contents: ['Founding Engineer', 'AI Lead']),
    platform: ProjectInfo(
        icon: kiCode, label: 'Platform', contents: ['AI Systems', 'Backend']),
  ),
  ShowcaseProject(
    title: 'Real-time Metabolic Health Analytics (Dietosure)',
    heroTag: 'dietosure-analytics',
    image: 'assets/project_placeholder.jpg',
    shortDescription:
        "Developed a pioneering real-time metabolic health analytics platform using CGM data, leading data science efforts.",
    description:
        "Built one of the world's first real-time analytics solutions for metabolic health at Dietosure Labs. Leveraged CGM (Continuous Glucose Monitoring) to empower 500+ users with lifestyle insights. Led the Data Science domain: architected data pipelines, performed Exploratory Data Analysis (EDTA), generated shareable reports, and built statistical and Deep Learning models.",
    link: ProjectInfo.empty(),
    tags: ProjectInfo(icon: kiTag, label: 'Tags', contents: [
      'HealthTech',
      'AI',
      'Data Science',
      'Real-time Analytics',
      'IoT'
    ]),
    tech: ProjectInfo(icon: kiChip, label: 'Tech Stack', contents: [
      'Python',
      'Pandas',
      'NumPy',
      'Scikit-learn',
      'TensorFlow/PyTorch',
      'Data Pipelines'
    ]),
    author: ProjectInfo(
        icon: kiPerson,
        label: 'Role',
        contents: ['Founding Engineer', 'Data Science Lead']),
    platform: ProjectInfo(
        icon: kiCode,
        label: 'Platform',
        contents: ['AI System', 'Health Platform']),
  ),
  ShowcaseProject(
    title: 'AI-driven Personalized Health Recommendations',
    heroTag: 'ai-health-recommendations',
    image: 'assets/project_placeholder.jpg',
    shortDescription:
        "Created an AI system for personalized dietary and lifestyle recommendations based on comprehensive user data.",
    description:
        "Designed an AI-based system at Dietosure Labs that considers user demographics, health data, lifestyle habits, and real-time parameters (e.g., heart rate, activity quality). The system analyzes this data to understand the user's body type and habits, generating tailored dietary and lifestyle recommendations.",
    link: ProjectInfo.empty(),
    tags: ProjectInfo(
        icon: kiTag,
        label: 'Tags',
        contents: ['HealthTech', 'AI', 'Personalization', 'Machine Learning']),
    tech: ProjectInfo(icon: kiChip, label: 'Tech Stack', contents: [
      'Python',
      'Machine Learning',
      'Deep Learning',
      'Statistical Modeling'
    ]),
    author: ProjectInfo(
        icon: kiPerson, label: 'Role', contents: ['Founding Engineer']),
    platform: ProjectInfo(
        icon: kiCode,
        label: 'Platform',
        contents: ['AI System', 'Health Platform']),
  ),
  ShowcaseProject(
    title: 'Dietosure Mobile (iOS/Android) & Web Platform',
    heroTag: 'dietosure-app-web',
    image: 'assets/project_placeholder.jpg',
    shortDescription:
        "Developed the Dietosure mobile apps (Flutter) and web console with Firebase backend.",
    description:
        "Built the cross-platform (Android & iOS) mobile application and a web-based console for Dietosure Labs. Utilized the Flutter framework for the frontend and Firebase for the backend infrastructure.",
    link: ProjectInfo.empty(),
    tags: ProjectInfo(icon: kiTag, label: 'Tags', contents: [
      'Mobile Development',
      'Web Development',
      'Flutter',
      'HealthTech'
    ]),
    tech: ProjectInfo(
        icon: kiChip,
        label: 'Tech Stack',
        contents: ['Flutter', 'Dart', 'Firebase']),
    author: ProjectInfo(
        icon: kiPerson, label: 'Role', contents: ['Founding Engineer']),
    platform: ProjectInfo(
        icon: kiCode,
        label: 'Platform',
        contents: ['Mobile App (iOS/Android)', 'Web App']),
  ),
  ShowcaseProject(
    title: 'Custom Dart NFC Package for CGM Data Reading',
    heroTag: 'dart-nfc-cgm',
    image: 'assets/project_placeholder.jpg',
    shortDescription:
        "Developed a custom Dart package for NFC-based CGM data reading on Android and iOS.",
    description:
        "Evaluated various NFC standards and protocols to build a custom Dart package at Dietosure Labs. This package provided essential NFC functionality for the Dietosure app to read CGM (Continuous Glucose Monitor) values on both Android and iOS platforms.",
    link: ProjectInfo.empty(),
    tags: ProjectInfo(icon: kiTag, label: 'Tags', contents: [
      'Mobile Development',
      'Dart',
      'NFC',
      'Hardware Integration',
      'HealthTech'
    ]),
    tech: ProjectInfo(
        icon: kiChip,
        label: 'Tech Stack',
        contents: ['Dart', 'Flutter (Plugin)', 'NFC APIs (Android/iOS)']),
    author: ProjectInfo(
        icon: kiPerson, label: 'Role', contents: ['Founding Engineer']),
    platform: ProjectInfo(
        icon: kiCode,
        label: 'Platform',
        contents: ['Dart Package', 'Mobile Library']),
  ),
  ShowcaseProject(
    title: 'Vision Aid For Blind People',
    heroTag: 'vision-aid-blind',
    image: 'assets/project_placeholder.jpg',
    shortDescription:
        "Created a vision aid prototype using CNNs and RNNs to recognize objects/text and provide audio output for the visually impaired.",
    description:
        "Developed a prototype at LinuxWorld Informatics capable of recognizing people, objects, and handwritten words, converting the output into audio. Applied CNN and a combination of CNN and RNN (with CTC loss function) to achieve the desired accuracy. Achieved 65%+ accuracy for each model by using transfer learning and a multi-model approach for different use cases.",
    link: ProjectInfo.empty(),
    tags: ProjectInfo(
        icon: kiTag,
        label: 'Tags',
        contents: ['AI', 'Computer Vision', 'Deep Learning', 'Social Impact']),
    tech: ProjectInfo(icon: kiChip, label: 'Tech Stack', contents: [
      'Python',
      'TensorFlow/Keras',
      'CNN',
      'RNN',
      'CTC Loss',
      'OpenCV'
    ]),
    author: ProjectInfo(icon: kiPerson, label: 'Role', contents: ['Developer']),
    platform: ProjectInfo(
        icon: kiCode,
        label: 'Platform',
        contents: ['AI Prototype', 'Desktop Application']),
  ),
  ShowcaseProject(
    title: 'NVIDIA End-to-End Self-Driving Car Model Implementation',
    heroTag: 'nvidia-self-driving',
    image: 'assets/project_placeholder.jpg',
    shortDescription:
        "Implemented NVIDIA's end-to-end self-driving car model, focusing on dataset enhancement and bias reduction.",
    description:
        "Implemented NVIDIA's End-to-End Self Driving approach as described in their research paper 'End-to-End Learning for Self-Driving Cars' during college. Enhanced dataset quality and diversity by employing advanced data augmentation techniques to optimize model training. Balanced the dataset by ensuring an even distribution of images across all labels, effectively reducing data bias and improving model performance.",
    link: ProjectInfo.empty(),
    tags: ProjectInfo(icon: kiTag, label: 'Tags', contents: [
      'AI',
      'Deep Learning',
      'Autonomous Vehicles',
      'Computer Vision',
      'Academic Project'
    ]),
    tech: ProjectInfo(icon: kiChip, label: 'Tech Stack', contents: [
      'Python',
      'TensorFlow/Keras',
      'Deep Learning (CNN)',
      'Computer Vision',
      'Data Augmentation'
    ]),
    author: ProjectInfo(
        icon: kiPerson, label: 'Role', contents: ['Student Researcher']),
    platform: ProjectInfo(
        icon: kiCode, label: 'Platform', contents: ['AI Model', 'Research']),
  ),
  ShowcaseProject(
    title: 'GAN for Realistic Human Face Generation',
    heroTag: 'gan-human-faces',
    image: 'assets/project_placeholder.jpg',
    shortDescription:
        "Developed a GAN using Tensorflow to generate high-quality, realistic human faces with 93% accuracy.",
    description:
        "Built a model to generate realistic human faces using a Generative Adversarial Network (GAN) at MBM Engineering College. Used the Tensorflow framework and achieved 93% quality/accuracy in generated images.",
    link: ProjectInfo.empty(),
    tags: ProjectInfo(icon: kiTag, label: 'Tags', contents: [
      'AI',
      'Deep Learning',
      'GAN',
      'Computer Vision',
      'Academic Project'
    ]),
    tech: ProjectInfo(icon: kiChip, label: 'Tech Stack', contents: [
      'Python',
      'TensorFlow',
      'GAN',
      'Deep Learning',
      'Computer Vision'
    ]),
    author: ProjectInfo(
        icon: kiPerson, label: 'Role', contents: ['Student Researcher']),
    platform: ProjectInfo(
        icon: kiCode, label: 'Platform', contents: ['AI Model', 'Research']),
  ),
  ShowcaseProject(
    title: 'App Country Origin Detector',
    heroTag: 'app-country-detector',
    image: 'assets/project_placeholder.jpg',
    shortDescription:
        "Built an Android app to detect the origin country of apps, using Firestore backend and a Python scraper for metadata.",
    description:
        "Created an Android native app at MBM Engineering College to enable users to determine the country of origin of other installed apps. Used Cloud Firestore (Firebase) for the backend database to handle potentially heavy traffic. Developed a Python script for web scraping to fetch app metadata, which reduced data retrieval latency by 40% compared to manual methods.",
    link: ProjectInfo.empty(),
    tags: ProjectInfo(icon: kiTag, label: 'Tags', contents: [
      'Mobile Development',
      'Android',
      'Firebase',
      'Web Scraping',
      'Academic Project'
    ]),
    tech: ProjectInfo(icon: kiChip, label: 'Tech Stack', contents: [
      'Android (Java/Kotlin)',
      'Cloud Firestore',
      'Python',
      'Web Scraping'
    ]),
    author: ProjectInfo(
        icon: kiPerson, label: 'Role', contents: ['Student Developer']),
    platform: ProjectInfo(
        icon: kiCode,
        label: 'Platform',
        contents: ['Android App', 'Mobile Application']),
  ),
];
