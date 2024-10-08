export default class TransaccionDAO{
    async add(fecha, monto, concepto, remitente, destinatario){
        let url = "http://localhost/ProjectEpicWeb/BackEnd/controller/transaccionController.php?function=add";
        let formData = new FormData();
        formData.append("fecha", fecha);
        formData.append("monto", monto);
        formData.append("concepto", concepto);
        formData.append("remitente",remitente);
        formData.append("destinatario",destinatario);
        let config = {
            method:"POST",
            body:formData
        }

        let queryResponse = await fetch(url,config);
        let query  = await queryResponse.json();
        return query;
    }
}