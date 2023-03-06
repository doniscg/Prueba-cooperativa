import { Persona } from './../../Modelo/Persona';
import { ServiceService } from './../../Service/service.service';
import { Router } from '@angular/router';
import { Component, OnInit } from '@angular/core';
import{}from '../../Service/service.service'

@Component({
  selector: 'app-listar',
  templateUrl: './listar.component.html',
  styleUrls: ['./listar.component.css']
})
export class ListarComponent implements OnInit {

  personas:Persona[];
  constructor(private service:ServiceService, private router:Router){}

  ngOnInit(){
    this.service.getPersonas()
    .subscribe(data=>{
      this.personas=data;
    });
  }
  Editar(personas:Persona):void{
    localStorage.setItem("id",persona.id.toString());
    this.router.navigate(["edit"]);

  }
  Delete(personas:Persona){
    this.service.deletePersona(personas)
    .subscribe(data=>{
      this.personas=this.personas.filter(p=>p!==personas);
      alert("Usuario Eliminado..");
    })
  }
}


