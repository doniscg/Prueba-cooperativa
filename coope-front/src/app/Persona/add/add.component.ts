import { Persona } from './../../Modelo/Persona';
import { ServiceService } from './../../Service/service.service';
import { Router } from '@angular/router';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-add',
  templateUrl: './add.component.html',
  styleUrls: ['./add.component.css']
})
export class AddComponent implements OnInit{

  constructor(private router:Router, private service:ServiceService){}

  ngOnInit(){
  }

  Guardar(persona:Persona){
    this.service.createPersona(persona)
    .subscribe(data=>{
        alert("Se Agrego con Exito..!!");
        this.router.navigate(["listar"]);
    })
  }
}
