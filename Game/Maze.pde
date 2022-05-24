import java.util.Scanner;
public class Maze {
  private int rows;
  private int cols;
  private int[][] board;
  private String fname;

  public Maze(String filename, int r, int c) {
    rows = r;
    cols = c;
    fname = filename;
  }

  void readFileAndConstruct() throws FileNotFoundException{
    board = new int[rows][cols]; 
    File input = new File(fname);
    Scanner s = new Scanner(input);
    for (int row = 0; row < width(); row++) {
      for (int col = 0; col < height(); col++) {
        board[row][col] = s.nextInt();
      }
    }
  }

  int[][] getBoard() {
    return board;
  }

  int width() {
    return rows;
  }

  int height() {
    return cols;
  }
} 
