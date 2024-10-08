export default class UsuarioDAO{

    async logIn(email,password) {
        let url = "http://localhost/ProjectEpicWeb/BackEnd/controller/usuarioController.php?function=logIn";
        let formData = new FormData();
        formData.append("email",email);
        formData.append("password",password);
        let config = {
            method:"POST",
            body:formData
        }

        let queryResponse = await fetch(url,config);
        let query  = await queryResponse.json();
        return query;
    }

    async add(ci, nombre, apellido, email, telefono, direccion, password){
        let url = "http://localhost/ProjectEpicWeb/BackEnd/controller/usuarioController.php?function=add";
        let formData = new FormData();
        formData.append("ci", ci);
        formData.append("nombre", nombre);
        formData.append("apellido", apellido);
        formData.append("email",email);
        formData.append("telefono",telefono);
        formData.append("direccion",direccion);
        formData.append("password",password);
        let config = {
            method:"POST",
            body:formData
        }

        let queryResponse = await fetch(url,config);
        let query  = await queryResponse.json();
        return query;
    }

    async getSession() {
        let url = "http://localhost/ProjectEpicWeb/BackEnd/controller/usuarioController.php?function=getSession";
        let queryResponse = await fetch(url);
        let query  = await queryResponse.json();
        return query;
    }

    async logOut() {
        let url = "http://localhost/ProjectEpicWeb/BackEnd/controller/usuarioController.phpfunction=logOut";
        let respuestaConsulta = await fetch(url);
        let respuesta  = await respuestaConsulta.json();
        return respuesta;
    }
}