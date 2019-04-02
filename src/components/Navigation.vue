<template>
  <nav class="navbar is-light" role="navigation" aria-label="main navigation">
    <div class="navbar-brand">
      <img
        class="logo-format"
        src="https://d2eip9sf3oo6c2.cloudfront.net/tags/images/000/001/036/square_256/vue.png"
      />
      <div class="navbar-item">{{ title }}</div>
      <a
        role="button"
        class="navbar-burger"
        aria-label="menu"
        aria-expanded="false"
        @click="showBurger = !showBurger"
        v-bind:class="{ 'is-active': showBurger }"
      >
        <span></span>
        <span></span>
        <span></span>
      </a>
    </div>
    <div class="navbar-menu" v-bind:class="{ 'is-active': showBurger }">
      <div class="navbar-end">
        <router-link to="/" class="navbar-item is-tab">
          Home
        </router-link>
        <router-link to="/about" class="navbar-item is-tab">
          About
        </router-link>
        <router-link to="/contact" class="navbar-item is-tab">
          Contact
        </router-link>
      </div>
    </div>
  </nav>
</template>

<script lang="ts">
import { Component, Vue } from "vue-property-decorator";

@Component({
  data: function() {
    return {
      title: "App",
      showBurger: false
    };
  }
})
export default class Navigation extends Vue {}
</script>

<style scoped>
.logo-format {
  height: 50px;
  width: 50px;
  padding: 0.75em 0;
  padding-left: 0.75em;
}
</style>
