package dev.haruki7049.songserver;

import java.util.concurrent.Callable;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.stereotype.Component;
import picocli.CommandLine;

/** A CLI component. */
@Component
@CommandLine.Command(name = "songserver", mixinStandardHelpOptions = true, version = "0.1.0")
public class Cli implements Callable<Integer> {
  @Autowired private ApplicationArguments args;
  private static final Logger log = LoggerFactory.getLogger(Cli.class);

  @Override
  public Integer call() {
    return 0;
  }
}
