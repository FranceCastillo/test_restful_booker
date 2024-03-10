package util;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

public class ReportUtil {

    public static void generateCucumberReport(String karateOutputPath, Boolean finalFeature) {
        try {
            Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[]{"json"}, true);
            List<String> jsonPaths = jsonFiles.stream().map(File::getAbsolutePath).collect(Collectors.toList());
            Configuration config = new Configuration(new File("target"), "Cucumber Reports");
            File copied = new File("target/builder/cucumber.json");
            ObjectMapper mapper = new ObjectMapper();
            ArrayNode reportContent;
            if (copied.exists()) {
                reportContent = (ArrayNode) mapper.readTree(copied);
                File jsonFile = new File(jsonPaths.get(0));
                String jsonContent = new String(Files.readAllBytes(Paths.get(jsonFile.getPath())));
                JsonNode newTestContent = mapper.readTree(jsonContent);
                reportContent.add(newTestContent);
                mapper.writerWithDefaultPrettyPrinter().writeValue(copied, reportContent);
            } else {
                FileUtils.copyFile(new File(jsonPaths.get(0)), copied);
            }
            if (finalFeature){
                ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
                reportBuilder.generateReports();
            }
        } catch (IOException ex) {
            throw new RuntimeException(ex);
        }
    }
}
