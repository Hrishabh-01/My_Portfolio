class CertificateUtils {
  final String image;
  final String title;
  final String organization;
  final String date;
  final String? driveLink;

  CertificateUtils({
    required this.image,
    required this.title,
    required this.organization,
    required this.date,
    this.driveLink,
  });
}

// ###############
// Certificates
List<CertificateUtils> workCertificateUtils = [
  CertificateUtils(
    image: 'assets/images/certi1.png',
    title: 'Introduction to Cybersecurity',
    organization:
    ' Cisco Networking Academy',
    date:'29 May 2023',
    driveLink:
    'https://drive.google.com/file/d/1xmjn4xrVuj7pMnHxki7c4QRDyQRvUlLf/view?usp=sharing',
  ),
  CertificateUtils(
    image: 'assets/images/certi2.png',
    title: 'PCAP: Programming Essentials in Python',
    organization:
    'Cisco Networking Academy',
    date:'26 Dec 2022',
    driveLink: 'https://drive.google.com/file/d/1_pcIot85_abpRN61OQ0IzoeQv3bfp78M/view?usp=sharing',
  ),
  CertificateUtils(
    image: 'assets/images/certi3.png',
    title: 'CPA: Programming Essentials in C++',
    organization:
    'Cisco Networking Academy',
    date:'26 Dec 2022',
    driveLink: 'https://drive.google.com/file/d/120EYSs1SGCVaEuJAtVQ_2ufiC-yJRl8U/view?usp=sharing',
  ),
  CertificateUtils(
    image: 'assets/images/certi4.png',
    title: 'CCNAv7: Introduction to Networks',
    organization:
    'Cisco Networking Academy',
    date:'13 May 2024',
    driveLink: 'https://drive.google.com/file/d/1HmGRWLVRQykRQWg_6T0Fgi2KmSjp3ApH/view?usp=sharing',
  ),
];