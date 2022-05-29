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

  void readFileAndConstruct() throws FileNotFoundException {
    board = new int[rows][cols];
    String[] lines = loadStrings(fname);
    for (int i = 0; i < lines.length; i++) {
      String[] rowStr = lines[i].split(" ");   
      int[] row = new int[rowStr.length]; 
      for (int j = 0; j < row.length; j++) {
        row[i] = Integer.parseInt(rowStr[i]);
      }
      board[i] = row;
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

  void display {
    for (int i = 0; i < width(); i++) {
      for (int j = 0; j < height(); j++) {
        if (board[i][j] == 0) {
          fill(51, 51, 0);
          rect(rows * PIXEL_WIDTH, cols * PIXEL_HEIGHT, HEIGHT/rows, WIDTH/cols);
        } else
          fill(102, 102, 0);
        rect(rows * PIXEL_WIDTH, cols * PIXEL_HEIGHT, HEIGHT/rows, WIDTH/cols);
      }
    }
  }
} 
