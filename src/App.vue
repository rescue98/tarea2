<template>
  <div>
    <h1>Tienda de vehículos</h1>
    <div>
      <button @click="generateVehicles">Generar vehículos</button>
    </div>
    <div>
      <label for="precioMinimo">Precio mínimo:</label>
      <input type="number" id="precioMinimo" v-model="precioMinimo" :min="8000000" :max="30000000" />
      <label for="precioMaximo">Precio máximo:</label>
      <input type="number" id="precioMaximo" v-model="precioMaximo" :min="8000000" :max="30000000" />
    </div>
    <vehicle-table :vehicles="filteredVehicles" />
  </div>
</template>

<script>
import axios from 'axios';
import VehicleTable from './components/VehicleTable.vue';

export default {
  name: 'App',
  components: {
    VehicleTable,
  },
  data() {
    return {
      cantidad: 0,
      precioMinimo: 8000000,
      precioMaximo: 30000000,
      vehicles: [],
    };
  },
  computed: {
    filteredVehicles() {
      return this.vehicles.filter(
        (vehicle) =>
          vehicle.precioAuto >= this.precioMinimo && vehicle.precioAuto <= this.precioMaximo
      );
    },
  },
  methods: {
    async generateVehicles() {
      try {
        const response = await axios.post('http://localhost:8080/crearAuto', {
          cantidad: this.cantidad,
        });
        this.vehicles = response.data;
      } catch (error) {
        console.log(error);
      }
    },
    async filterVehicles() {
  try {
    const response = await axios.get('http://localhost:8080/filtro', {
      params: {
        precioMinimo: this.precioMinimo,
        precioMaximo: this.precioMaximo,
      },
    });

    if (response.data && response.data.vehiculos) {
      this.vehicles = response.data.vehiculos;
    } else {
      console.log('La respuesta de la API no tiene la propiedad "vehiculos"');
    }
  } catch (error) {
    console.log(error);
  }
},
  },
};
</script>


<style>
header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 20px;
}

.filter-container {
  display: flex;
  align-items: center;
}

button {
  padding: 10px 20px;
  background-color: #007bff;
  color: #fff;
  border: none;
  cursor: pointer;
}

input {
  margin-left: 5px;
  width: 80px;
  padding: 5px;
}
</style>
