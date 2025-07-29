<!-- src/views/EmpleadosView.vue -->
<template>
  <div class="max-w-5xl mx-auto p-6">
    <EmpleadoForm @empleadoCreado="recargar" />
    <EmpleadoTable ref="tablaRef" />
  </div>
</template>

<script setup>
import EmpleadoForm from '../components/EmpleadoForm.vue'
import EmpleadoTable from '../components/EmpleadoTable.vue'
import { ref } from 'vue'

const tablaRef = ref(null)

const recargar = () => {
  tablaRef.value.fetchEmpleados()
}
</script>
