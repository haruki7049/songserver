package dev.haruki7049.songserver;

import java.io.File;
import org.springframework.stereotype.Service;

/** A class to create a Zip file. */
@Service
public class Zipper {

  /** A function to create Zip file. */
  public File createZip() {
    File result = new File("test.txt");
    return result;
  }
}
