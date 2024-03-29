public class Maze {
  private int rows;
  private int cols;
  private int[][] board;
  private String fname; 
  private int[][] copyOfBoard;

  public Maze(String filename, int r, int c) {
    rows = r;
    cols = c;
    fname = filename;
  }

  void readFileAndConstruct() throws FileNotFoundException {
    board = new int[rows][cols];
    copyOfBoard = new int[rows][cols];
    String[] lines = loadStrings(fname);
    for (int i = 0; i < lines.length; i++) {
      String[] rowStr = lines[i].split(" "); 
      int[] row = new int[rowStr.length]; 
      for (int j = 0; j < row.length; j++) {
        row[j] = Integer.parseInt(rowStr[j]);
      }
      board[i] = row;
      copyOfBoard[i] = row;
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

  void display() {
    for (int i = 0; i < width(); i++) {
      for (int j = 0; j < height(); j++) {
        //print(board[i][j]);
        if (board[i][j] == 0) {
          stroke(0);
          strokeWeight(2);
          fill(51, 51, 0);
          rect(j * PIXEL_WIDTH, i * PIXEL_LENGTH, PIXEL_WIDTH, PIXEL_LENGTH);
          strokeWeight(1);
          noStroke();
        } else {
          noStroke();
          fill(102, 102, 0);
          rect(j * PIXEL_WIDTH, i * PIXEL_LENGTH, PIXEL_WIDTH, PIXEL_LENGTH);
        }
      }
    }
  }
} 
