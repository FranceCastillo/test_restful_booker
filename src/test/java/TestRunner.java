import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static util.ReportUtil.generateCucumberReport;

class testAuth {

    @Test
    void testAuthIUserValid() {
        Results results =
                Runner.path("classpath:Auth.feature")
                        .tags("@AuthIUserValid")
                        .outputCucumberJson(true)
                        .parallel(2);
        generateCucumberReport(results.getReportDir());
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
}

