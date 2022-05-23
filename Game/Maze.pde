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
  void readFileAndConstruct() {
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
