package business;

public class User
{
  private String nome;
  private String cognome;
  private String eta;

  public User() { }

  public User(String nome, String cognome, String eta)
  {
    this.nome = nome;
    this.cognome = cognome;
    this.eta = eta;
  }

  public void setNome(String nome) { this.nome = nome; }
  public String getNome() { return nome; }

  public void setCognome(String cognome) { this.cognome = cognome; }
  public String getCognome() { return cognome; }

  public void setEta(String eta) { this.eta = eta; }
  public String getEta() { return eta; }
} 