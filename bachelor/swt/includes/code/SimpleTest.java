public class SimpleTest {
    @Test
    public void testSum() {
        // Arrange
        int a = 1;
        int b = 2;
        int expected = 3;

        // Act
        int actual = new Simple().sum(a, b);

        // Assert
        assertEquals(expected, actual);
    }
}
