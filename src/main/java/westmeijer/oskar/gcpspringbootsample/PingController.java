package westmeijer.oskar.gcpspringbootsample;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
public class PingController {

    @GetMapping("/ping")
    public ResponseEntity<Map<String, String>> pingPong() {
        return ResponseEntity.ok(Map.of("response", "pong"));
    }

}
