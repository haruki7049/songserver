package dev.haruki7049.songserver;

import static com.renomad.minum.web.RequestLine.Method.GET;

import com.renomad.minum.utils.StringUtils;
import com.renomad.minum.web.FullSystem;
import com.renomad.minum.web.Response;
import com.renomad.minum.web.WebFramework;
import java.util.logging.Logger;

/** Handles the initialization and execution of the songserver. */
public class Runner {
  private static final Logger logger = Logger.getLogger("songserver");

  /** Runs the main songserver logic. */
  public static void run() {
    FullSystem fs = FullSystem.initialize();
    registerEndpoints(fs.getWebFramework());
    fs.block();
  }

  private static void registerEndpoints(WebFramework webFramework) {
    webFramework.registerPath(GET, "", request -> Response.redirectTo("/index.html"));

    webFramework.registerPath(
        GET,
        "hello",
        request -> {
          String name = request.getRequestLine().queryString().get("name");

          if (name == null || name.isBlank()) {
            return Response.htmlOk("<p>Hi there world!</p>");
          } else {
            String urlEncodedName = StringUtils.encode(name);
            return Response.htmlOk("<p> Hi there " + urlEncodedName + "!</p>");
          }
        });
  }
}
