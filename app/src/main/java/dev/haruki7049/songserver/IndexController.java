package dev.haruki7049.songserver;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/** A Rest Controller. */
@Controller
public class IndexController {

  /** A index function. */
  @RequestMapping("/")
  public ModelAndView index() {
    ModelAndView model = new ModelAndView();
    model.setViewName("index");
    return model;
  }
}
