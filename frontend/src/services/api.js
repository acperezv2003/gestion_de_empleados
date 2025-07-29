import axios from 'axios'

//se ajusta el puerto de conexion entre rails y vue en el campo de URL 

const api = axios.create({
  baseURL: 'http://localhost:3000/api',
})

export default api