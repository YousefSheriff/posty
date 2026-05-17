class UserModel
{
  String? name;
  String? email;
  String? phone;
  String? uId;
  String? image;
  String? bio;
  String? dueDate;
  String? selectedDoctor;

  // bool? isTalkToMe;
  // String? lastMessageChat;
  // String? dateTime;
  // String? date;
  // String? time;


  UserModel({
    this.name,
    this.email,
    this.phone,
    this.uId,
    this.image,
    this.bio,
    this.dueDate,
    this.selectedDoctor,
    // this.isTalkToMe,
    // this.lastMessageChat,
    // this.dateTime,
    // this.date,
    // this.time,
  });

  UserModel.fromJson(Map<String,dynamic> json)
  {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    uId = json['uId'];
    image = json['image'];
    bio = json['bio'];
    dueDate = json['dueDate'];
    selectedDoctor = json['selectedDoctor'];
    // isTalkToMe = json['isTalkToMe'];
    // lastMessageChat = json['lastMessageChat'];
    // dateTime = json['dateTime'];
    // date = json['date'];
    // time = json['time'];
  }


  Map<String,dynamic> toMap()
  {
    return {
      'name':name,
      'email':email,
      'phone':phone,
      'uId':uId,
      'image':image,
      'bio':bio,
      'dueDate':dueDate,
      'selectedDoctor':selectedDoctor,
      // 'isTalkToMe':isTalkToMe,
      // 'lastMessageChat':lastMessageChat,
      // 'dateTime':dateTime,
      // 'date':date,
      // 'time':time,
    };
  }

}