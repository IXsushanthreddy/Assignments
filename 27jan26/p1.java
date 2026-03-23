import java.io.*;
import java.util.HashMap;
public class p1 {
    static int cout(String s,String a){
                int c=0;
                for(String d:s.split(" ")){
                    if(d.equals(a)){
                        c=c+1;
                    }

                }
                return c;

            }
    public static void main(String[] args) {
        try (BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(new FileInputStream("C://Users//saina//Downloads//assignments//27jan26//paragraph.txt")))) {
            int charcount=0;
            int wordcount=0;
            int spacecount=0;
            int sentcount=0;
            int paracount=0;
            HashMap<String, Integer> hashMap = new HashMap<>();
            
            String line;
            while((line=bufferedReader.readLine())!=null){
                if(line.equals("")){
                    paracount=paracount+1;
                }



                //replace mutlispace with singlespace
                String l=line;
                String regex="\\s+";
                String repl=" ";
                String Simplespa=l.replaceAll(regex,repl);
                System.out.println(Simplespa);



                //counting characters
                charcount=charcount+line.length();

                //counting words
                String[] words=line.split(" ");
                wordcount=wordcount+words.length;

                //counting spaces
                spacecount=spacecount+wordcount-1;

                //counting sentences
                String[] sentence=line.split("[!?.:]+");
                sentcount=sentcount+sentence.length;
                line=bufferedReader.readLine();
                if(line==null){
                    paracount=paracount+1;

                }  



                //reversing the sentence with same order of words
                StringBuilder res = new StringBuilder();
                for(int i=words.length-1;i>=0;i--){
                    res.append(words[i]).append(" ");
                }
                System.out.println(res);



                //the words which are frequently repating
                int h=1;
                for(String word : words){
                    word=word.toLowerCase();
                    if(hashMap.containsKey(word)){
                        h=hashMap.get(word)+1;
                    }
                    else{
                          
                        hashMap.put(word, h);
                    }
                }
                System.out.println(hashMap);       
            }
            System.out.println("");
            System.out.println("...........................");
            System.out.println(" the no of charaters in file are "+charcount);
            System.out.println("...........................");
            System.out.println("the no of words in file are "+wordcount);
            System.out.println("...........................");
            System.out.println(" the no of spaces in file are "+spacecount);
            System.out.println("...........................");
            System.out.println(" the no of sentences in file are "+sentcount);
            System.out.println("...........................");
            System.out.println(" the no of paragraphs in file are "+paracount);
        } catch (FileNotFoundException e) {
            System.err.println("File not found: paragraph.txt");
            
        } catch (IOException e) {
            System.err.println("An I/O error occurred while reading the file:");
             
        }
    }
    
}
