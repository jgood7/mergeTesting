public class TestingFile{

    public static void main(String[] args) {
        System.out.println("Hello world");

        double i = 1.0; //Changed to double

        System.out.println(i+3); //Changed usage of i

        greet(); // New method call
    }

    // New method added in the feature branch
    public static void greet() {
        System.out.println("Greetings from delta branch!");
    }
}
