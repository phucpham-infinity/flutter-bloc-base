import 'package:logger/logger.dart';

enum ActiveEnv { dev, staging, prod }

const String env = String.fromEnvironment('ENV');
ActiveEnv activeEnv = ActiveEnv.dev;
bool dev = true;
Level loggerLevel = Level.debug;
const enableCustomAuth = true;

void setEnv() {
  if (env.toUpperCase() == 'STAGING') {
    activeEnv = ActiveEnv.staging;
    dev = true;
  } else if (env.toUpperCase() == 'DEV') {
    activeEnv = ActiveEnv.dev;
    dev = true;
  } else if (env.toUpperCase() == 'PRODUCTION') {
    activeEnv = ActiveEnv.prod;
    dev = false;
  }
  loggerLevel = dev ? Level.debug : Level.nothing;
}
