<template>
  <div class="bg-white shadow rounded-xl p-6 mb-6">
    <h2 class="text-xl font-semibold mb-4">Crear Empleado</h2>
    <form @submit.prevent="crearEmpleado" class="grid grid-cols-2 gap-4">
      <input v-model="form.nombre" type="text" placeholder="Nombre" class="input" required />
      <input v-model="form.email" type="email" placeholder="Email" class="input" required />
      <input v-model="form.area" type="text" placeholder="Área" class="input" required />
      <input v-model="form.fecha_ingreso" type="date" class="input" required />
      <select v-model="form.estado" class="input" required>
        <option value="" disabled>Estado</option>
        <option>Activo</option>
        <option>Inactivo</option>
      </select>
      <button type="submit" class="col-span-2 bg-blue-600 hover:bg-blue-700 text-white py-2 px-4 rounded-xl font-semibold">
        Guardar
      </button>
    </form>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import api from '../services/api'

const emit = defineEmits(['empleadoCreado'])

const form = ref({
  nombre: '',
  email: '',
  area: '',
  fecha_ingreso: '',
  estado: ''
})

const crearEmpleado = async () => {
  try {
    await api.post('', { empleado: form.value })
    emit('empleadoCreado')
    form.value = { nombre: '', email: '', area: '', fecha_ingreso: '', estado: '' }
  } catch (error) {
    console.error(error)
  }
}
</script>

<style scoped>
.input {
  @apply border border-gray-300 rounded-lg px-4 py-2 w-full;
}
</style>
