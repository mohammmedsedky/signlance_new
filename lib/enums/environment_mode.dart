enum EnvironmentMode {
  ///"Dev" for test mode
  dev(0),
  production(1);

  final int mode;

  const EnvironmentMode(this.mode);

  static EnvironmentMode toEnvironmentMode(int mode) => values.firstWhere((element) => element.mode == mode);
}
