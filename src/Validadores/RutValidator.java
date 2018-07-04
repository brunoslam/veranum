package Validadores;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by kaos on 29-10-15.
 */
public class RutValidator {
 private Pattern pattern;
private Matcher matcher;

private static final String RUT_PATTERN = "^(\\d{2}\\d{3}\\d{3}-)([kK]{1}$|\\d{1}$)";
private static final String RUT_PATTERN2= "^(\\d{1}\\d{3}\\d{3}-)([kK]{1}$|\\d{1}$)";


Pattern    pat = Pattern.compile(RUT_PATTERN);
Pattern    pat2 = Pattern.compile(RUT_PATTERN2);


    /**
     * Validate hex with regular expression
     *
     * @param hex
     *            hex for validation
     * @return true valid hex, false invalid hex
     */
    public boolean validate(final String hex) {
        Boolean val=false;

        Matcher mat=pat.matcher(hex);
        Matcher mat2=pat2.matcher(hex);


        if (!mat.find())
        {

            val = mat2.find();

        }else
        {

            val=true;
        }




        return val;

    }
}