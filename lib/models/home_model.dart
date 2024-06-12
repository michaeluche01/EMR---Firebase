
class HomeModel {
  final String name;
  final String svgPath;

  HomeModel({
    required this.name,
    required this.svgPath,
  });

  static List<HomeModel> getHomeGrid() {
    List<HomeModel> home = [];

    home.add(HomeModel(
      name: 'Appointment\nSchedule',
      svgPath: 'svg/appointment.svg',
    ));

    home.add(HomeModel(
      name: 'Treatment\nHistory',
      svgPath: 'svg/occupied-bed.svg',
    ));

    home.add(HomeModel(
      name: 'Lab\nReport',
      svgPath: 'svg/microscope.svg',
    ));

    home.add(HomeModel(
      name: 'Prescriptions',
      svgPath: 'svg/drug.svg',
    ));

    home.add(HomeModel(
      name: 'Request\nAmbulance',
      svgPath: 'svg/ambulance.svg',
    ));

    home.add(HomeModel(
      name: 'Profile',
      svgPath: 'svg/profile-round.svg',
    ));

    return home;
  }
}
