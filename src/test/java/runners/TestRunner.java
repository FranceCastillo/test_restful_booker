package runners;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.junit5.Karate;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static util.ReportUtil.generateCucumberReport;


class TestRunner {
    final static Logger looger = LoggerFactory.getLogger(TestRunner.class);
    @Test
    void TokenSuccess() {
        Results results = Runner.path("classpath:features/Auth/TokenSuccess.feature")
                .outputCucumberJson(true)
                .parallel(1);
        generateCucumberReport(results.getReportDir(), false);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

    @Test
    void TokenIncorrect() {
        Results results = Runner.path("classpath:features/Auth/TokenIncorrect.feature")
                .outputCucumberJson(true)
                .parallel(1);
        generateCucumberReport(results.getReportDir(), false);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
    @Test
    void GetBookingIds() {
        Results results = Runner.path("classpath:features/Booking/GetBookingIds.feature")
                .outputCucumberJson(true)
                .parallel(1);
        generateCucumberReport(results.getReportDir(), false);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
    @Test
    void GetBooking() {
        Results results = Runner.path("classpath:features/Booking/GetBooking.feature")
                .outputCucumberJson(true)
                .parallel(1);
        generateCucumberReport(results.getReportDir(), false);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
    @Test
    void CreateBooking() {
        Results results = Runner.path("classpath:features/Booking/CreateBooking.feature")
                .outputCucumberJson(true)
                .parallel(1);
        generateCucumberReport(results.getReportDir(), false);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
    @Test
    void UpdateBooking() {
        Results results = Runner.path("classpath:features/Booking/UpdateBooking.feature")
                .outputCucumberJson(true)
                .parallel(1);
        generateCucumberReport(results.getReportDir(), false);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
    @Test
    void PartialUpdateBooking() {
        Results results = Runner.path("classpath:features/Booking/PartialUpdateBooking.feature")
                .outputCucumberJson(true)
                .parallel(1);
        generateCucumberReport(results.getReportDir(), false);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
    @Test
    void DeleteBooking() {
        Results results = Runner.path("classpath:features/Booking/DeleteBooking.feature")
                .outputCucumberJson(true)
                .parallel(1);
        generateCucumberReport(results.getReportDir(), false);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
    @Test
    void HealthCheck() {
        Results results = Runner.path("classpath:features/Ping/HealthCheck.feature")
                .outputCucumberJson(true)
                .parallel(1);
        generateCucumberReport(results.getReportDir(), true);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
}

