<!-- src/App.vue -->
<template>
  <main class="bg-gray-100 min-h-screen py-10">
    <h1 class="text-3xl font-bold text-center mb-10 text-blue-700">Gestion de Empleados</h1>
    <EmpleadosView />
  </main>
</template>

<script setup>
import EmpleadosView from './views/EmpleadosView.vue'
</script>
