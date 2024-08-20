<script setup>
import { RouterLink } from 'vue-router';

const pages = [
    ["Home", "/"],
    ["Over ons", "/over-ons"],
    ["Stamblad", "/stamblad"],
    ["Afdelingen", "/afdelingen"]
];
</script>

<template>
    <nav class="flex flex-col sm:flex-row justify-between items-center mb-2">
        <RouterLink to="/">
            <h1 class="font-extrabold m-0 text-2xl text-slate-900">Chiro Stam</h1>
        </RouterLink>
        <ul class="flex gap-1 items-center flex-wrap">
            <RouterLink v-for="page in pages" :key="page[1]" :to="page[1]"
                :class="`font-bold px-1.5 py-0.5 transition-colors duration-75 rounded-md hover:bg-gray-100 cursor-pointer select-none ${page[1] == $route.path ? 'text-red-700' : 'text-slate-600'}`">
                {{ page[0] }}
            </RouterLink>
        </ul>
    </nav>
</template>