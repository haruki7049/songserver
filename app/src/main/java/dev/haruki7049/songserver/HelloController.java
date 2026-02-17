package dev.haruki7049.songserver;

import java.util.Arrays;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/** A Rest Controller. */
@RestController
public class HelloController {

  /** A definition for index. */
  @GetMapping("/")
  public String index() {
    String[] fruits = {"apple", "orange", "melon"};
    return Arrays.toString(fruits);
  }
}
