<template>
  <el-row>
    <el-col :span="10">
      <input
        v-model="text"
        id="amount"
        name="amount"
        type="text"
        :maxlength="maxlength"
        :max="max"
        @paste.prevent
        @input="(v) => formatNumber(v)"
        @blur="formatNumber(text)"
      />
      <span>Output: {{ text }}</span>
    </el-col>
  </el-row>
</template>

<script>
export default {
  name: 'HelloWorld',
  props: {
    value: String,
    maxLength: {
      type: Number,
      default: 15,
    },
    max: {
      type: Number,
      default: 150,
    }
  },
  data() {
    return {
      text: this.value,
    }
  },
  methods: {
    formatNumber(value) {
      const newChart = value.data;
      const intChart = parseFloat(newChart);
      const newValue = value.target.value.split(',').join('');
      const floatValue = newValue ? parseFloat(newValue) : '';
      const isChartNumber = !!newChart && newChart !== '.' && !Number.isNaN(intChart);
      const isDot = !!newChart && newChart === '.' && !!newChart && !newValue.slice(0, newValue.lenght - 1).includes('.');
      let newInput = '';
      if (isChartNumber || isDot) {
        newInput = newValue;
      } else {
        newInput = (Number.isNaN(floatValue) || !floatValue) ? '' : JSON.stringify(floatValue);
      }
      if (newInput) {
        const inputs = newInput.split('.');
        const firstInput = inputs[0].replace(/\D/g, '').replace(/\B(?=(\d{3})+(?!\d))/g, ',');
        const lastInput = inputs[1];
        if (inputs.lenght > 1) {
          this.text = `${firstInput}.${lastInput}`;
        } else {
          this.text = firstInput;
        }
      } else {
        this.text = newInput;
      }
    }
  },
}
</script>
<style scoped>

input {
  border: 1px solid #333;
  border-radius: 5px;
  color: #333;
  font-size: 32px;
  margin: 0 0 20px;
  width: 100%;

}
</style>
