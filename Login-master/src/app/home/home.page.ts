import { Component, OnInit } from '@angular/core';

import { HttpClient } from '@angular/common/http';
import { AlertController } from '@ionic/angular';
import { ToastController } from '@ionic/angular';
import { NavigationExtras, Router } from '@angular/router';
import { using } from 'rxjs';
import * as $ from 'jquery';




@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage implements OnInit{
userName:string;
passWord:string;
site:string;
  constructor(private http: HttpClient,public alertController: AlertController,public toastController: ToastController,private router: Router) {}
  ngOnInit(): void {
    
  }
// girisYap(userName,passWord)
// {
//   console.log(this.userName);
//   this.http.get('https://api.github.com/users/'+this.userName).subscribe((response) => {
//     console.log(response);
//     console.log(response['name']+ response['blog'] );
//     this.site=response['blog'];
//     this.presentAlert();
//     this.presentToast();
//     let navigationExtras: NavigationExtras = {
//       queryParams: {
//         special: this.site
//       }
//     };
//     this.router.navigate(['/anasayfa'],navigationExtras);
    
// });
// }

girisYap(kullaniciAdi,sifre)
{
this.userName="admin";
this.passWord="12345";

$.ajax({
type:"POST",
url:"http://localhost:51466/token",
crossDomain:true,
data:{
  'username':this.userName,
  'password':this.passWord,
  'grant_type':'password',
},
headers:{'Content-Type':'application/x-www-form-urlencoded'},
dataType:"json",
success: function(data){ localStorage.setItem('Token',JSON.stringify(data));},
error: function (xhr,status,error){console.log(error);}
});
}

getUser(){
var token=JSON.parse(localStorage.getItem('Token'));
if(token==null){ console.log("Lütfen Giriş Yapınız...")}
else{
var accsesstoken=token.access_token;

$.ajax({
  type:"GET",
  url:"http://localhost:51466/api/Kullanicilar/",
  crossDomain:true,
  headers:{
    "accept":"application/json",
    "content-type":"application/json",
    "authorization":"Bearer "+accsesstoken
  },
  dataType:"json",
  success: function(data){ console.log(data)},
  error: function (xhr,status,error){console.log(error);}
  });

}

}


async presentAlert() {
  const alert = await this.alertController.create({
    
    header: 'Döner Deger',
    subHeader: this.userName,
    message: this.site,
    buttons: ['Peki']
  });

  await alert.present();
}
async presentToast() {
  const toast = await this.toastController.create({
    message:  this.userName +" "+this.site,
    duration: 2000
  });
  toast.present();
}
}


