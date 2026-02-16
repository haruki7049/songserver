package dev.haruki7049.songserver;

import java.util.concurrent.Callable;
import picocli.CommandLine;

/**
 * CLI (Command Line Interface) handler class for songserver. This class uses picocli to parse
 * command line arguments.
 */
@CommandLine.Command(name = "songserver")
public class Cli implements Callable<Integer> {
  /** Option to display the help message. */
  @CommandLine.Option(
      names = {"-h", "--help"},
      description = "show this command's help",
      usageHelp = true)
  boolean showHelp;

  /** Option to display the version information. */
  @CommandLine.Option(
      names = {"-v", "--version"},
      description = "show this command's version",
      versionHelp = true)
  boolean showVersion;

  @Override
  public Integer call() throws Exception {
    return 0;
  }
}
