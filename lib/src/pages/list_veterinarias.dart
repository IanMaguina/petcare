class Vet{
  String title;
  String name;
  String address;
  String image;

  Vet(this.title,this.name,this.address,this.image);

  static List<Vet> vets(){
    return[Vet("Amaperros","Amadores de Perros","Av.Los lirios","img/local1.png"),
    Vet("Rata","Amadores de Perros","Av.Los lirios","img/local2.png"),
    Vet("Sopa","Amadores de Perros","Av.Los lirios","img/local3.png"),
    Vet("Sopa","Amadores de Perros","Av.Los lirios","img/local4.png")];
  }
}