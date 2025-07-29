<template>
  <div class="bg-white shadow rounded-xl p-6">
    <h2 class="text-xl font-semibold mb-4">Listado de Empleados</h2>

    <div class="grid grid-cols-2 gap-4 mb-4">
      <input v-model="filtros.nombre" placeholder="Filtrar por nombre" class="input" />
      <input v-model="filtros.area" placeholder="Filtrar por área" class="input" />
    </div>

    <table class="w-full text-sm text-left text-gray-700 border-t">
      <thead class="bg-gray-100">
        <tr>
          <th class="px-4 py-2">Nombre</th>
          <th class="px-4 py-2">Email</th>
          <th class="px-4 py-2">Área</th>
          <th class="px-4 py-2">Ingreso</th>
          <th class="px-4 py-2">Estado</th>
        </tr>
      </thead>
      <tbody>
        <!-- en v-for hace una iteracion para traer los datos que se vayan creando 1 a 1 -->
        <tr v-for="empleado in empleados" :key="empleado.id" class="border-t hover:bg-gray-50">
          <td class="px-4 py-2">{{ empleado.nombre }}</td>
          <td class="px-4 py-2">{{ empleado.email }}</td>
          <td class="px-4 py-2">{{ empleado.area }}</td>
          <td class="px-4 py-2">{{ empleado.fecha_ingreso }}</td>
          <td class="px-4 py-2">{{ empleado.estado }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script setup>
import { ref, watch, onMounted } from 'vue'
import api from '../services/api'

const empleados = ref([])
const filtros = ref({ nombre: '', area: '' })

const fetchEmpleados = async () => {
  const params = { ...filtros.value }
  try {
    const res = await api.get('') //get url de rails en la carpeta de empleados con apis.js
    empleados.value = res.data
  } catch (error) {
    console.error(error)
  }
}

onMounted(fetchEmpleados)
watch(filtros, fetchEmpleados, { deep: true })
defineExpose({ fetchEmpleados })
</script>

<style scoped>
.input {
  @apply border border-gray-300 rounded-lg px-4 py-2 w-full;
}
</style>
