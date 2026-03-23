import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.logging.*;
class InvalidStudentException extends Exception {
    public InvalidStudentException(String message) {
        super(message);
    }
}


public class p5 {
        private static final Logger logger = Logger.getLogger(p5.class.getName());

    public static void main(String[] args){
        String inputFile = "C://Users//saina//Downloads//assignments//27jan26//studentdetails.txt";
        String validFile = "valid.txt";
        String invalidFile = "invalid.txt";
        BufferedReader bufferedReader = null;
        BufferedWriter validWriter = null;
        BufferedWriter invalidWriter = null;
        Set<Integer> studentIds = new HashSet<>();
        List<String> validStudents = new ArrayList<>();
                try {
                    bufferedReader = new BufferedReader(new InputStreamReader(new FileInputStream(inputFile))
            ); 
            validWriter = new BufferedWriter(new FileWriter(validFile));
            invalidWriter = new BufferedWriter(new FileWriter(invalidFile));
            String line = bufferedReader.readLine();

                 while(line!=null){
                     //checking the validity
                    try {
                    processLine(line, studentIds, validStudents, validWriter);
                } catch (InvalidStudentException | NumberFormatException e) {
                    invalidWriter.write(line);
                    invalidWriter.newLine();
                    logger.warning("Invalid record skipped: " + line);
                }
                line = bufferedReader.readLine();
                 }
                 logger.info("Processing completed");
                }
                catch(Exception e){
                    logger.severe("Error: " + e.getMessage());

                }
                finally {
            try {
                if (bufferedReader != null) bufferedReader.close();
                if (validWriter != null) validWriter.close();
                if (invalidWriter != null) invalidWriter.close();
            } catch (IOException e) {
                logger.severe("Closing error");
            }

        }
    }
// validity function
private static void processLine(String line,Set<Integer> studentIds,List<String> validStudents,BufferedWriter validWriter) throws Exception{
    String[] data = line.split(",");
        //checking the n=3 such that each is separated by column
        if (data.length != 3) {
            throw new InvalidStudentException("Invalid format");
        }
        Integer id = Integer.valueOf(data[0].trim()); 
        String name = data[1].trim().replaceAll("\\s+", " ");
        Integer age = Integer.valueOf(data[2].trim());
        if (age < 18) {
            throw new InvalidStudentException("Age below 18");
        }

        if (!studentIds.add(id)) {
            throw new InvalidStudentException("Duplicate student");
        }
        StringBuilder sb = new StringBuilder();
        sb.append(id).append(",").append(name).append(",").append(age);

        validStudents.add(sb.toString());
        validWriter.write(sb.toString());
        validWriter.newLine();
        System.err.println(validStudents);
    }


}
