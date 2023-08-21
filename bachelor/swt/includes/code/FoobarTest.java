import org.junit.jupiter.api.*;

public class FoobarTest {
    @BeforeAll
    public static void setUpClass() throws Exception {
        // Code executed before the first test method
    }

    @BeforeEach
    public void setUp() throws Exception {
        // Code executed before each test
    }

    @Test
    public void oneThing() {
        // Code that tests one thing
    }

    @Test
    public void somethingElse() {
        // Code that tests something else
    }

    @AfterEach
    public void tearDown() throws Exception {
        // Code executed after each test
    }

    @AfterAll
    public static void tearDownClass() throws Exception {
        // Code executed after the last test method
    }
}