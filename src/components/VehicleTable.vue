<template>
  <div>
    <table class="table-vehicles">
      <thead>
        <tr>
          <th>ID</th>
          <th>Marca</th>
          <th>Color</th>
          <th>Precio</th>
          <th>Turbo</th>
          <th>Tipo</th>
          <th>Motor</th>
          <th>Cabinas</th>
          <th>Sunroof</th>
          <th>Popularidad</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="vehicle in vehicles" :key="vehicle.id">
          <td>{{ vehicle.idAuto }}</td>
          <td>{{ vehicle.marcaAuto }}</td>
          <td>{{ vehicle.colorAuto }}</td>
          <td>{{ vehicle.precioAuto }}</td>
          <td>{{ vehicle.turbo }}</td>
          <td>{{ vehicle.tipoAuto }}</td>
          <td>{{ vehicle.motorAuto }}</td>
          <td>{{ vehicle.cabina }}</td>
          <td>{{ vehicle.sunroof }}</td>
          <td>{{ vehicle.popularidad }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
export default {
  props: {
    vehicles: {
      type: Array,
      required: true,
    },
  },
};
</script>


<style>
.table-vehicles {
  border-collapse: collapse;
  width: 100%;
}

.table-vehicles th,
.table-vehicles td {
  border: 1px solid black;
  padding: 8px;
  text-align: left;
}

.table-vehicles th {
  background-color: #f2f2f2;
}
</style>
