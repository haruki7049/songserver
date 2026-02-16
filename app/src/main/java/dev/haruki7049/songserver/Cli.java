package dev.haruki7049.songserver;

import java.util.concurrent.Callable;
import picocli.CommandLine;

/**
 * CLI (Command Line Interface) handler class for songserver. This class uses picocli to parse
 * command line arguments.
 */
@CommandLine.Command(name = "songserver", mixinStandardHelpOptions = true)
public class Cli implements Callable<Integer> {
  @Override
  public Integer call() throws Exception {
    Runner.run();
    return 0;
  }
}
