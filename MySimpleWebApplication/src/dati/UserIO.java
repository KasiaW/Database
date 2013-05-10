package dati;

import java.io.*;
import business.*;

public class UserIO
{
  public synchronized static void addItem(User user, String file)
      throws IOException
  {
    PrintWriter out = new PrintWriter(new FileWriter(file, true));

    out.println(user.getNome() + "-" + user.getCognome() + "-" + user.getEta());
    out.close();
  }
} 