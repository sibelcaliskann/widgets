import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  var tfController=TextEditingController();
  String alinanVeri="";
  String resimAdi="baklava.png";
  bool switchKontrol=false;
  bool checkKontrol=false;
  int radioDeger=0;
  bool progresKontrol=false;
  double ilerleme=30;
  var tfSaat=TextEditingController();
  var tfTarih=TextEditingController();
  var ulkelerListesi=<String>[];
  String secilenUlke="Turkiye"; //default deger turkiye olacak

  @override
  void initState(){
    super.initState();
    ulkelerListesi.add("Turkiye");
    ulkelerListesi.add("Italya");
    ulkelerListesi.add("Japonya");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Widgets"),),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text(alinanVeri),
              TextField(
                controller: tfController,
                decoration: const InputDecoration(hintText: "Veri"),
                keyboardType: TextInputType.number,
                obscureText: false, //girdgin textin gorunur olup olmadigini ayarlar true olursa gorunmez veri
              ),
              TextButton(onPressed: (){
                setState(() {
                  alinanVeri=tfController.text;
                });
              }, child: const Text("Veriyi Al")),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
                  setState(() {
                    resimAdi="kofte.png";
                  });
                }, child: const Text("Resim1")),
                SizedBox(width: 48, height: 48,
                    child: Image.network("http://kasimadalan.pe.hu/yemekler/resimler/$resimAdi")),
                ElevatedButton(onPressed: (){
                  setState(() {
                    resimAdi="ayran.png";
                  });
                }, child: const Text("Resim2")),

              ],),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: 200,
                    child: SwitchListTile(
                        title: const Text("Dart"),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: switchKontrol,
                        onChanged: (veri){
                          setState(() {
                            switchKontrol=veri;
                          });
                        }
                    ),),
                SizedBox(width: 200,
                  child: CheckboxListTile(
                      title: const Text("Flutter"),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: checkKontrol,
                      onChanged: (veri){
                        setState(() {
                          checkKontrol=veri!;
                        });
                      }
                  ),)
              ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 200,
                    child: RadioListTile(
                        title: const Text("Barcelona"),
                        value: 1,
                        groupValue: radioDeger,
                        onChanged: (veri){
                          setState(() {
                            radioDeger=veri!;
                          });
                        }
                    ),),
                  SizedBox(width: 200,
                    child: RadioListTile(
                        title: const Text("Madrid"),
                        value: 2,
                        groupValue: radioDeger,

                        onChanged: (veri){
                          setState(() {
                            radioDeger=veri!;
                          });
                        }
                    ),),
                ],
              ),
              //progresbar kullanimi butona bakinca basliyor duuruyir
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){
                    setState(() {
                      progresKontrol=true;
                    });
                  }, child: const Text("Basla")),
                 Visibility(visible: progresKontrol,child: const CircularProgressIndicator()),
                  ElevatedButton(onPressed: (){
                    setState(() {
                     progresKontrol=false;
                    });
                  }, child: const Text("Dur")),

                ],),
              Text(ilerleme.toInt().toString()),
              Slider(max:100.0,min:0.0,value: ilerleme, onChanged: (veri){
                setState(() {
                  ilerleme=veri;
                });
              }),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 120,
                     child: TextField(controller: tfSaat, decoration: const InputDecoration(hintText: "Saat"),)),
                  IconButton(onPressed: (){
                    showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(DateTime.now()))
                    .then((value) {
                      tfSaat.text="${value!.hour} : ${value.minute}";
                    });
                  } , icon: const Icon(Icons.access_time)),
                  SizedBox(width: 120,
                      child: TextField(controller: tfTarih, decoration: const InputDecoration(hintText: "Tarih"),)),
                  IconButton(onPressed: (){
                    showDatePicker(
                        context: context,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2030))
                        .then((value) {
                          tfTarih.text="${value!.day} / ${value.month} / ${value.year} ";
                    });
                  } , icon: const Icon(Icons.date_range)),
                ],),
              DropdownButton(
                value: secilenUlke,
                  icon: Icon(Icons.arrow_drop_down),
                  items: ulkelerListesi.map((ulke) {
                    return DropdownMenuItem(value: ulke,child: Text(ulke),);
                  }).toList(),
                  onChanged: (veri){
                    setState(() {
                      secilenUlke=veri!;
                    });
                  }
              ),
              GestureDetector(
                onTap: (){
                  print("Container tek tiklandi");
                },
                onDoubleTap: (){
                  print("cift tiklandi");

                },
                onLongPress: (){
                  print("uzerine uzun tiiklandi");
                },
                child: Container(width: 200,height: 300,color: Colors.red)),

              ElevatedButton(onPressed: (){
                print("switch durum: $switchKontrol");
                print("checkboxdurum: $checkKontrol");
                print("radio durum $radioDeger");
                print("slider durum: $ilerleme");
                print("Ulke durum $secilenUlke");
              }, child: const Text("Goster")),

            ],
          ),
        ),
      ),
    );
  }
}
