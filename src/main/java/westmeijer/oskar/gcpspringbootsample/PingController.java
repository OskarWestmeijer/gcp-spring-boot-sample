package westmeijer.oskar.gcpspringbootsample;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;
import java.util.UUID;

@RestController
public class PingController {

    Logger log = LoggerFactory.getLogger(PingController.class);

    @GetMapping("/ping")
    public ResponseEntity<Map<String, String>> pingPong() {
        UUID trace = UUID.randomUUID();
        log.info("Received ping request. Trace: {}", trace);
        return ResponseEntity.ok(Map.of("response", "pong", "trace", trace.toString()));
    }

}
