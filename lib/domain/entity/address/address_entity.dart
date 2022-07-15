class AddressEntity {
  String name;
  String address;
  AddressEntity({required this.name, required this.address});
  static List<AddressEntity> getAddressList() {
    return [
      AddressEntity(
          name: "Glen Dmello1",
          address:
              "NeoSOFT Technology,4th Floor.The Ruby,29,Senapati Bapat Marg,Dadar(West) Mumbai-400-028.INDIA"),
      AddressEntity(
          name: "Glen Dmello2",
          address:
              "NeoSOFT Technology,4th Floor.The Ruby,29,Senapati Bapat Marg,Dadar(West) Mumbai-400-028.INDIA"),
      AddressEntity(
          name: "Glen Dmello3",
          address:
              "NeoSOFT Technology,4th Floor.The Ruby,29,Senapati Bapat Marg,Dadar(West) Mumbai-400-028.INDIA"),
    ];
  }
}
